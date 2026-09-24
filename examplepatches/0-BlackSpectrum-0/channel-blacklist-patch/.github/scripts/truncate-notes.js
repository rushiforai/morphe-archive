/**
 * Semantic-release plugin to ensure release notes do not exceed GitHub's API character limit (125,000 chars).
 */
function truncate(context) {
  if (context && context.nextRelease && context.nextRelease.notes && context.nextRelease.notes.length > 100000) {
    const log = context.logger?.log ? context.logger.log.bind(context.logger) : console.log;
    log(`Truncating release notes from ${context.nextRelease.notes.length} to 100000 characters to comply with GitHub API limits.`);
    context.nextRelease.notes = context.nextRelease.notes.slice(0, 100000) + '\n\n...*(Release notes truncated due to GitHub API character limit)*';
  }
}

module.exports = {
  prepare: async (_pluginConfig, context) => {
    truncate(context);
  },
  publish: async (_pluginConfig, context) => {
    truncate(context);
  }
};
