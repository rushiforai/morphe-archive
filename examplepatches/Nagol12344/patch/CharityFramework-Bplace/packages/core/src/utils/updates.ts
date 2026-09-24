import semver from 'semver';
import { FrameworkManifest } from 'types/src';
import { fetchWithoutCors } from './gm';

const MANIFEST_URL = 'https://bplace-framework-scripts.shuni.moe/framework/manifest.json';

const isCurrentOutOfDate = (latest: FrameworkManifest) =>
	semver.lt(window.charity.internal.info.version, latest.version);

export async function checkForUpdates() {
	if (window.charity.internal.latestManifest) return isCurrentOutOfDate(window.charity.internal.latestManifest);
	const res = await fetchWithoutCors(MANIFEST_URL + '?' + Date.now());

	if (!res.ok) throw new Error('framework manifest url returned status=' + res.status);
	const manifest: FrameworkManifest = await res.json();

	window.charity.internal.latestManifest = manifest;
	return isCurrentOutOfDate(manifest);
}
