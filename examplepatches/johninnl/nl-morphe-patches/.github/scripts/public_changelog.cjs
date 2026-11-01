"use strict";

const {restorePublicLinks} = require("./branded_release_notes.cjs");

exports.verifyConditions = async (config, context) =>
  (await import("@MorpheApp/changelog")).verifyConditions(config, context);

exports.prepare = async (config, context) => {
  // Core clones each hook's input, so repair at the actual writer boundary.
  const nextRelease = {...context.nextRelease, notes: restorePublicLinks(context.nextRelease.notes)};
  return (await import("@MorpheApp/changelog")).prepare(config, {...context, nextRelease});
};
