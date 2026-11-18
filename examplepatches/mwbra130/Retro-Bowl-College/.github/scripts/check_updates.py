#!/usr/bin/env python3
import datetime
import io
import json
import os
import re
import urllib.parse
import urllib.request
import zipfile
from pathlib import Path
from google_play_scraper import app as gp_app

API_BASE = os.environ.get("GITHUB_API_URL", "https://github.com").rstrip("/")
PUBLIC_REPO = os.environ["PUBLIC_REPO"].strip()
PRIVATE_REPO = os.environ["PRIVATE_REPO"].strip()
PUBLIC_TOKEN = os.environ["GITHUB_TOKEN"].strip()
PRIVATE_TOKEN = os.environ["PRIVATE_TOKEN"].strip()

MIN_PATCH_JUMP = 5       # Minimum jump for 3-part patch numbers (1.2.1 -> 1.2.6)
MIN_BUILD_JUMP = 5       # Minimum jump for single build numbers (build-1031 -> build-1036)
MIN_DATE_DAYS_JUMP = 30  # Minimum days jump for YYYYMMDD date versions (VPN Gate, etc.)

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Linux; Android 14; Pixel 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,application/json,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.9",
}


def fetch_url(url, timeout=12):
    req = urllib.request.Request(url, headers=HEADERS)
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        return resp.read().decode("utf-8", "ignore")


def extract_numbers(v):
    clean = re.sub(r"^[vV]", "", str(v).strip())
    return [int(x) for x in re.findall(r"\d+", clean)]


def parse_date_version(nums):
    if len(nums) == 1 and 20200101 <= nums[0] <= 20991231:
        s = str(nums[0])
        try:
            return datetime.date(int(s[:4]), int(s[4:6]), int(s[6:8]))
        except ValueError:
            return None
    return None


def version_sort_key(v):
    nums = extract_numbers(v)
    return tuple(nums) if nums else (0,)


def is_meaningful_update(old_ver, new_ver):
    if not new_ver or not re.search(r"\d", str(new_ver)):
        return False

    old_nums = extract_numbers(old_ver)
    new_nums = extract_numbers(new_ver)
    if not old_nums or not new_nums:
        return False

    # 1. Handle YYYYMMDD date-based versions (e.g., 20261111 -> 20261120)
    old_date = parse_date_version(old_nums)
    new_date = parse_date_version(new_nums)
    if old_date and new_date:
        return (new_date - old_date).days >= MIN_DATE_DAYS_JUMP

    # 2. Handle single-number / build-number versions (e.g., build-1031 -> build-1036)
    if len(old_nums) == 1 and len(new_nums) == 1:
        return (new_nums[0] - old_nums[0]) >= MIN_BUILD_JUMP

    # Pad to 4 segments for standard comparison (Major.Minor.Patch.Build)
    o = (old_nums + [0, 0, 0, 0])[:4]
    n = (new_nums + [0, 0, 0, 0])[:4]

    if n <= o:
        return False

    # Major or Minor increased -> always alert (e.g., 6.10 -> 7.01 or 1.2.0 -> 1.3.0)
    if n[0] > o[0] or n[1] > o[1]:
        return True

    # Patch increased -> alert only if it jumped by MIN_PATCH_JUMP+ (e.g., 1.2.1 -> 1.2.6)
    if (n[2] - o[2]) >= MIN_PATCH_JUMP:
        return True

    # 4th segment (sub-patch/build) increased -> alert only if jumped by 10+
    if (n[3] - o[3]) >= 10:
        return True

    return False



def update_size_label(old_ver, new_ver):
    """Label for how big a missed update is. Handles every version style the
    checker sees: dotted (3.71.0), date-based (20261111), and single build
    numbers (build-1035)."""
    old_nums = extract_numbers(old_ver)
    new_nums = extract_numbers(new_ver)
    if not old_nums or not new_nums:
        return "update: small"

    # Date-based versions (VPN Gate style): classify by days skipped.
    old_date = parse_date_version(old_nums)
    new_date = parse_date_version(new_nums)
    if old_date and new_date:
        days = (new_date - old_date).days
        if days >= 365:
            return "update: huge"
        if days >= 180:
            return "update: large"
        if days >= 60:
            return "update: medium"
        return "update: small"

    # Single build numbers (Poweramp style): classify by the numeric jump.
    if len(old_nums) == 1 and len(new_nums) == 1:
        jump = new_nums[0] - old_nums[0]
        if jump >= 500:
            return "update: huge"
        if jump >= 100:
            return "update: large"
        if jump >= 25:
            return "update: medium"
        return "update: small"

    # Standard dotted versions: classify by which segment moved.
    o = (old_nums + [0, 0, 0, 0])[:4]
    n = (new_nums + [0, 0, 0, 0])[:4]
    if n[0] - o[0] >= 2:
        return "update: huge"
    if n[0] > o[0]:
        return "update: large"
    if n[1] > o[1]:
        return "update: medium"
    return "update: small"

def valid_ver(v):
    if not v:
        return None
    v = str(v).strip()
    if "varies" in v.lower() or not re.search(r"\d", v):
        return None
    if len(v) > 32:
        return None
    return v


# --- 15 Fallback Version Sources ---

def src_google_play_scraper(pkg):
    info = gp_app(pkg, lang="en", country="us")
    return valid_ver(info.get("version"))


def src_google_play_deep_html(pkg):
    html = fetch_url(f"https://google.com{pkg}&hl=en&gl=US")
    matches = re.findall(r'\[\[\["(\d+\.\d+(?:\.\d+)*(?:-[a-zA-Z0-9.]+)?)"\]\]', html)
    for m in matches:
        if not m.startswith(("19.", "20.", "21.", "22.", "23.", "24.", "25.")):
            return valid_ver(m)
    return None


def src_aptoide_api_search(pkg):
    raw = fetch_url(f"https://aptoide.com{urllib.parse.quote(pkg)}&limit=5")
    data = json.loads(raw)
    for item in data.get("datalist", {}).get("list", []):
        if item.get("package") == pkg:
            return valid_ver(item.get("file", {}).get("vername"))
    return None


def src_aptoide_api_meta(pkg):
    raw = fetch_url(f"https://aptoide.com{urllib.parse.quote(pkg)}")
    data = json.loads(raw)
    return valid_ver(data.get("data", {}).get("file", {}).get("vername"))


def src_apkmirror_feed(pkg):
    xml = fetch_url(f"https://apkmirror.com{pkg}/feed/")
    m = re.search(r"<title>[^<]*?(\d+\.\d+(?:\.\d+)*)[^<]*?</title>", xml)
    return valid_ver(m.group(1)) if m else None


def src_apkmirror_search_feed(pkg):
    xml = fetch_url(f"https://apkmirror.com{urllib.parse.quote(pkg)}&post_type=app_release&feed=rss2")
    for title in re.findall(r"<title>(.*?)</title>", xml)[1:]:
        m = re.search(r"(\d+\.\d+(?:\.\d+)*)", title)
        if m:
            return valid_ver(m.group(1))
    return None


def src_apkpure_rss(pkg):
    xml = fetch_url(f"https://apkpure.com{pkg}/feed")
    m = re.search(r"(\d+\.\d+(?:\.\d+)*)", xml)
    return valid_ver(m.group(1)) if m else None


def src_apkpure_direct(pkg):
    html = fetch_url(f"https://apkpure.net{pkg}")
    m = re.search(r'class="version-name"[^>]*>([^<]+)<', html) or re.search(r'data-dt-version="([^"]+)"', html)
    return valid_ver(m.group(1)) if m else None


def src_apkcombo(pkg):
    html = fetch_url(f"https://apkcombo.com{pkg}/")
    m = re.search(r'class="vername"[^>]*>([^<]+)<', html) or re.search(r'"softwareVersion"\s*:\s*"([^"]+)"', html)
    return valid_ver(m.group(1)) if m else None


def src_apkmonk(pkg):
    html = fetch_url(f"https://apkmonk.com{pkg}/")
    m = re.search(r'Version\s*</td>\s*<td[^>]*>([^<]+)<', html, re.I) or re.search(r'"softwareVersion"\s*:\s*"([^"]+)"', html)
    return valid_ver(m.group(1)) if m else None


def src_apkfollow(pkg):
    html = fetch_url(f"https://apkfollow.com{pkg}/")
    m = re.search(r'"softwareVersion"\s*:\s*"([^"]+)"', html)
    return valid_ver(m.group(1)) if m else None


def src_apkfab(pkg):
    html = fetch_url(f"https://apkfab.com{pkg}")
    m = re.search(r'"softwareVersion"\s*:\s*"([^"]+)"', html) or re.search(r'class="ver"[^>]*>([^<]+)<', html)
    return valid_ver(m.group(1)) if m else None


def src_apk_support(pkg):
    html = fetch_url(f"https://apk.support{pkg}")
    m = re.search(r'"softwareVersion"\s*:\s*"([^"]+)"', html) or re.search(r'Version:\s*<[^>]+>([^<]+)<', html)
    return valid_ver(m.group(1)) if m else None


def src_uptodown_search(pkg):
    html = fetch_url(f"https://uptodown.com{urllib.parse.quote(pkg)}")
    m = re.search(r'class="version"[^>]*>([^<]+)<', html)
    return valid_ver(m.group(1)) if m else None


def src_fdroid_api(pkg):
    raw = fetch_url(f"https://f-droid.org{pkg}")
    data = json.loads(raw)
    packages = data.get("packages", [])
    if packages:
        return valid_ver(packages[0].get("versionName"))
    return None


SOURCES = [
    ("GooglePlayAPI", src_google_play_scraper),
    ("AptoideMetaAPI", src_aptoide_api_meta),
    ("AptoideSearchAPI", src_aptoide_api_search),
    ("APKMirrorSearchRSS", src_apkmirror_search_feed),
    ("APKMirrorAppRSS", src_apkmirror_feed),
    ("GooglePlayDeepHTML", src_google_play_deep_html),
    ("APKPureDirect", src_apkpure_direct),
    ("APKPureRSS", src_apkpure_rss),
    ("APKCombo", src_apkcombo),
    ("APKMonk", src_apkmonk),
    ("APKFollow", src_apkfollow),
    ("APKFab", src_apkfab),
    ("APKSupport", src_apk_support),
    ("Uptodown", src_uptodown_search),
    ("FDroid", src_fdroid_api),
]


def get_latest_version(pkg):
    for src_name, fn in SOURCES:
        try:
            ver = fn(pkg)
            if ver:
                return ver, src_name
        except Exception:
            continue
    return None, None


# --- GitHub API & Main Execution ---

def github_api(repo, token, path, method="GET", body=None):
    url = f"{API_BASE}/repos/{repo}{path}"
    data = json.dumps(body).encode("utf-8") if body else None
    req = urllib.request.Request(
        url,
        data=data,
        method=method,
        headers={
            "Authorization": f"Bearer {token}",
            "Accept": "application/vnd.github+json",
            "Content-Type": "application/json",
            "User-Agent": "morphe-apk-checker",
        },
    )
    with urllib.request.urlopen(req, timeout=20) as resp:
        return json.loads(resp.read().decode("utf-8"))


def load_patches_json():
    local_file = Path("patches-list.json")
    if local_file.exists():
        return json.loads(local_file.read_text(encoding="utf-8"))

    latest = github_api(PUBLIC_REPO, PUBLIC_TOKEN, "/releases/latest")
    for asset in latest.get("assets", []):
        name = asset["name"]
        if name == "patches-list.json":
            req = urllib.request.Request(asset["browser_download_url"], headers=HEADERS)
            with urllib.request.urlopen(req, timeout=20) as resp:
                return json.loads(resp.read().decode("utf-8"))
        if name.endswith(".mpp"):
            req = urllib.request.Request(asset["browser_download_url"], headers=HEADERS)
            with urllib.request.urlopen(req, timeout=30) as resp:
                mpp_bytes = resp.read()
            with zipfile.ZipFile(io.BytesIO(mpp_bytes)) as zf:
                if "patches-list.json" in zf.namelist():
                    return json.loads(zf.read("patches-list.json").decode("utf-8"))
    return None


data = load_patches_json()
if not data:
    print("Could not find patches-list.json in repo or latest .mpp release.")
    exit(0)

patches = data if isinstance(data, list) else data.get("patches", [])
print(f"Loaded {len(patches)} patches from release metadata.")

open_issues = github_api(PRIVATE_REPO, PRIVATE_TOKEN, "/issues?state=open&per_page=100")

checked = {}
for patch in data.get("patches", []):
    for cp in patch.get("compatiblePackages") or []:
        pkg = cp["packageName"]
        name = cp.get("name") or pkg
        targets = [t["version"] for t in cp.get("targets", []) if t.get("version")]
        if not targets or pkg in checked:
            continue
        latest_supported = sorted(targets, key=version_sort_key)[-1]
        checked[pkg] = (name, latest_supported)

for pkg, (name, supported_ver) in checked.items():
    play_ver, source_used = get_latest_version(pkg)
    if not play_ver or not is_meaningful_update(supported_ver, play_ver):
        print(f"{name}: supported={supported_ver}, latest={play_ver} (via {source_used})")
        continue

    if any(f"({pkg})" in issue["title"] for issue in open_issues):
        print(f"Open update issue already exists for {name} ({pkg})")
        continue

    clean_tag = play_ver if str(play_ver).lower().startswith("v") else f"v{play_ver}"
    issue_title = f"Update {name} ({pkg}) to {clean_tag}"
    size_label = update_size_label(supported_ver, play_ver)
    print(f"Opening issue in {PRIVATE_REPO}: {issue_title} [{size_label}]")
    created = github_api(
        PRIVATE_REPO,
        PRIVATE_TOKEN,
        "/issues",
        method="POST",
        body={
            "title": issue_title,
            "labels": ["app-update", size_label],
            "body": (
                f"### Meaningful APK Update Detected\n\n"
                f"- **App:** {name}\n"
                f"- **Package:** `{pkg}`\n"
                f"- **Currently Supported:** `{supported_ver}`\n"
                f"- **Latest Version Found:** `{play_ver}`\n"
                f"- **Update Size:** `{size_label}`\n\n"
                f"*Auto-generated by the daily APK version tracker (ignores minor hotfixes).*"
            ),
        },
    )
    open_issues.append(created)
    print(f"Created issue #{created.get('number')}: {created.get('html_url')}")

print(f"Done. Checked {len(checked)} apps.")
