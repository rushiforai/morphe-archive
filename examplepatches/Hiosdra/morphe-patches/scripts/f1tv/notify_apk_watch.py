#!/usr/bin/env python3
"""Create deduplicated GitHub alerts for APK updates and monitoring outages."""

import json
import os
from pathlib import Path
import sys
from urllib.request import Request, urlopen


def api(method, path, data=None):
    request = Request(
        f"https://api.github.com/repos/{os.environ['GITHUB_REPOSITORY']}/{path}",
        data=json.dumps(data).encode() if data is not None else None,
        headers={"Authorization": f"Bearer {os.environ['GH_TOKEN']}",
                 "Accept": "application/vnd.github+json", "Content-Type": "application/json",
                 "X-GitHub-Api-Version": "2022-11-28"},
        method=method,
    )
    with urlopen(request, timeout=30) as response:
        return json.load(response)


def notify(result, run_url, assignee, request=api):
    status = result['status']
    if status == 'current':
        return
    if status == 'update':
        title = f"F1 TV APK available: {result['latest']}"
        marker = f"<!-- f1tv-apk-update:{result['latest']} -->"
        body = (f"{marker}\n\nA newer F1 TV mobile APK is listed.\n\n"
                f"- Latest: {result['latest']}\n- Patch target: {result['target']}\n"
                f"- APKMirror: {result['url']}\n\n"
                "Download and validate the APK, then run ingest/stage and patch/device checks.\n"
                "The patch target has not been changed automatically.")
    else:
        title = 'F1 TV APK monitor cannot check for updates'
        marker = '<!-- f1tv-apk-monitor-error -->'
        body = (f"{marker}\n\nThe latest APK version could not be checked. "
                "This does not mean that the patch target is current.\n\n"
                f"Error:\n```text\n{result.get('error', 'Check failed before writing a result')}\n```")
    body += f"\n\nWorkflow run: {run_url}\n"
    # Search every page, including closed update alerts: each version is announced once.
    page = 1
    while True:
        issues = request('GET', f'issues?state=all&per_page=100&page={page}')
        for issue in issues:
            if 'pull_request' in issue or marker not in (issue.get('body') or ''):
                continue
            if status == 'error' and issue['state'] == 'closed':
                request('PATCH', f"issues/{issue['number']}",
                        {'state': 'open', 'body': body, 'assignees': [assignee]})
            print(f"Alert already exists: {issue['html_url']}")
            return
        if len(issues) < 100:
            break
        page += 1
    issue = request('POST', 'issues', {'title': title, 'body': body, 'assignees': [assignee]})
    print(f"Created alert: {issue['html_url']}")


if __name__ == '__main__':
    path = Path(sys.argv[1])
    result = json.loads(path.read_text()) if path.exists() else {'status': 'error'}
    notify(result, os.environ['WATCH_RUN_URL'], os.environ['WATCH_ASSIGNEE'])
