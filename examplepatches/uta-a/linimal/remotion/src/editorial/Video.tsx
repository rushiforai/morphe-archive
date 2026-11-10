import React from 'react';
import {AbsoluteFill, Series, interpolate, useCurrentFrame, useVideoConfig} from 'remotion';
import {T} from './tokens';
import {
  Layer, MARKS, MarkAllReadScreen, Marks, NotificationScreen, OpenWithoutReceiptScreen, ScreenBox,
  ScrollPreviewScreen, SettingsScrollScreen, UnreadKeptScreen, widthFor,
} from '../shared/screens';

const s = (sec: number) => Math.round(sec * 30);
const M = T.margin;
const clamp = {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'} as const;

// 場面全体をゆっくりフェード。要素ごとの浮き上がりはしない
const Page: React.FC<{children: React.ReactNode; folio?: string}> = ({children, folio}) => {
  const frame = useCurrentFrame();
  const {durationInFrames} = useVideoConfig();
  const o = Math.min(interpolate(frame, [0, 14], [0, 1], clamp), interpolate(frame, [durationInFrames - 10, durationInFrames], [1, 0], clamp));
  return (
    <AbsoluteFill style={{background: T.paper, color: T.ink, fontFamily: T.fontSans}}>
      <AbsoluteFill style={{opacity: o}}>
        {children}
        {folio ? (
          <div style={{position: 'absolute', left: M, right: M, bottom: 48, display: 'flex', justifyContent: 'space-between', fontSize: 20, color: T.ink3, letterSpacing: '0.04em'}}>
            <span>Linimal — 公式 LINE Android 向けパッチ</span>
            <span>{folio}</span>
          </div>
        ) : null}
      </AbsoluteFill>
    </AbsoluteFill>
  );
};

// 図版：細い罫線と、下にキャプション
const Figure: React.FC<{h: number; no: string; caption: string; children: React.ReactNode; style?: React.CSSProperties}> = ({h, no, caption, children, style}) => (
  <figure style={{position: 'absolute', margin: 0, ...style}}>
    <ScreenBox height={h} style={{outline: `1px solid ${T.rule}`, outlineOffset: 10}}>{children}</ScreenBox>
    <figcaption style={{marginTop: 26, width: widthFor(h) + 60, fontSize: 21, lineHeight: 1.6, color: T.ink2}}>
      <span style={{fontFamily: T.fontSerif, fontWeight: 600, color: T.ink, marginRight: 14}}>図 {no}</span>
      {caption}
    </figcaption>
  </figure>
);

const Title: React.FC<{children: React.ReactNode; size?: number}> = ({children, size = 76}) => (
  <div style={{fontFamily: T.fontSerif, fontWeight: 600, fontSize: size, lineHeight: 1.35, letterSpacing: '0.01em', whiteSpace: 'pre-line'}}>{children}</div>
);
const Text: React.FC<{children: React.ReactNode; width?: number}> = ({children, width = 560}) => (
  <div style={{fontSize: 28, lineHeight: 1.9, color: T.ink2, marginTop: 36, width}}>{children}</div>
);

const H = 800;
const TOP = 66;

// 1
const Intro: React.FC = () => (
  <Page>
    <div style={{position: 'absolute', left: M, top: 210}}>
      <div style={{fontSize: 26, color: T.ink2, letterSpacing: '0.06em'}}>Linimal</div>
      <div style={{width: 80, height: 2, background: T.accent, margin: '30px 0 44px'}} />
      <Title size={128}>
        LINE を、
        <br />
        必要なぶんだけ。
      </Title>
      <Text width={760}>広告と使わない機能を消して、既読をつけるかを自分で選べるようにする、公式 LINE Android 向けのパッチです。</Text>
    </div>
    <Figure h={H + 40} no="1" caption="Linimal を当てたトーク一覧。" style={{right: M + 60, top: TOP - 10}}>
      <Layer src="screenshots/line-talk-list.png" />
    </Figure>
  </Page>
);

// 2・3 見出しは上段に横長で置き、図版を 2 枚並べる
const BA: React.FC<{no: string; title: string; text: string; before: string; after: string; marks: typeof MARKS.talkBefore; capB: string; capA: string; folio: string; flip?: boolean}> = ({
  no, title, text, before, after, marks, capB, capA, folio, flip,
}) => {
  const h = 760;
  const w = widthFor(h);
  const figsLeft = flip ? M : 1920 - M - (w * 2 + 110);
  return (
    <Page folio={folio}>
      <div style={{position: 'absolute', top: 150, width: 720, left: flip ? 1920 - M - 720 : M}}>
        <Title size={68}>{title}</Title>
        <Text width={620}>{text}</Text>
      </div>
      <Figure h={h} no={`${no}a`} caption={capB} style={{left: figsLeft, top: TOP}}>
        <Layer src={before} />
        <Marks marks={marks} color={T.ring} from={36} />
      </Figure>
      <Figure h={h} no={`${no}b`} caption={capA} style={{left: figsLeft + w + 110, top: TOP}}>
        <Layer src={after} />
      </Figure>
    </Page>
  );
};

// 4
const ChapterRead: React.FC = () => (
  <Page>
    <div style={{position: 'absolute', left: M, top: 300, width: 1300}}>
      <div style={{width: 1300, height: 1, background: T.ink, marginBottom: 60}} />
      <Title size={150}>{'既読は、\n自分で選ぶ。'}</Title>
      <div style={{fontSize: 30, color: T.ink2, marginTop: 40}}>既読をつけずに読む</div>
    </div>
  </Page>
);

// 5〜9 図版と本文を左右交互に置く
const Spread: React.FC<{no: string; side: 'left' | 'right'; title: React.ReactNode; text: string; caption: string; folio: string; children: React.ReactNode}> = ({
  no, side, title, text, caption, folio, children,
}) => {
  const w = widthFor(H);
  return (
    <Page folio={folio}>
      <Figure h={H} no={no} caption={caption} style={{top: TOP, ...(side === 'left' ? {left: M + 140} : {right: M + 140})}}>
        {children}
      </Figure>
      <div style={{position: 'absolute', top: 240, width: 760, ...(side === 'left' ? {left: M + 140 + w + 180} : {left: M + 40})}}>
        <Title size={68}>{title}</Title>
        <Text>{text}</Text>
      </div>
    </Page>
  );
};

// 10
const Settings: React.FC = () => {
  const h = 700;
  const w = widthFor(h);
  return (
    <Page folio="設定">
      <div style={{position: 'absolute', left: M, top: 150, width: 560}}>
        <Title size={68}>
          37 の項目を、
          <br />
          ひとつずつ。
        </Title>
        <Text width={520}>LINE の設定の一番下に「Linimal」が加わります。項目を OFF にすると、その部分は公式 LINE と同じ動作に戻ります。</Text>
      </div>
      {[
        {no: '9a', cap: '設定のトップ。5 ページに分かれる。', el: <Layer src="screenshots/linimal-settings-top.png" />},
        {no: '9b', cap: '「表示を消す」の 16 項目。', el: <SettingsScrollScreen src="screenshots/linimal-page-hide-full.png" tallH={4642} />},
        {no: '9c', cap: '「既読」の 4 項目。', el: <Layer src="screenshots/linimal-page-read.png" />},
      ].map((f, i) => (
        <Figure key={f.no} h={h} no={f.no} caption={f.cap} style={{left: 1920 - M - (w * 3 + 80 * 2) + i * (w + 80), top: TOP + 60}}>
          {f.el}
        </Figure>
      ))}
    </Page>
  );
};

// 11 番号付きの 4 項目（順番に意味がある列挙）
const Principles: React.FC = () => {
  const items = [
    ['OFF なら、公式 LINE と同じ。', '設定を切った項目は、公式 LINE の動作に戻ります。'],
    ['特定できなければ、触らない。', '対象を見つけられなかった機能は、自動で無効になります。'],
    ['消すのは、表示だけ。', '広告の配信、課金、LINE の通信は変更しません。'],
    ['既読は、送信の手前で止める。', '見た目ではなく、実際の既読の送信を抑えます。'],
  ];
  return (
    <Page folio="方針">
      <div style={{position: 'absolute', left: M, top: 130}}>
        <Title size={68}>作りの方針</Title>
      </div>
      <div style={{position: 'absolute', left: M, right: M, top: 330, display: 'grid', gridTemplateColumns: '1fr 1fr', columnGap: 120, rowGap: 70}}>
        {items.map(([t, d], i) => (
          <div key={t} style={{display: 'flex', gap: 34, borderTop: `1px solid ${T.rule}`, paddingTop: 30}}>
            <div style={{fontFamily: T.fontSerif, fontSize: 64, lineHeight: 1, color: T.accent}}>{i + 1}</div>
            <div>
              <div style={{fontFamily: T.fontSerif, fontWeight: 600, fontSize: 40}}>{t}</div>
              <div style={{fontSize: 26, color: T.ink2, marginTop: 16, lineHeight: 1.7}}>{d}</div>
            </div>
          </div>
        ))}
      </div>
    </Page>
  );
};

// 12 奥付
const Outro: React.FC = () => (
  <Page>
    <div style={{position: 'absolute', left: M, top: 190, width: 1100}}>
      <Title size={150}>Linimal</Title>
      <div style={{width: 1100, height: 1, background: T.ink, margin: '50px 0 40px'}} />
      {[
        ['導入', 'Morphe Manager にパッチソースとして追加'],
        ['配布', 'github.com/uta-a/linimal'],
        ['対象', 'LINE 26.16.0（arm64-v8a）'],
        ['ライセンス', 'GPL-3.0'],
      ].map(([k, v]) => (
        <div key={k} style={{display: 'flex', fontSize: 30, lineHeight: 2}}>
          <div style={{width: 220, color: T.ink3}}>{k}</div>
          <div style={{color: k === '配布' ? T.accent : T.ink}}>{v}</div>
        </div>
      ))}
      <div style={{fontSize: 22, color: T.ink3, marginTop: 40}}>Linimal は独立したプロジェクトであり、LINE および Morphe の公式プロジェクトではありません。</div>
    </div>
  </Page>
);

const ring = T.ring;
export const EDITORIAL_SCENES: {d: number; el: React.ReactNode}[] = [
  {d: s(5), el: <Intro />},
  {
    d: s(8),
    el: (
      <BA
        no="2"
        folio="表示を消す"
        title={'使わない入口を、\nトーク一覧から外す。'}
        text="上部のアイコン、検索欄の横の Agent i、使わない下部タブ。囲んだ部分が消えます。"
        before="screenshots/line-talk-list-before.png"
        after="screenshots/line-talk-list.png"
        marks={MARKS.talkBefore}
        capB="公式 LINE のトーク一覧。"
        capA="Linimal を当てたあと。"
      />
    ),
  },
  {
    d: s(7.5),
    el: (
      <BA
        flip
        no="3"
        folio="表示を消す"
        title={'ホームには、\n友だちだけを残す。'}
        text="Agent i、投稿カード、話題、ホームの広告を外します。LINE AI の入口も 8 か所で消せます。"
        before="screenshots/line-home-before.png"
        after="screenshots/line-home.png"
        marks={MARKS.homeBefore}
        capB="公式 LINE のホーム。"
        capA="Linimal を当てたあと。"
      />
    ),
  },
  {d: s(2.5), el: <ChapterRead />},
  {d: s(8), el: <Spread no="4" side="left" folio="既読" title={'長押しで、\n中身を確かめる。'} text="トークを長押しするとプレビューが開きます。スクロールすれば、過去のメッセージまで読めます。" caption="長押しで開くスクロールプレビュー。"><ScrollPreviewScreen ring={ring} /></Spread>},
  {d: s(5.6), el: <Spread no="5" side="right" folio="既読" title="既読をつけずに開く。" text="メニューの先頭から開くと、上部に「既読は無効です」と表示されたままになります。" caption="メニューから開いたトーク。"><OpenWithoutReceiptScreen ring={ring} /></Spread>},
  {d: s(4.5), el: <Spread no="6" side="left" folio="既読" title={'閉じても、\n未読のまま。'} text="相手に既読はつかず、一覧の未読バッジも残ります。メッセージを送ると、その時点で既読になります。" caption="トーク一覧に残った未読バッジ。"><UnreadKeptScreen ring={ring} /></Spread>},
  {d: s(5.5), el: <Spread no="7" side="right" folio="既読" title={'読み終えたら、\n既読に。'} text="入力欄の上の「すべて既読にする」で、いつでも既読にできます。" caption="「すべて既読にする」を押したところ。"><MarkAllReadScreen ring={ring} font={T.fontSans} /></Spread>},
  {d: s(5.5), el: <Spread no="8" side="left" folio="既読" title={'通知から開いても、\n同じ。'} text="メッセージ通知から開いたトークにも、既読をつけずに読む設定を使えます。" caption="通知から開いたトーク。"><NotificationScreen ring={ring} /></Spread>},
  {d: s(8), el: <Settings />},
  {d: s(6), el: <Principles />},
  {d: s(6), el: <Outro />},
];

export const EDITORIAL_TOTAL = EDITORIAL_SCENES.reduce((a, b) => a + b.d, 0);

export const LinimalEditorial: React.FC = () => (
  <AbsoluteFill style={{background: T.paper}}>
    <Series>
      {EDITORIAL_SCENES.map((sc, i) => (
        <Series.Sequence key={i} durationInFrames={sc.d}>
          {sc.el}
        </Series.Sequence>
      ))}
    </Series>
  </AbsoluteFill>
);
