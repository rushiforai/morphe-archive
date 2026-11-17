import { CommitParser } from 'conventional-commits-parser';
import { filterRevertedCommitsSync } from 'conventional-commits-filter';
import createPreset from 'conventional-changelog-conventionalcommits';
import { writeChangelogString } from 'conventional-changelog-writer';

// Fallback only: approved releases use the reviewed .github/release-notes/vX.Y.Z.md file.
// This path must use the v10 preset together with the v9 writer; the old
// semantic-release release-notes-generator v14 writer is incompatible with v10.
export async function generateNotes(options, context) {
  const repositoryUrl = context.options.repositoryUrl
    .replace(/\.git$/u, '')
    .replace(/^git@([^:]+):/u, 'https://$1/');
  const parsed = new URL(repositoryUrl);
  const [owner, repository] = parsed.pathname.replace(/^\/|\/$/gu, '').split('/');
  if (!owner || !repository) {
    throw new Error('Invalid repository URL for release notes');
  }

  const preset = createPreset(options.presetConfig ?? {});
  const parser = new CommitParser({
    referenceActions: ['close', 'closes', 'closed', 'fix', 'fixes', 'fixed', 'resolve', 'resolves', 'resolved'],
    issuePrefixes: ['#'],
    ...preset.parser,
    ...options.parserOpts,
  });
  const commits = (context.commits ?? [])
    .filter(({ message }) => typeof message === 'string' && message.trim())
    .map((commit) => ({ ...commit, ...parser.parse(commit.message) }));
  const previousTag = context.lastRelease?.gitTag || context.lastRelease?.gitHead;
  const currentTag = context.nextRelease?.gitTag || context.nextRelease?.gitHead ||
    'v' + context.nextRelease.version;
  const repoUrl = parsed.origin + '/' + owner + '/' + repository;

  return writeChangelogString(
    filterRevertedCommitsSync(commits),
    {
      version: context.nextRelease.version,
      host: parsed.origin,
      owner,
      repository,
      repoUrl,
      previousTag,
      currentTag,
      linkCompare: Boolean(previousTag && currentTag),
      linkReferences: true,
      commit: 'commit',
      issue: 'issues',
    },
    { ...preset.writer, ...options.writerOpts },
  );
}
