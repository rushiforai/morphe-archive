import React from 'react';
import {Composition, Still} from 'remotion';
import {GroupReaders} from './stills/GroupReaders';
import {LinimalPromo, TOTAL} from './Video';
import {LinimalUtility, UTILITY_TOTAL} from './utility/Video';
import {EDITORIAL_TOTAL, LinimalEditorial} from './editorial/Video';
import {LinimalX, X_TOTAL} from './x/Video';
import {LinimalXWide} from './x/Wide';
import {TERMINAL_TOTAL, VariantTerminal} from './variants/Terminal';
import {CHAT_TOTAL, VariantChat} from './variants/Chat';
import {SPLIT_TOTAL, VariantSplit} from './variants/Split';
import {LinimalShort, SHORT_TOTAL} from './short/Video';
import {LinimalBasicWide, BASIC_WIDE_TOTAL} from './variants/BasicWide';

export const RemotionRoot: React.FC = () => (
  <>
    <Composition id="LinimalShort" component={LinimalShort} durationInFrames={SHORT_TOTAL} fps={30} width={1920} height={1080} />
    <Composition id="LinimalBasicWide" component={LinimalBasicWide} durationInFrames={BASIC_WIDE_TOTAL} fps={30} width={1920} height={1080} />
    <Still id="GroupReaders" component={GroupReaders} width={1920} height={1080} />
    <Composition id="LinimalX" component={LinimalX} durationInFrames={X_TOTAL} fps={30} width={1080} height={1350} />
    <Composition id="LinimalXWide" component={LinimalXWide} durationInFrames={X_TOTAL} fps={30} width={1920} height={1080} />
    <Composition id="LinimalVTerminal" component={VariantTerminal} durationInFrames={TERMINAL_TOTAL} fps={30} width={1920} height={1080} />
    <Composition id="LinimalVChat" component={VariantChat} durationInFrames={CHAT_TOTAL} fps={30} width={1920} height={1080} />
    <Composition id="LinimalVSplit" component={VariantSplit} durationInFrames={SPLIT_TOTAL} fps={30} width={1920} height={1080} />
    <Composition id="LinimalUtility" component={LinimalUtility} durationInFrames={UTILITY_TOTAL} fps={30} width={1920} height={1080} />
    <Composition id="LinimalEditorial" component={LinimalEditorial} durationInFrames={EDITORIAL_TOTAL} fps={30} width={1920} height={1080} />
    <Composition id="LinimalPromo" component={LinimalPromo} durationInFrames={TOTAL} fps={30} width={1920} height={1080} />
  </>
);
