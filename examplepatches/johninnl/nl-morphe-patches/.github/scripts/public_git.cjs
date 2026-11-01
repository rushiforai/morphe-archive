"use strict";

const {restorePublicLinks} = require("./branded_release_notes.cjs");

exports.verifyConditions = async (config, context) =>
  (await import("@semantic-release/git")).verifyConditions(config, context);

exports.prepare = async (config, context, load = name => import(name)) => {
  const nextRelease = {...context.nextRelease, notes: restorePublicLinks(context.nextRelease.notes)};
  return (await load("@semantic-release/git")).prepare(config, {...context, nextRelease});
};
