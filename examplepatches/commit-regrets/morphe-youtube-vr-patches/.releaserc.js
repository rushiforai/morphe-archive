/**
 * semantic-release config (JS because the release-notes preset is a wrapper module:
 * .github/scripts/changelog-preset.mjs hides housekeeping types and renders commit
 * bodies into the notes -- the notes are read in Morphe Desktop's "Patch notes" viewer,
 * not only on GitHub; see the wrapper's header for the design).
 *
 * The release-trigger rules and every other plugin block are byte-equal to the JSON
 * .releaserc this file replaced.
 */
export default {
  branches: [
    'main',
    {
      name: 'develop',
      prerelease: true,
    },
  ],
  plugins: [
    [
      '@semantic-release/commit-analyzer',
      {
        releaseRules: [
          { type: 'fix', release: 'patch' },
          { type: 'feat', release: 'minor' },
          { type: 'bump', release: 'patch' },
          { type: 'perf', release: 'patch' },
          { type: 'build', scope: 'Needs bump', release: 'patch' },
        ],
      },
    ],
    [
      '@semantic-release/release-notes-generator',
      {
        config: './.github/scripts/changelog-preset.mjs',
      },
    ],
    [
      '@MorpheApp/changelog',
      {
        releaseJson: {
          path: 'patches-bundle.json',
          downloadUrlTemplate:
            'https://github.com/${owner}/${repo}/releases/download/v${version}/patches-${version}.mpp',
          signatureUrlTemplate: '',
        },
      },
    ],
    'gradle-semantic-release-plugin',
    [
      '@semantic-release/exec',
      {
        prepareCmd:
          './gradlew generatePatchesList ' +
          '&& jq \'.version="${nextRelease.version}"\' patches-list.json > patches-list.json.tmp && mv patches-list.json.tmp patches-list.json ' +
          '&& python3 .github/scripts/generate_patches_readme.py $GITHUB_REPOSITORY $GITHUB_REF_NAME patches-list.json README.md',
      },
    ],
    [
      '@semantic-release/git',
      {
        assets: [
          'CHANGELOG.md',
          'gradle.properties',
          'patches-bundle.json',
          'patches-list.json',
          'README.md',
        ],
        message:
          'chore: Release v${nextRelease.version} [skip ci]\n\n${nextRelease.notes}',
      },
    ],
    [
      '@semantic-release/github',
      {
        assets: [
          {
            path: 'patches/build/libs/patches-!(*sources*|*javadoc*).mpp?(.asc)',
          },
        ],
        successCommentCondition: false,
      },
    ],
    [
      '@cleyrop-org/semantic-release-backmerge',
      {
        backmergeBranches: [{ from: 'main', to: 'develop' }],
        clearWorkspace: true,
      },
    ],
  ],
};
