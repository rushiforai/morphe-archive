import assert from "node:assert/strict";
import test from "node:test";
import worker from "../src/index.js";
import { bundleImportPath, reseamNativeImportPath, bundleTypeLabel, Catalog } from "../../shared/catalog.js";
import { fixture } from "./fixture.js";

async function call(state, path) {
  const response = await worker.fetch(new Request("https://api.test" + path), state.env);
  return { status: response.status, body: await response.json() };
}
test("old catalog family names migrate after integrity verification", async () => {
  const original = fixture();
  const old = { ...original.bundle, bundle_type: "ReVanced:V4" };
  const state = fixture({ "bundles.json": [old], ["bundles/" + old.id + ".json"]: old });
  const catalog = await new Catalog("https://example.test/database/", state.env.FETCH).initialize();
  assert.equal((await catalog.bundles())[0].bundle_type, "ReVanced:v22");
  assert.equal((await catalog.file("bundles/" + old.id + ".json")).bundle_type, "ReVanced:v22");
  assert.equal(bundleTypeLabel("ReVanced:V3"), "ReVanced v21");
  assert.equal(bundleTypeLabel("ReVanced:v22"), "ReVanced v22");
  assert.equal(bundleTypeLabel("Morphe:V1"), "Morphe");
  assert.equal(bundleTypeLabel("Morphe:V2"), "Morphe");
});
test("Reseam imports use the signed publisher's native index, with channel and pinning", async () => {
  const original = fixture();
  const publisher = { name: "patches", author: "Example", description: "Apps", public_key: "a".repeat(64) };
  const bundle = { ...original.bundle, bundle_type: "Reseam", ecosystem: "reseam",
    download_url: "https://example.test/patches.reseam", reseam_bundle: publisher };
  const state = fixture({ "bundles.json": [bundle], ["bundles/" + bundle.id + ".json"]: bundle });
  const card = { bundleType: "Reseam", sourceUrl: original.bundle.source?.url ?? "https://github.com/owner/repo",
    version: bundle.version, isPrerelease: false };
  const latest = await call(state, bundleImportPath(card));
  assert.equal(latest.status, 200);
  assert.equal(latest.body.bundle.public_key, publisher.public_key);
  assert.equal(latest.body.releases[0].download_url, bundle.download_url);
  assert.equal((await call(state, bundleImportPath(card, true))).body.releases[0].version, "v1");
  assert.equal((await call(state, "/bundles?bundle_type=Reseam")).body.data.length, 1);
  assert.equal((await call(state, "/bundles?ecosystem=reseam")).body.data.length, 1);
  assert.equal((await call(state, "/patches?bundle_type=Reseam")).body.data.length, 1);
  const failed = { ...bundle, metadata_status: "unverified" };
  const unavailable = fixture({ "bundles.json": [failed], ["bundles/" + failed.id + ".json"]: failed });
  assert.equal((await call(unavailable, bundleImportPath(card))).status, 503);
  assert.equal((await call(original, bundleImportPath(card))).status, 404);
});

test("Reseam native JSON endpoint preserves publisher patch IDs and full release notes", async () => {
  const original=fixture();
  const publisher={name:"reseam-patches",author:"Reseam",description:"Patches",public_key:"a".repeat(64)};
  const bundle={...original.bundle,version:"v0.34.0",bundle_type:"Reseam",ecosystem:"reseam",
    reseam_bundle:publisher,download_url:"https://api.reseam.app/patches/v0.34.0/reseam-patches.reseam"};
  const upstream={bundle:{...publisher,homepage:"https://reseam.app"},releases:[{
    version:"0.34.0",created_at:bundle.created_at,description:"- feat: official changelog",
    download_url:bundle.download_url,prerelease:false,patches:[{
      bundle:"reseam-patches",id:"app.reseam.patches.tiktok.feed.feedFilter",
      name:"app.reseam.patches.tiktok.feed.feedFilter",hidden:true,
      description:"",enabled_by_default:false,dependencies:[],compatibility:{kind:"universal"},options:[]
    }]}]};
  const calls=[];
  const state=fixture({"bundles.json":[bundle],["bundles/"+bundle.id+".json"]:bundle});
  state.env.RESEAM_RELEASE_FETCH=async (url, options)=>{
    calls.push(url);
    assert.equal(options.redirect,"manual");
    return Response.json(upstream);
  };
  const card={bundleType:"Reseam",sourceUrl:"https://github.com/owner/repo",version:bundle.version,isPrerelease:false};
  const path=reseamNativeImportPath(card,true);
  assert.match(path,/^\/api\/reseam\/patches\.json\?/);
  const result=await call(state,path);
  assert.equal(result.status,200);
  assert.deepEqual(result.body,upstream);
  // Native indexes include patch inventories only on their primary release.
  const older = {...upstream.releases[0], version:"0.33.0"};
  delete older.patches;
  const historicalIndex = {...upstream, releases:[upstream.releases[0], older]};
  state.env.RESEAM_RELEASE_FETCH=async()=>Response.json(historicalIndex);
  assert.deepEqual((await call(state,path)).body,historicalIndex);
  for (const releases of [
    [upstream.releases[0], {...older, patches:null}],
    [upstream.releases[0], {...older, patches:{}}],
    [upstream.releases[0], {...upstream.releases[0], version:"v0.34.0"}]
  ]) {
    state.env.RESEAM_RELEASE_FETCH=async()=>Response.json({...upstream,releases});
    assert.equal((await call(state,path)).status,502);
  }
  // Early native indexes are valid Manager sources without any inline lists.
  const legacyIndex = {...upstream,releases:[{...older,version:"0.34.0"}]};
  state.env.RESEAM_RELEASE_FETCH=async()=>Response.json(legacyIndex);
  assert.deepEqual((await call(state,path)).body,legacyIndex);
  assert.deepEqual(calls,["https://github.com/owner/repo/releases/download/v0.34.0/patches.json"]);
  assert.equal((await call(state,bundleImportPath(card,true))).body.releases[0].patches,undefined);
  state.env.RESEAM_RELEASE_FETCH=async()=>Response.json({...upstream,bundle:{...publisher,public_key:"b".repeat(64)}});
  assert.equal((await call(state,path)).status,502);
  state.env.RESEAM_RELEASE_FETCH=async()=>new Response("missing",{status:404});
  assert.equal((await call(state,path)).status,404);
  const pending={...bundle,metadata_status:"unverified",reseam_bundle:null};
  const pendingState=fixture({"bundles.json":[pending],["bundles/"+pending.id+".json"]:pending});
  pendingState.env.RESEAM_RELEASE_FETCH=async()=>Response.json(upstream);
  assert.equal((await call(pendingState,path)).status,200);
  const wrong=fixture({"bundles.json":[original.bundle],["bundles/"+original.bundle.id+".json"]:original.bundle});
  assert.equal((await call(wrong,path)).status,404);
});

test("Reseam native index only follows trusted release-asset redirects and rejects malformed release types", async () => {
  const original=fixture();
  const publisher={name:"reseam-patches",public_key:"a".repeat(64)};
  const bundle={...original.bundle,bundle_type:"Reseam",reseam_bundle:publisher};
  const index={bundle:publisher,releases:[{
    version:bundle.version,created_at:"2026-10-17T12:00:00Z",description:"Notes",
    download_url:"https://github.com/owner/repo/releases/download/v1/patches.reseam",
    prerelease:false,patches:[]
  }]};
  const state=fixture({"bundles.json":[bundle],["bundles/"+bundle.id+".json"]:bundle});
  const path="/api/reseam/patches.json?source_url=https%3A%2F%2Fgithub.com%2Fowner%2Frepo&version="+bundle.version;
  const requested=[];
  state.env.RESEAM_RELEASE_FETCH=async (url,options)=>{
    requested.push(url);
    assert.equal(options.redirect,"manual");
    if (requested.length===1)
      return Response.redirect("https://release-assets.githubusercontent.com/asset?token=123",302);
    return Response.json(index);
  };
  assert.equal((await call(state,path)).status,200);
  assert.equal(requested.length,2);
  assert.equal(new URL(requested[1]).hostname,"release-assets.githubusercontent.com");

  for (const destination of ["https://127.0.0.1/admin", "http://release-assets.githubusercontent.com/asset",
    "https://untrusted.example/asset"]) {
    const attempts=[];
    state.env.RESEAM_RELEASE_FETCH=async url=>{
      attempts.push(url);
      return Response.redirect(destination,302);
    };
    assert.equal((await call(state,path)).status,503);
    assert.equal(attempts.length,1);
  }
  state.env.RESEAM_RELEASE_FETCH=async()=>Response.json({
    ...index,releases:[{...index.releases[0],prerelease:"false"}]
  });
  assert.equal((await call(state,path)).status,502);
});

test("manager imports read only their compact source index and selected release", async () => {
  const original = fixture();
  const publisher = { name: "patches", author: "Example", description: "Apps", public_key: "a".repeat(64) };
  const bundle = { ...original.bundle, bundle_type: "Reseam", reseam_bundle: publisher };
  const state = fixture({
    "bundles.json": [{ ...bundle, description: "x".repeat(13 * 1024 * 1024) }],
    "imports/s1.json": [bundle], ["bundles/" + bundle.id + ".json"]: bundle
  });
  const path = "/api/reseam/bundle?source_url=https://github.com/owner/repo&version=latest&channel=stable";
  assert.equal((await call(state, path)).status, 200);
  assert(state.requests.some(url => url.endsWith("/imports/s1.json")));
  assert(!state.requests.some(url => url.endsWith("/bundles.json")));
});


test("legacy Reseam compact indexes support app filters and canonical responses", async () => {
  const old = { ...fixture().bundle, bundle_type: "ReSeam" };
  const state = fixture({ "bundles.json": [old], "app-bundles.json": [old],
    ["bundles/" + old.id + ".json"]: old });
  const catalog = await new Catalog("https://example.test/database/", state.env.FETCH).initialize();
  assert.equal((await catalog.bundles({ compact: true }))[0].bundle_type, "Reseam");
  for (const type of ["Reseam", "ReSeam"]) {
    const apps = await call(state, "/apps?bundle_type=" + type);
    assert.equal(apps.status, 200);
    assert.equal(apps.body.data.length, 1);
    const bundles = await call(state, "/apps/com.video/bundles?bundle_type=" + type);
    assert.equal(bundles.status, 200);
    assert.equal(bundles.body.data.length, 1);
    assert.equal(bundles.body.data[0].bundle_type, "Reseam");
  }
});


test("official Reseam Manager JSON uses the API native index for selected releases", async () => {
  const original = fixture();
  const source = { ...JSON.parse(original.bodies["sources.json"])[0],
    url: "https://git.reseam.app/reseam/patches", host: "git.reseam.app",
    namespace: "reseam", repo: "patches" };
  const publisher = { name: "reseam-patches", public_key: "a".repeat(64) };
  const stable = { ...original.bundle, version: "v0.45.0", bundle_type: "Reseam",
    reseam_bundle: publisher };
  const dev = { ...original.dev, version: "v0.46.0-dev.1", bundle_type: "Reseam",
    reseam_bundle: publisher };
  // Exercise a pinned historical version whose catalog version lacks the v prefix.
  const historical = { ...stable, id: "e".repeat(24), legacy_id: 3, version: "0.34.0",
    is_latest: false, channels: [] };
  const state = fixture({ "sources.json": [source], "bundles.json": [stable, dev, historical],
    ["bundles/" + stable.id + ".json"]: stable, ["bundles/" + dev.id + ".json"]: dev,
    ["bundles/" + historical.id + ".json"]: historical });
  let index;
  let status = 200;
  const requested = [];
  state.env.RESEAM_RELEASE_FETCH = async (url, options) => {
    requested.push(url);
    assert.equal(options.redirect, "manual");
    if (new URL(url).hostname === "api.reseam.app")
      return Response.redirect(url.replace("api.reseam.app", "cdn.reseam.app"), 302);
    return Response.json(index, { status });
  };
  for (const [selected, pinned] of [[stable, false], [dev, false], [historical, true]]) {
    const tag = "v" + selected.version.replace(/^v/, "");
    index = { bundle: publisher, releases: [{
      version: tag.slice(1), created_at: selected.created_at, description: "Native notes",
      download_url: "https://api.reseam.app/patches/" + tag + "/reseam-patches.reseam",
      prerelease: selected.is_prerelease,
      patches: [{ id: "original.patch.id", compatibility: { kind: "universal" } }]
    }] };
    const card = { bundleType: "Reseam", sourceUrl: source.url, version: selected.version,
      isPrerelease: selected.is_prerelease };
    const path = reseamNativeImportPath(card, pinned);
    const result = await call(state, path);
    assert.equal(result.status, 200);
    assert.deepEqual(result.body, index);
    assert.deepEqual(requested.slice(-2), [
      "https://api.reseam.app/patches/" + tag + "/patches.json",
      "https://cdn.reseam.app/patches/" + tag + "/patches.json"
    ]);
    index = { ...index, bundle: { ...publisher, public_key: "b".repeat(64) } };
    assert.equal((await call(state, path)).status, 502);
    index = { ...index, bundle: publisher,
      releases: [{ ...index.releases[0], version: "9.9.9" }] };
    assert.equal((await call(state, path)).status, 502);
    status = 404;
    assert.equal((await call(state, path)).status, 404);
    status = 200;
  }
  const path = reseamNativeImportPath({ bundleType: "Reseam", sourceUrl: source.url,
    version: stable.version, isPrerelease: false }, true);
  for (const destination of ["https://untrusted.example/patches.json",
    "http://cdn.reseam.app/patches.json", "https://cdn.reseam.app:8443/patches.json",
    "https://user:secret@cdn.reseam.app/patches.json"]) {
    const attempts = [];
    state.env.RESEAM_RELEASE_FETCH = async url => {
      attempts.push(url);
      return Response.redirect(destination, 302);
    };
    assert.equal((await call(state, path)).status, 503);
    assert.equal(attempts.length, 1);
  }
});
