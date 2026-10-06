package com.google.android.libraries.youtube.player.subtitles.ui;
/** Controlled renderer fixture; serialized host draw is independently verified by composition audit. */
public class SubtitleWindowView extends android.view.View {
 public int nativeDraws;
 public SubtitleWindowView(android.content.Context context){super(context);}
 @Override public void draw(android.graphics.Canvas canvas){if(!app.yydarlinker.deepseekcaptions.NativeCaptionBridge.suppressNativeDraw())nativeDraws++;}
}
