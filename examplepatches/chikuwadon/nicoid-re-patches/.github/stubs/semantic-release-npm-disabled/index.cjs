'use strict';

// The project publishes MPP assets through GitHub, not npm.
// If a future release config enables the npm plugin, stop rather than silently publishing.
throw new Error('The @semantic-release/npm plugin is intentionally disabled. Review release configuration before enabling npm publication.');
