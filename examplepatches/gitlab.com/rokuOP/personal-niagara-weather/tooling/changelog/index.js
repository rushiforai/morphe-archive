/* eslint require-atomic-updates: off */

import verifyChangelog from './lib/verify.js';
import prepareChangelog from './lib/prepare.js';

let verified;

export async function verifyConditions(pluginConfig, context) {
  const {options} = context;
  // If the Changelog prepare plugin is used and has `changelogFile` configured, validate them now in order to prevent any release if the configuration is wrong
  if (options.prepare) {
    const preparePlugin =
      [options.prepare].flat().find((config) => config.path && config.path === '@semantic-release/changelog') ?? {};

    pluginConfig.changelogFile ??= preparePlugin.changelogFile;
  }

  await verifyChangelog(pluginConfig);
  verified = true;
}

export async function prepare(pluginConfig, context) {
  if (!verified) {
    await verifyChangelog(pluginConfig);
    verified = true;
  }

  await prepareChangelog(pluginConfig, context);
}
