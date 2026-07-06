export default {
  async fetch(request, env, ctx) {
    const githubOwner = trim(env.GITHUB_OWNER) || "kareemlukitomo";
    const githubRepo = trim(env.GITHUB_REPO) || "morphe-patches";
    const repoHomepage =
      trim(env.REPO_HOMEPAGE) || `https://github.com/${githubOwner}/${githubRepo}`;
    const primaryHost = trim(env.PRIMARY_HOST);
    const requestUrl = new URL(request.url);

    if (primaryHost && requestUrl.hostname !== primaryHost) {
      const redirectUrl = new URL(
        requestUrl.pathname + requestUrl.search,
        `https://${primaryHost}`,
      );
      return Response.redirect(redirectUrl.toString(), 302);
    }

    if (isIconRequest(requestUrl.pathname)) {
      return serveIcon(requestUrl, ctx);
    }

    const route = routeForPath(requestUrl.pathname);
    if (!route) {
      return Response.redirect(repoHomepage, 302);
    }

    const config = {
      owner: githubOwner,
      repo: githubRepo,
      allowedActors: parseAllowedActors(
        trim(env.ALLOWED_GITHUB_ACTORS || env.ALLOWED_GITHUB_ACTOR) ||
          "kareemlukitomo,github-actions[bot]",
      ),
      allowPrerelease: String(env.ALLOW_PRERELEASE || "false") === "true",
      requireSignature: String(env.REQUIRE_SIGNATURE || "true") === "true",
    };

    const cache = caches.default;
    const cacheOrigin = primaryHost ? `https://${primaryHost}` : requestUrl.origin;
    const cacheKey = new Request(
      `${cacheOrigin}${route.cachePath}?v=${WORKER_CACHE_VERSION}&requireSignature=${config.requireSignature ? "1" : "0"}&allowPrerelease=${config.allowPrerelease ? "1" : "0"}`,
    );
    const cached = await cache.match(cacheKey);
    if (cached) return cached;

    const release = await findRelease(config);
    if (!release.ok) {
      return text(release.message, release.status);
    }

    const cacheSeconds = release.value.skippedUnsignedNewer ? 30 : 300;
    const response = await buildResponse(route, release.value, cacheSeconds);
    ctx.waitUntil(cache.put(cacheKey, response.clone()));
    return response;
  },
};

const WORKER_CACHE_VERSION = "5";

const ROUTES = new Map([
  [
    "/",
    {
      cachePath: "/patches-bundle.json",
      kind: "bundle",
    },
  ],
  [
    "/patches.json",
    {
      cachePath: "/patches-bundle.json",
      kind: "bundle",
    },
  ],
  [
    "/patches-list.json",
    {
      asset: "patchesListUrl",
      cachePath: "/patches-list.json",
      contentType: "application/json; charset=utf-8",
      kind: "asset",
    },
  ],
  [
    "/patches-bundle.json",
    {
      cachePath: "/patches-bundle.json",
      kind: "bundle",
    },
  ],
  [
    "/bundle.json",
    {
      cachePath: "/bundle.json",
      kind: "bundle",
    },
  ],
]);

function routeForPath(pathname) {
  let normalized = pathname.replace(/\/+$/, "") || "/";

  // Be forgiving if a user entered the old documented /patches.json URL as
  // the source base and the client app appended /patches-list.json or
  // /patches-bundle.json to it.
  if (normalized.startsWith("/patches.json/")) {
    normalized = normalized.slice("/patches.json".length) || "/patches.json";
  }

  return ROUTES.get(normalized);
}

const ICON_SOURCE_URL =
  "https://www.getmonero.org/press-kit/symbols/monero-symbol-on-white-480.png";

function isIconRequest(pathname) {
  return (
    pathname === "/favicon.ico" ||
    pathname === "/favicon.png" ||
    pathname === "/apple-touch-icon.png"
  );
}

async function serveIcon(requestUrl, ctx) {
  const cache = caches.default;
  const cacheKey = new Request(`${requestUrl.origin}/__icon${requestUrl.pathname}`);
  const cached = await cache.match(cacheKey);
  if (cached) return cached;

  const upstream = await fetch(ICON_SOURCE_URL, {
    headers: {
      "User-Agent": "morphe-patches-worker",
    },
  });

  if (!upstream.ok) {
    return text(`Icon lookup failed: ${upstream.status}`, 502);
  }

  const response = new Response(upstream.body, {
    headers: {
      "content-type": upstream.headers.get("content-type") || "image/png",
      "cache-control": "public, max-age=86400",
    },
  });
  ctx.waitUntil(cache.put(cacheKey, response.clone()));
  return response;
}

async function findRelease(config) {
  const url = `https://github.com/${config.owner}/${config.repo}/releases.atom`;
  const response = await fetch(url, {
    headers: {
      Accept: "application/atom+xml, application/xml;q=0.9, text/xml;q=0.8",
      "User-Agent": "morphe-patches-worker",
    },
  });

  if (!response.ok) {
    return {
      ok: false,
      status: 502,
      message: `GitHub release lookup failed: ${response.status}`,
    };
  }

  const feedText = await response.text();
  const releases = parseReleaseFeed(feedText, config);
  let skippedUnsignedNewer = false;

  for (const release of releases) {
    if (release.prerelease && !config.allowPrerelease) continue;
    if (!config.allowedActors.has(release.author)) continue;

    const signatureExists = await hasAsset(release.signatureUrl);
    if (config.requireSignature && !signatureExists) {
      skippedUnsignedNewer = true;
      continue;
    }

    return {
      ok: true,
      value: {
        ...release,
        signatureExists,
        skippedUnsignedNewer,
      },
    };
  }

  return {
    ok: false,
    status: 503,
    message: "Could not find a release with a signed .mpp bundle that matches the worker policy.",
  };
}

async function buildResponse(route, release, cacheSeconds) {
  if (route.kind === "bundle") {
    const body = JSON.stringify(buildBundle(release), null, 2);
    return json(body, cacheSeconds, release);
  }

  if (route.kind === "asset") {
    return proxyReleaseAsset(release[route.asset], route.contentType, cacheSeconds, release);
  }

  return text("Unknown worker route", 500);
}

function buildBundle(release) {
  return {
    version: release.version,
    created_at: normalizeDateTime(release.publishedAt),
    description: release.name || `Kareem Patches ${release.tagName}`,
    download_url: release.downloadUrl,
    signature_download_url: release.signatureExists ? release.signatureUrl : null,
  };
}

function parseReleaseFeed(feedText, config) {
  const entries = [...feedText.matchAll(/<entry>([\s\S]*?)<\/entry>/g)];
  return entries.map((match) => {
    const entry = match[1];
    const tagName = decodeXml(extract(entry, "title"));
    const version = tagName.replace(/^v/, "");
    const author =
      decodeXml(extract(entry, "author").match(/<name>([\s\S]*?)<\/name>/)?.[1] || "");
    const publishedAt = extract(entry, "updated");
    const baseUrl =
      `https://github.com/${config.owner}/${config.repo}/releases/download/${tagName}`;
    const bundleName = `patches-${version}.mpp`;

    return {
      tagName,
      version,
      author,
      prerelease: isPrereleaseVersion(version),
      publishedAt,
      name: `Kareem Patches ${tagName}`,
      bundleJsonUrl: `${baseUrl}/patches-bundle.json`,
      downloadUrl: `${baseUrl}/${bundleName}`,
      patchesListUrl: `${baseUrl}/patches-list.json`,
      signatureUrl: `${baseUrl}/${bundleName}.asc`,
    };
  });
}

async function proxyReleaseAsset(url, fallbackContentType, cacheSeconds, release) {
  const upstream = await fetch(url, {
    headers: {
      Accept: fallbackContentType,
      "User-Agent": "morphe-patches-worker",
    },
  });

  if (!upstream.ok) {
    return text(`Release asset lookup failed: ${upstream.status}`, 502);
  }

  return new Response(upstream.body, {
    headers: commonHeaders(fallbackContentType, cacheSeconds, release),
  });
}

function extract(entry, tag) {
  return entry.match(new RegExp(`<${tag}[^>]*>([\\s\\S]*?)<\\/${tag}>`))?.[1] || "";
}

function isPrereleaseVersion(version) {
  // CalVer release tags use a commit suffix, for example 26.4.29-9c0c89.
  // Treat that shape as stable even though it contains a hyphen.
  if (/^\d{2}\.\d{1,2}\.\d{1,2}-[0-9a-f]{6}$/.test(version)) {
    return false;
  }

  return /-/.test(version);
}

function normalizeDateTime(value) {
  if (!value) return "1970-01-01T00:00:00";
  return String(value)
    .replace(/\.\d+Z$/, "")
    .replace(/Z$/, "")
    .replace(/[+-]\d\d:\d\d$/, "");
}

function parseAllowedActors(value) {
  return new Set(
    String(value)
      .split(",")
      .map((entry) => entry.trim())
      .filter(Boolean),
  );
}

async function hasAsset(url) {
  try {
    const response = await fetch(url, {
      method: "HEAD",
      headers: {
        "User-Agent": "morphe-patches-worker",
      },
    });
    return response.ok;
  } catch {
    return false;
  }
}

function decodeXml(value) {
  return String(value)
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&amp;/g, "&")
    .replace(/&quot;/g, "\"")
    .replace(/&#39;/g, "'");
}

function text(message, status) {
  return new Response(message, {
    status,
    headers: {
      "content-type": "text/plain; charset=utf-8",
      "cache-control": "no-store",
    },
  });
}

function json(body, cacheSeconds, release) {
  return new Response(body, {
    headers: commonHeaders("application/json; charset=utf-8", cacheSeconds, release),
  });
}

function commonHeaders(contentType, cacheSeconds, release) {
  return {
    "cache-control": `public, max-age=${cacheSeconds}`,
    "content-type": contentType,
    "x-morphe-release-tag": release.tagName,
  };
}

function trim(value) {
  return String(value || "").trim();
}
