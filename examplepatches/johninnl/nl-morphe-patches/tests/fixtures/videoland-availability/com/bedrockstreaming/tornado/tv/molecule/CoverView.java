package com.bedrockstreaming.tornado.tv.molecule;
/** Test-only UI delivery boundary, never packaged in a candidate. */
public class CoverView extends android.view.View {
 public String j0;private final com.bedrockstreaming.tornado.compose.molecule.button.TornadoButton button;
 public CoverView(android.content.Context context){super(context);button=new com.bedrockstreaming.tornado.compose.molecule.button.TornadoButton(context);}
 public com.bedrockstreaming.tornado.compose.molecule.button.TornadoButton getButtonView(){return button;}
 public void setButtonText(String value){j0=value;button.setText(value);}
}
