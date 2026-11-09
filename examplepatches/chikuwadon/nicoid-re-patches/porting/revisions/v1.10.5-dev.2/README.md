# v1.10.5-dev.2 — confirmed comment posting and live display

Development-only validation on top of v1.10.5-dev.1; no official release.

- Require server-generated comment ID, positive comment number and successful API meta.status before reporting a post as successful.
- Add a local playback echo only after server acknowledgement, with safeguards for mismatched videos, duplicate server comments and navigation.
- Keep the canonical server vposMs unchanged; the local preview is scheduled just ahead of the live playback position so users can see it even when POST completes after the original timestamp.
- Reuse CommentUi, continuity, Cast and comment-graph paths instead of adding independent drawing code.
- Never auto-retry a POST with an uncertain outcome. The rest of the v1.10.5-dev.1 compatibility and throttling work is retained.
- Include JVM tests for acknowledgement, invalid responses, echo display, deduplication and cross-video protection.

User device verification is still required for real authenticated posting, normal/popup playback and server re-fetch.
