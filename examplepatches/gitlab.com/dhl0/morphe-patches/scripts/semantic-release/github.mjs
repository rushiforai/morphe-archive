import { Buffer } from "node:buffer";
import { spawn } from "node:child_process";
import * as githubPlugin from "@semantic-release/github";

function releaseRepositoryUrl(context) {
  const repositoryUrl = context.env.GITHUB_RELEASE_REPOSITORY_URL;
  if (!repositoryUrl) {
    throw new Error("GITHUB_RELEASE_REPOSITORY_URL is required");
  }
  return repositoryUrl;
}

function releaseContext(context) {
  return {
    ...context,
    options: {
      ...context.options,
      repositoryUrl: releaseRepositoryUrl(context),
    },
  };
}

function runGit(args, context) {
  return new Promise((resolve, reject) => {
    const child = spawn("git", args, {
      cwd: context.cwd,
      env: context.env,
      stdio: ["ignore", "pipe", "pipe"],
    });
    let stderr = "";

    child.stderr.on("data", (chunk) => {
      stderr += chunk.toString();
    });
    child.on("error", reject);
    child.on("close", (code) => {
      if (code === 0) {
        resolve();
      } else {
        reject(new Error(`git ${args[0]} failed: ${stderr.trim()}`));
      }
    });
  });
}

async function pushReleaseTag(context) {
  const token = context.env.GITHUB_TOKEN;
  if (!token) {
    throw new Error("GITHUB_TOKEN is required");
  }

  const tag = context.nextRelease.gitTag;
  const authorization = Buffer.from(`x-access-token:${token}`).toString("base64");
  const env = {
    ...context.env,
    GIT_CONFIG_COUNT: "1",
    GIT_CONFIG_KEY_0: "http.https://github.com/.extraheader",
    GIT_CONFIG_VALUE_0: `AUTHORIZATION: basic ${authorization}`,
  };

  await runGit(
    [
      "push",
      "--",
      releaseRepositoryUrl(context),
      `refs/tags/${tag}:refs/tags/${tag}`,
    ],
    { ...context, env },
  );
  context.logger.log("Pushed tag %s to the GitHub release repository", tag);
}

export async function verifyConditions(pluginConfig, context) {
  return githubPlugin.verifyConditions(pluginConfig, releaseContext(context));
}

export async function publish(pluginConfig, context) {
  await pushReleaseTag(context);
  return githubPlugin.publish(pluginConfig, releaseContext(context));
}

export async function addChannel(pluginConfig, context) {
  await pushReleaseTag(context);
  return githubPlugin.addChannel(pluginConfig, releaseContext(context));
}

export async function success(pluginConfig, context) {
  return githubPlugin.success(pluginConfig, releaseContext(context));
}

export async function fail(pluginConfig, context) {
  return githubPlugin.fail(pluginConfig, releaseContext(context));
}
