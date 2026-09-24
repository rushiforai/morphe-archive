import { getResourceUrl } from './gm';

export const resources: { [key: string]: string } = {};

export async function init() {
	resources.logo = await getResourceUrl('logo');
}
