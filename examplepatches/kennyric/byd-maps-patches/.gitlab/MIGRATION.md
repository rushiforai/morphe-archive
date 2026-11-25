# GitLab release publishing

Canonical release repository: https://gitlab.com/johninnld/nl-morphe-patches.

GitLab owns stable releases from main and development prereleases from dev.
`.gitlab/gitlab-com.release.config.cjs` retains semantic-release version selection,
source/app-scope guards, exact Git identity checks and generated release metadata.
The publisher builds with the existing Morphe signing key, verifies the signed
bundle before upload, publishes a GitLab generic package and release permalink,
and verifies anonymous Morphe discovery and download bytes after publishing.

Use the protected/masked `JOHNINNL_GITLAB_TOKEN` owned by `johninnld`. Build secrets
are protected/masked and the existing signing identity is mandatory. Local API
commands use `~/.gitlab`; local SSH pushes use `~/gitlab`. Every Git author and
committer remains `johninnl <349981574+johninnl@users.noreply.github.com>`.

Codeberg publication has stopped at the user's request. GitLab publication does
not call its API or wait for a Codeberg release. The old GitGud mirror helper is
retained for historical compatibility and is not the GitLab publishing entrypoint.

Public Morphe source: `https://gitlab.com/johninnld/nl-morphe-patches/-/raw/main/patches-bundle.json`.

GitLab Pages deploys the verified static documentation after the release job.
Its public Pages URL is `https://nl-morphe-patches-ed90fa.gitlab.io/`; README
and in-site metadata use this URL when they are built.
