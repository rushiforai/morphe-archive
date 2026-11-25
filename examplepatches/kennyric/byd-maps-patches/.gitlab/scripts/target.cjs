"use strict";
const destination = process.env.GITLAB_DESTINATION || (process.env.CI_SERVER_HOST === "gitlab.com" ? "gitlab" : "gitgud");
if (!["gitlab", "gitgud"].includes(destination)) throw new Error("Unsupported GitLab release destination");
const gitlab = destination === "gitlab";
module.exports = {
  BASE: gitlab ? "https://gitlab.com" : "https://gitgud.io",
  REPOSITORY: gitlab ? "johninnld/nl-morphe-patches" : "JohninNL/nl-morphe-patches",
  OWNER: gitlab ? "johninnld" : "JohninNL",
  NAME: gitlab ? "GitLab" : "GitGud",
  TOKEN_KEY: gitlab ? "JOHNINNL_GITLAB_TOKEN" : "JOHNINNL_GITGUD_TOKEN",
  TOKEN_FILE: gitlab ? ".gitlab" : ".gitgud",
  TOKEN_FILE_ENV: gitlab ? "GITLAB_TOKEN_FILE" : "GITGUD_TOKEN_FILE",
  SOURCE_REPOSITORY: "JohninNL/nl-morphe-patches",
};
