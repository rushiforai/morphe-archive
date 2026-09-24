import { exposePatches } from './expose';
import { domEvents } from './dom';
import { loadPluginPatches } from './load';

import { Patch } from '@shuni64/charity-framework-bplace-types';

export const builtinPatches = (): Patch[] => [...exposePatches(), ...domEvents(), ...loadPluginPatches()];
