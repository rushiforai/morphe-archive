import React from 'react';
import {Composition} from 'remotion';
import {LinimalPromo, TOTAL} from './Video';
import {LinimalUtility, UTILITY_TOTAL} from './utility/Video';
import {EDITORIAL_TOTAL, LinimalEditorial} from './editorial/Video';

export const RemotionRoot: React.FC = () => (
  <>
    <Composition id="LinimalUtility" component={LinimalUtility} durationInFrames={UTILITY_TOTAL} fps={30} width={1920} height={1080} />
    <Composition id="LinimalEditorial" component={LinimalEditorial} durationInFrames={EDITORIAL_TOTAL} fps={30} width={1920} height={1080} />
    <Composition id="LinimalPromo" component={LinimalPromo} durationInFrames={TOTAL} fps={30} width={1920} height={1080} />
  </>
);
