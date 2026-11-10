import React from 'react';
import {AbsoluteFill, Series, interpolate, useCurrentFrame} from 'remotion';
import {SpeedContext} from '../shared/screens';
import {T} from './tokens';
import {
  Layer, MARKS, MarkAllReadScreen, Marks, NotificationScreen, OpenWithoutReceiptScreen, ScreenBox,
  ScrollPreviewScreen, SettingsScrollScreen, UnreadKeptScreen, widthFor,
} from '../shared/screens';

const s = (sec: number) => Math.round(sec * 30);
const M = T.margin;
const clamp = {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'} as const;

// テンポ。画面の操作とテキストの出現をこの倍率で速める
const SPEED = 1.5;

// 出現は不透明度だけ。場面の切り替えはカット
const useIn = (delay = 0, len = 8) => interpolate(useCurrentFrame() * SPEED, [delay, delay + len], [0, 1], clamp);

const CHAPTERS = ['表示を消す', '既読', '設定', '方針', '導入'] as const;
type Chapter = (typeof CHAPTERS)[number];

// 画面下の進行表示。全編で同じ位置に固定
const Index: React.FC<{current: Chapter}> = ({current}) => (
  <div style={{position: 'absolute', left: M, right: M, bottom: 44, borderTop: `1px solid ${T.rule}`, paddingTop: 18, display: 'flex', gap: 56, fontFamily: T.fontMono, fontSize: 22}}>
    <div style={{color: T.ink, marginRight: 'auto', fontFamily: T.fontSans, fontWeight: 700, fontSize: 24}}>Linimal</div>
    {CHAPTERS.map((c) => (
      <div key={c} style={{color: c === current ? T.ink : T.ink3, display: 'flex', alignItems: 'center', gap: 12}}>
        <div style={{width: 10, height: 10, background: c === current ? T.accent : 'transparent', border: `1px solid ${c === current ? T.accent : T.ink3}`}} />
        {c}
      </div>
    ))}
  </div>
);

const Frame: React.FC<{chapter?: Chapter; children: React.ReactNode}> = ({chapter, children}) => (
  <AbsoluteFill style={{background: T.paper, color: T.ink, fontFamily: T.fontSans}}>
    {children}
    {chapter ? <Index current={chapter} /> : null}
  </AbsoluteFill>
);

// 実画面。枠は描かず、細い罫線だけ
const Shot: React.FC<{h: number; label?: string; children: React.ReactNode; style?: React.CSSProperties; delay?: number}> = ({h, label, children, style, delay = 0}) => {
  const o = useIn(delay);
  return (
    <div style={{position: 'absolute', opacity: o, ...style}}>
      {label ? <div style={{fontFamily: T.fontMono, fontSize: 22, color: T.ink2, marginBottom: 14}}>{label}</div> : null}
      <ScreenBox height={h} style={{outline: `1px solid ${T.rule}`, borderRadius: 10}}>{children}</ScreenBox>
    </div>
  );
};

const Heading: React.FC<{children: React.ReactNode; size?: number; delay?: number}> = ({children, size = 60, delay = 4}) => (
  <div style={{fontWeight: 700, fontSize: size, lineHeight: 1.3, letterSpacing: '-0.01em', whiteSpace: 'pre-line', opacity: useIn(delay)}}>{children}</div>
);
const Body: React.FC<{children: React.ReactNode; delay?: number}> = ({children, delay = 10}) => (
  <div style={{fontSize: 30, lineHeight: 1.75, color: T.ink2, marginTop: 28, opacity: useIn(delay)}}>{children}</div>
);

// 項目と内容の表。罫線で区切る
const Spec: React.FC<{rows: [string, string][]; delay?: number; keyW?: number}> = ({rows, delay = 14, keyW = 220}) => (
  <div style={{marginTop: 44, borderTop: `1px solid ${T.rule}`, opacity: useIn(delay)}}>
    {rows.map(([k, v]) => (
      <div key={k} style={{display: 'flex', borderBottom: `1px solid ${T.rule}`, padding: '18px 0', fontSize: 28, lineHeight: 1.5}}>
        <div style={{width: keyW, flexShrink: 0, fontFamily: T.fontMono, fontSize: 22, color: T.ink3, paddingTop: 6}}>{k}</div>
        <div>{v}</div>
      </div>
    ))}
  </div>
);

// 操作の順番（矢印でつなぐ一行）
const Steps: React.FC<{steps: string[]; delay?: number}> = ({steps, delay = 14}) => (
  <div style={{marginTop: 48, fontFamily: T.fontMono, fontSize: 24, color: T.ink2, opacity: useIn(delay), display: 'flex', flexWrap: 'wrap', gap: 14, alignItems: 'center'}}>
    {steps.map((st, i) => (
      <React.Fragment key={st}>
        {i > 0 ? <span style={{color: T.ink3}}>→</span> : null}
        <span style={{border: `1px solid ${T.rule}`, padding: '6px 14px'}}>{st}</span>
      </React.Fragment>
    ))}
  </div>
);

const SHOT_H = 860;
const TOP = 56;

// 1
const Intro: React.FC = () => (
  <Frame>
    <div style={{position: 'absolute', left: M, top: 200, width: 900}}>
      <div style={{fontFamily: T.fontMono, fontSize: 24, color: T.ink3, opacity: useIn(0)}}>LINE 26.16.0 · arm64-v8a · Morphe patch bundle</div>
      <div style={{fontWeight: 800, fontSize: 168, letterSpacing: '-0.04em', marginTop: 24, opacity: useIn(4)}}>Linimal</div>
      <div style={{fontSize: 46, fontWeight: 600, lineHeight: 1.5, marginTop: 30, opacity: useIn(12)}}>
        広告と使わない機能を消して、
        <br />
        既読をつけるかを自分で選ぶ。
      </div>
    </div>
    <Shot h={SHOT_H} delay={18} style={{right: M + 140, top: TOP + 60}}>
      <Layer src="screenshots/line-talk-list.png" />
    </Shot>
  </Frame>
);

// 2・3 Before / After
const BA: React.FC<{before: string; after: string; marks: typeof MARKS.talkBefore; title: string; rows: [string, string][]; flip?: boolean}> = ({before, after, marks, title, rows, flip}) => {
  const h = 820;
  const w = widthFor(h);
  const shotsLeft = flip ? 1920 - M - (w * 2 + 48) : M;
  return (
    <Frame chapter="表示を消す">
      <Shot h={h} label="公式 LINE" style={{left: shotsLeft, top: TOP}}>
        <Layer src={before} />
        <Marks marks={marks} color={T.accent} from={30} />
      </Shot>
      <Shot h={h} label="Linimal" delay={20} style={{left: shotsLeft + w + 48, top: TOP}}>
        <Layer src={after} />
      </Shot>
      <div style={{position: 'absolute', top: 210, width: 760, left: flip ? M : 1920 - M - 760}}>
        <Heading>{title}</Heading>
        <Spec rows={rows} delay={34} keyW={170} />
      </div>
    </Frame>
  );
};

// 4
const ChapterRead: React.FC = () => (
  <Frame chapter="既読">
    <div style={{position: 'absolute', left: M, top: 330}}>
      <div style={{fontWeight: 800, fontSize: 120, letterSpacing: '-0.02em', opacity: useIn(0)}}>既読をつけずに読む</div>
      <div style={{fontSize: 36, color: T.ink2, marginTop: 30, opacity: useIn(8)}}>開く、確かめる、読み終えたら既読にする。</div>
    </div>
  </Frame>
);

// 5〜9 画面と説明。画面の位置を場面ごとに左右へ振る
const Feature: React.FC<{side: 'left' | 'right'; title: React.ReactNode; body: React.ReactNode; steps: string[]; children: React.ReactNode}> = ({side, title, body, steps, children}) => {
  const w = widthFor(SHOT_H);
  return (
    <Frame chapter="既読">
      <Shot h={SHOT_H} style={{top: TOP, ...(side === 'right' ? {right: M + 120} : {left: M + 120})}}>{children}</Shot>
      <div style={{position: 'absolute', top: 250, width: 820, ...(side === 'right' ? {left: M} : {left: M + 120 + w + 140})}}>
        <Heading>{title}</Heading>
        <Body>{body}</Body>
        <Steps steps={steps} />
      </div>
    </Frame>
  );
};

// 10
const Settings: React.FC = () => {
  const h = 700;
  const w = widthFor(h);
  const x0 = 1920 - M - (w * 3 + 40 * 2);
  return (
    <Frame chapter="設定">
      <div style={{position: 'absolute', left: M, top: 250, width: 600}}>
        <Heading>{'37 項目を、\n個別に切り替える'}</Heading>
        <Body>LINE の設定の一番下に「Linimal」が加わります。OFF の項目は公式 LINE と同じ動作です。</Body>
      </div>
      <Shot h={h} label="Linimal" style={{left: x0, top: TOP + 40}}>
        <Layer src="screenshots/linimal-settings-top.png" />
      </Shot>
      <Shot h={h} label="表示を消す（16）" delay={6} style={{left: x0 + w + 40, top: TOP + 40}}>
        <SettingsScrollScreen src="screenshots/linimal-page-hide-full.png" tallH={4642} />
      </Shot>
      <Shot h={h} label="既読（4）" delay={12} style={{left: x0 + (w + 40) * 2, top: TOP + 40}}>
        <Layer src="screenshots/linimal-page-read.png" />
      </Shot>
    </Frame>
  );
};

// 11
const Principles: React.FC = () => (
  <Frame chapter="方針">
    <div style={{position: 'absolute', left: M, top: 150, width: 1920 - M * 2}}>
      <Heading size={56}>迷ったら、公式 LINE の動作に戻す</Heading>
      <Spec
        keyW={560}
        delay={10}
        rows={[
          ['OFF のとき', '公式 LINE と同じ動作になります。'],
          ['対象を特定できないとき', 'その機能は自動で無効になり、設定画面でも操作できません。'],
          ['広告・課金・通信', '変更しません。消すのは表示だけです。'],
          ['既読', '見た目ではなく、実際の既読の送信を止めます。'],
        ]}
      />
    </div>
  </Frame>
);

// 12
const Outro: React.FC = () => (
  <Frame chapter="導入">
    <div style={{position: 'absolute', left: M, top: 150, width: 1920 - M * 2}}>
      <div style={{fontWeight: 800, fontSize: 120, letterSpacing: '-0.04em', opacity: useIn(0)}}>Linimal</div>
      <Spec
        keyW={300}
        delay={8}
        rows={[
          ['導入', 'Morphe Manager にパッチソースとして追加'],
          ['ソース', 'github.com/uta-a/linimal'],
          ['対象', 'LINE 26.16.0（arm64-v8a）'],
          ['ライセンス', 'GPL-3.0'],
        ]}
      />
      <div style={{fontSize: 24, color: T.ink3, marginTop: 36, opacity: useIn(16)}}>
        Linimal は独立したプロジェクトであり、LINE および Morphe の公式プロジェクトではありません。
      </div>
    </div>
  </Frame>
);

const ring = T.accent;
export const UTILITY_SCENES: {d: number; el: React.ReactNode}[] = [
  {d: s(3.2), el: <Intro />},
  {
    d: s(5.5),
    el: (
      <BA
        before="screenshots/line-talk-list-before.png"
        after="screenshots/line-talk-list.png"
        marks={MARKS.talkBefore}
        title="トーク一覧"
        rows={[['上部', 'AI Friends・カレンダー・オープンチャット'], ['検索欄', 'Agent i'], ['下部タブ', 'ショッピング・ニュース・アプリ'], ['広告', 'Smart Channel']]}
      />
    ),
  },
  {
    d: s(5),
    el: (
      <BA
        flip
        before="screenshots/line-home-before.png"
        after="screenshots/line-home.png"
        marks={MARKS.homeBefore}
        title="ホーム"
        rows={[['上部', 'Agent i'], ['フィード', '投稿カード・話題・おすすめ・特集枠'], ['広告', 'ホームの広告とフィード広告'], ['LINE AI', '長押しメニューなど 8 か所の入口']]}
      />
    ),
  },
  {d: s(1.6), el: <ChapterRead />},
  {
    d: s(5.2),
    el: (
      <Feature side="left" title="長押しで、中身を確かめる" body="トークを長押しするとプレビューが開き、スクロールして過去のメッセージも読めます。" steps={['長押し', 'プレビュー', 'スクロール']}>
        <ScrollPreviewScreen ring={ring} />
      </Feature>
    ),
  },
  {
    d: s(3.8),
    el: (
      <Feature side="right" title="既読をつけずに開く" body="メニューの先頭から開きます。開いている間は、上部に「既読は無効です」と表示されます。" steps={['既読をつけずに読む', 'トーク']}>
        <OpenWithoutReceiptScreen ring={ring} />
      </Feature>
    ),
  },
  {
    d: s(3),
    el: (
      <Feature side="left" title="読んだあとも、未読のまま" body="相手に既読はつかず、一覧の未読バッジも残ります。メッセージを送ると、その時点で既読になります。" steps={['トークを閉じる', '未読 1 のまま']}>
        <UnreadKeptScreen ring={ring} />
      </Feature>
    ),
  },
  {
    d: s(3.7),
    el: (
      <Feature side="right" title="読み終えたら、既読にする" body="入力欄の上の「すべて既読にする」で、いつでも既読にできます。" steps={['すべて既読にする', '既読']}>
        <MarkAllReadScreen ring={ring} font={T.fontSans} />
      </Feature>
    ),
  },
  {
    d: s(3.5),
    el: (
      <Feature side="left" title={'通知から開いても、\n既読はつかない'} body="メッセージ通知から開いたトークにも、同じ設定を使えます。" steps={['通知', 'トーク（既読なし）']}>
        <NotificationScreen ring={ring} />
      </Feature>
    ),
  },
  {d: s(5.5), el: <Settings />},
  {d: s(4.5), el: <Principles />},
  {d: s(4.5), el: <Outro />},
];

export const UTILITY_TOTAL = UTILITY_SCENES.reduce((a, b) => a + b.d, 0);

export const LinimalUtility: React.FC = () => (
  <AbsoluteFill style={{background: T.paper}}>
    <SpeedContext.Provider value={SPEED}>
    <Series>
      {UTILITY_SCENES.map((sc, i) => (
        <Series.Sequence key={i} durationInFrames={sc.d}>
          {sc.el}
        </Series.Sequence>
      ))}
    </Series>
    </SpeedContext.Provider>
  </AbsoluteFill>
);
