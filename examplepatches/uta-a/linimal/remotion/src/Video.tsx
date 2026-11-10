import React from 'react';
import {AbsoluteFill, Series} from 'remotion';
import {C} from './theme';
import {Chapter, HomeBA, Intro, Outro, Principles, Settings, TalkListBA, UnreadKept} from './scenes';
import {MarkAllReadMock, NotificationMock, OpenWithoutReceiptMock, ScrollPreviewMock} from './scenes/mock';

const s = (sec: number) => Math.round(sec * 30);

export const SCENES: {d: number; el: React.ReactNode}[] = [
  {d: s(5), el: <Intro />},
  {d: s(8), el: <TalkListBA />},
  {d: s(7.5), el: <HomeBA />},
  {d: s(2.5), el: <Chapter kicker="既読" title="既読をつけずに読む" sub="読むタイミングは、自分で選ぶ" />},
  {d: s(8), el: <ScrollPreviewMock />},
  {d: s(5.6), el: <OpenWithoutReceiptMock />},
  {d: s(4.5), el: <UnreadKept />},
  {d: s(5.5), el: <MarkAllReadMock />},
  {d: s(5.5), el: <NotificationMock />},
  {d: s(8), el: <Settings />},
  {d: s(6), el: <Principles />},
  {d: s(6), el: <Outro />},
];

export const TOTAL = SCENES.reduce((a, b) => a + b.d, 0);

export const LinimalPromo: React.FC = () => (
  <AbsoluteFill style={{background: C.bg}}>
    <Series>
      {SCENES.map((sc, i) => (
        <Series.Sequence key={i} durationInFrames={sc.d}>
          {sc.el}
        </Series.Sequence>
      ))}
    </Series>
  </AbsoluteFill>
);
