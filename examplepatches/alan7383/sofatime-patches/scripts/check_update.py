#!/usr/bin/env python3
import argparse
import datetime
import json
import os
import sys
import urllib.request
import urllib.parse

if sys.stdout.encoding and sys.stdout.encoding.lower() != 'utf-8':
    try:
        sys.stdout.reconfigure(encoding='utf-8')
        sys.stderr.reconfigure(encoding='utf-8')
    except AttributeError:
        pass

APP_ID = "com.theclashsoft.sofatime"
PLAY_STORE_URL = f"https://play.google.com/store/apps/details?id={APP_ID}&hl=en"
STATE_FILE = "latest_version.json"


def fetch_play_store_info():
    try:
        from google_play_scraper import app
        res = app(APP_ID, lang="en", country="us")
        return {
            "title": res.get("title", "Sofa Time"),
            "version": res.get("version"),
            "last_updated": res.get("lastUpdatedOn") or str(res.get("updated")),
            "summary": res.get("summary", ""),
            "url": PLAY_STORE_URL
        }
    except Exception as e:
        print(f"Scraper error ({e}), trying fallback...")
        return fetch_play_store_info_fallback()


def fetch_play_store_info_fallback():
    import re
    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"}
    req = urllib.request.Request(PLAY_STORE_URL, headers=headers)
    
    with urllib.request.urlopen(req) as response:
        html = response.read().decode("utf-8")
    
    version_match = re.search(r'\[\[\["(\d+\.\d+\.\d+)"\]\]', html) or re.search(r'"version":\s*"([^"]+)"', html)
    version = version_match.group(1) if version_match else None
    
    return {
        "title": "Sofa Time",
        "version": version,
        "last_updated": datetime.date.today().isoformat(),
        "summary": "Sofa Time app",
        "url": PLAY_STORE_URL
    }


def load_state():
    if os.path.exists(STATE_FILE):
        try:
            with open(STATE_FILE, "r", encoding="utf-8") as f:
                return json.load(f)
        except Exception as e:
            print(f"Error reading {STATE_FILE}: {e}")
    return {}


def save_state(info):
    data = {
        "app_id": APP_ID,
        "version": info["version"],
        "last_updated": info["last_updated"]
    }
    with open(STATE_FILE, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    print(f"Saved state with version {info['version']}")


def check_existing_issue(repo, token, version):
    url = f"https://api.github.com/repos/{repo}/issues?state=all&per_page=50"
    req = urllib.request.Request(url, headers={
        "Authorization": f"Bearer {token}",
        "Accept": "application/vnd.github+json",
        "User-Agent": "sofatime-checker"
    })
    try:
        with urllib.request.urlopen(req) as resp:
            issues = json.loads(resp.read().decode("utf-8"))
            for issue in issues:
                title = issue.get("title", "").lower()
                if f"v{version}" in title or f"v {version}" in title:
                    return True, issue.get("html_url")
    except Exception as e:
        print(f"Error checking issues: {e}")
    return False, None


def create_github_issue(repo, token, info):
    version = info["version"]
    title = f"New Sofa Time update v{version}"
    
    body = f"""A new version of Sofa Time is available on the Play Store.

- App: {info['title']} (`{APP_ID}`)
- Version: `v{version}`
- Updated: {info['last_updated']}
- Play Store link: {PLAY_STORE_URL}

### What's new / Summary
{info['summary'] or 'No summary provided.'}
"""

    url = f"https://api.github.com/repos/{repo}/issues"
    payload = json.dumps({
        "title": title,
        "body": body,
        "labels": ["update", "sofatime"]
    }).encode("utf-8")
    
    req = urllib.request.Request(url, data=payload, headers={
        "Authorization": f"Bearer {token}",
        "Accept": "application/vnd.github+json",
        "Content-Type": "application/json",
        "User-Agent": "sofatime-checker"
    })
    
    try:
        with urllib.request.urlopen(req) as resp:
            result = json.loads(resp.read().decode("utf-8"))
            issue_url = result.get("html_url")
            print(f"Created issue: {issue_url}")
            return issue_url
    except Exception as e:
        print(f"Failed to create issue: {e}")
        sys.exit(1)


def main():
    parser = argparse.ArgumentParser(description="Check Sofa Time Play Store updates")
    parser.add_argument("--dry-run", action="store_true", help="Simulate check without opening issue")
    parser.add_argument("--force", action="store_true", help="Force issue creation")
    args = parser.parse_args()

    print("Checking Play Store for updates...")
    info = fetch_play_store_info()
    
    if not info.get("version"):
        print("Could not get Play Store version")
        sys.exit(1)
        
    print(f"Store version: {info['version']} ({info['last_updated']})")
    
    state = load_state()
    last_version = state.get("version")
    print(f"Last recorded version: {last_version}")

    new_version = (info["version"] != last_version) or args.force
    
    if not new_version:
        print("No new update found")
        if not args.dry_run:
            save_state(info)
        return

    print(f"New update found: v{last_version} -> v{info['version']}")

    github_repo = os.environ.get("GITHUB_REPOSITORY")
    github_token = os.environ.get("GITHUB_TOKEN")

    if args.dry_run:
        print("Dry run mode")
        print(f"Title: New Sofa Time update v{info['version']}")
        print(f"Body:\n{info['summary']}")
        return

    if not github_repo or not github_token:
        print("GITHUB_REPOSITORY or GITHUB_TOKEN not set, updating local state only")
        save_state(info)
        return

    exists, issue_url = check_existing_issue(github_repo, github_token, info["version"])
    if exists and not args.force:
        print(f"Issue for v{info['version']} already exists: {issue_url}")
        save_state(info)
        return

    create_github_issue(github_repo, github_token, info)
    save_state(info)

    if "GITHUB_OUTPUT" in os.environ:
        with open(os.environ["GITHUB_OUTPUT"], "a", encoding="utf-8") as f:
            f.write(f"new_version_detected=true\n")
            f.write(f"version={info['version']}\n")


if __name__ == "__main__":
    main()
