import semver from 'semver';
import { fetchWithoutCors } from '../utils/gm';
import { Patch, PluginDefinition, PluginManifest } from '@shuni64/charity-framework-bplace-types';

export interface PluginState {
	id: string;
	url: string;
	enabled: boolean;
	error: string | null;
}

export const validateManifest = (manifest: PluginManifest) => {
	if (typeof manifest !== 'object') throw new Error('manifest isnt an object');
	if (typeof manifest.id !== 'string') throw new Error('manifest.id isnt a string');
	if (typeof manifest.name !== 'string') throw new Error('manifest name isnt a string');
	if (typeof manifest.version !== 'string') throw new Error('manifest.version isnt a string');
	if (!Array.isArray(manifest.authors)) throw new Error('manifest.authors isnt an array');
	if (manifest.authors.find((a) => typeof a !== 'string'))
		throw new Error('manifest.authors contains non string elements');
	if (typeof manifest.versions !== 'object') throw new Error('manifest.versions isnt an object');
	if (typeof manifest.versions.framework !== 'string') throw new Error('manifest.versions.framework isnt a string');
};

export const validatePatch = (patch: Patch) => {
	if (typeof patch.name !== 'string') throw new Error('patch.name isnt a string');
	if (typeof patch.find !== 'string') throw new Error('patch.find isnt a string');
	if (typeof patch.replace !== 'object') throw new Error('patch.replace isnt an object');
};

export const validatePluginDefintion = (definition: PluginDefinition) => {
	if (typeof definition !== 'object') throw new Error('defintion isnt an object');
	if (!Array.isArray(definition.patches)) throw new Error('definition.patches isnt an array');
	for (let i = 0; i < definition.patches.length; i++) {
		const patch = definition.patches[i];
		try {
			validatePatch(patch);
		} catch (error) {
			throw new Error('failed to validate definition.patches[' + i + ']' + '\n' + error.toString());
		}
	}
	if (definition.init && typeof definition.init !== 'function') throw new Error('defintion.init isnt a function');
	if (definition.load && typeof definition.load !== 'function') throw new Error('defintion.load isnt a function');
};

export const fetchManifest = async (url: string) => {
	if (!url.endsWith('/')) url += '/';
	const manifestRes = await fetchWithoutCors(url + 'manifest.json?' + Date.now());

	if (!manifestRes.ok) {
		throw new Error('failed to fetch manifest status=' + manifestRes.status);
	}

	const manifest: PluginManifest = await manifestRes.json();
	validateManifest(manifest);

	if (!semver.satisfies(window.charity.internal.info.version, manifest.versions.framework)) {
		throw new Error(
			'plugin ' +
				manifest.id +
				' wants framework version ' +
				manifest.versions.framework +
				' but the present framework version is only ' +
				window.charity.internal.info.version +
				'! please update your Charity Framework version',
		);
	}

	return manifest;
};
