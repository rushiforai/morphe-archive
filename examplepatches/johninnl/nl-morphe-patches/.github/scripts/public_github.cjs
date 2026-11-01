"use strict";

const {restorePublicLinks} = require("./branded_release_notes.cjs");

function createHooks(load = name => import(name)) {
  return Object.fromEntries(["verifyConditions", "publish", "addChannel", "success", "fail"].map(hook =>
    [hook, async (config, context) => {
      // A prepare commit regenerates and masks notes again. Restore public URLs
      // inside this hook, immediately before the unchanged publisher reads them.
      const input = hook === "publish" ? {...context, nextRelease: {
        ...context.nextRelease, notes: restorePublicLinks(context.nextRelease.notes),
      }} : context;
      return (await load("@semantic-release/github"))[hook](config, input);
    }]));
}

module.exports = {...createHooks(), createHooks};
