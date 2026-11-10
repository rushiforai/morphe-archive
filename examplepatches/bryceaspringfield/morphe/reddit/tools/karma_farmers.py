#!/usr/bin/env python3
"""Builds the list of accounts Bot Bouncer flags as bots or karma farmers.

Bot Bouncer posts each account it flags to r/BotBouncer, titled "Overview for NAME" and flaired with its status. This
script reads those posts from the Arctic Shift archive (https://arctic-shift.photon-reddit.com), keeps the accounts
flaired banned, merges them into the previous list, and writes one lowercase name a line, gzipped and sorted.

    karma_farmers.py OUT.txt.gz [--previous OLD.txt.gz] [--days 365] [--workers 1]

--workers splits the period into that many time ranges, read in parallel.

The previous file's first line, "# after <unix time>", is where the next run resumes.
"""
import argparse
import concurrent.futures
import gzip
import json
import time
import urllib.parse
import urllib.request

API = "https://arctic-shift.photon-reddit.com/api/posts/search"
AGENT = "reddit-keyword-filter-list/1.0 (+https://github.com/bryceaspringfield/morphe)"
PREFIX = "Overview for "


def fetch(after, before=None):
    params = {"subreddit": "BotBouncer", "after": after, "sort": "asc", "limit": "auto",
              "fields": "title,link_flair_text,created_utc"}
    if before:
        params["before"] = before
    query = urllib.parse.urlencode(params)
    for attempt in range(30):
        try:
            request = urllib.request.Request(API + "?" + query, headers={"User-Agent": AGENT})
            with urllib.request.urlopen(request, timeout=120) as answer:
                data = json.load(answer)
            if data.get("error"):
                raise RuntimeError(data["error"])
            return data.get("data") or []
        except Exception as ex:
            wait = min(60, 10 * (attempt + 1))
            print(f"retry after {wait} s: {ex}", flush=True)
            time.sleep(wait)
    raise RuntimeError("the archive did not answer")


def read_range(after, before, label):
    """Names flaired banned in posts made after `after` and before `before` (None: now); returns names, last time."""
    names, pages, last_seen = set(), 0, after
    while True:
        posts = fetch(after, before)
        if not posts:
            break
        pages += 1
        for post in posts:
            title = post.get("title") or ""
            if title.startswith(PREFIX) and (post.get("link_flair_text") or "").lower() == "banned":
                names.add(title[len(PREFIX):].strip().lower())
        last = max(int(p["created_utc"]) for p in posts)
        if last <= after:
            break
        after = last_seen = last
        if pages % 50 == 0:
            print(f"{label}: {pages} pages, {len(names)} names, at {time.strftime('%Y-%m-%d %H:%M', time.gmtime(after))} UTC", flush=True)
        time.sleep(1)
    return names, last_seen


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("out")
    parser.add_argument("--previous")
    parser.add_argument("--days", type=int, default=365)
    parser.add_argument("--workers", type=int, default=1)
    args = parser.parse_args()

    names, after = set(), int(time.time()) - args.days * 86400
    if args.previous:
        with gzip.open(args.previous, "rt") as f:
            first = f.readline().split()
            if first[:2] == ["#", "after"]:
                after = int(first[2])
            names.update(line.strip() for line in f if line.strip())
    start, now = len(names), int(time.time())
    # Each worker reads one time range; the last range is open-ended, and its last post sets the next run's start.
    edges = [after + (now - after) * i // args.workers for i in range(args.workers)] + [None]
    with concurrent.futures.ThreadPoolExecutor(args.workers) as pool:
        results = list(pool.map(lambda i: read_range(edges[i], edges[i + 1], f"range {i + 1}"), range(args.workers)))
    for found, _ in results:
        names |= found
    resume = max(after, results[-1][1])
    with gzip.open(args.out, "wt") as f:
        f.write(f"# after {resume}\n")
        f.writelines(n + "\n" for n in sorted(names))
    print(f"{len(names)} names ({len(names) - start} new)")


if __name__ == "__main__":
    main()
