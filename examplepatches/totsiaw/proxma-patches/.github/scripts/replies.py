"""Bot reply templates. The first line of each is an HTML marker used for dedup."""

import os

REPO = os.environ.get("GITHUB_REPOSITORY", "totsiaw/proxma-patches")
NEW_ISSUE = f"https://github.com/{REPO}/issues/new?template="

ALL_FORMS = "\n".join([
    f"- [Patching failed]({NEW_ISSUE}bug_report.yml): patching won't start, stops with an error, or the APK won't install",
    f"- [Patched app broken]({NEW_ISSUE}not_working.yml): the app crashes or a patch does nothing",
    f"- [Feature request]({NEW_ISSUE}feature_request.yml): another patch for this app",
    f"- [App update request]({NEW_ISSUE}app_update.yml): a newer app version",
])


def release_link(tag):
    label = tag if tag.startswith("v") else f"v{tag}"
    return f"[{label}](https://github.com/{REPO}/releases/tag/{tag})"


def shipped_prerelease(app, tag):
    return (
        "<!-- proxma-prerelease -->\n"
        f"{app} has been added in the pre-release {release_link(tag)}. "
        "Please try it and reply whether it works. "
        "This discussion closes when it reaches a stable release."
    )


def shipped_stable(app, tag):
    return (
        "<!-- proxma-shipped -->\n"
        f"{app} has been added in {release_link(tag)}. This discussion is now closed.\n\n"
        f"For anything else about {app}, open an issue:\n\n"
        f"{ALL_FORMS}"
    )


def version_bump(app, version, tag, prerelease):
    channel = "pre" if prerelease else "stable"
    head = f"<!-- proxma-version-bump:{version}:{channel} -->\n"
    if prerelease:
        return head + (
            f"{app} {version} is supported in the pre-release {release_link(tag)}. "
            "Please try it and reply whether it works."
        )
    return head + (
        f"{app} {version} is supported in {release_link(tag)}. "
        "If it works for you, feel free to close this issue."
    )


def closed_issue_reply():
    return (
        "<!-- proxma-closed-redirect -->\n"
        "This issue is closed. If you're hitting a new problem, "
        "please open a new issue so it gets its own thread:\n\n"
        f"{ALL_FORMS}"
    )


def status_ping_reply():
    return (
        "<!-- proxma-status-ping -->\n"
        "No ETA on this yet. Any progress will be posted here."
    )
