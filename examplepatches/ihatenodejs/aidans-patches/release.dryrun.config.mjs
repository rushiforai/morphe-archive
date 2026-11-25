/**
 * Offline semantic-release config for `--dry-run` only.
 *
 * Keep this limited to the plugins that resolve a version and release notes.
 * Any prepare/publish/success plugin (git, github, gradle, exec, changelog,
 * backmerge) would perform side effects and must never be added here.
 *
 * Usage: ./node_modules/.bin/semantic-release --dry-run \
 *   --extends ./release.dryrun.config.mjs
 *
 * The release rules and notes preset mirror `.releaserc`; keep them in sync.
 */
export default {
  branches: [
    'release/main',
    { name: 'release/dev', prerelease: 'dev', channel: 'dev' },
  ],
  plugins: [
    [
      '@semantic-release/commit-analyzer',
      {
        releaseRules: [
          { header: 'initial commit', release: 'patch' },
          { type: 'fix', release: 'patch' },
          { type: 'feat', release: 'minor' },
          { type: 'bump', release: 'patch' },
          { type: 'perf', release: 'patch' },
          { type: 'build', scope: 'Needs bump', release: 'patch' },
          { scope: 'site', release: false },
          { scope: 'worker', release: false },
          { scope: 'apk-lab', release: false },
          { scope: 'audit', release: false },
          { scope: 'ci', release: false },
          { scope: 'docs', release: false },
          { scope: 'release', release: false },
          { scope: 'icons', release: false },
          { scope: 'deps', release: false },
        ],
      },
    ],
    [
      '@semantic-release/release-notes-generator',
      {
        preset: 'conventionalcommits',
        presetConfig: {
          types: [
            { type: 'fix', section: '🐛 Bug Fixes', hidden: false },
            { type: 'feat', section: '✨ New Features', hidden: false },
            { type: 'bump', section: '🚀 Updated App Support', hidden: false },
            { type: 'perf', section: '🔧 Improvements', hidden: false },
            { type: 'build', hidden: true },
          ],
        },
      },
    ],
  ],
};
