package com.bedrockstreaming.tornado.compose.molecule.button;
/** Test-only unattached UI receiver; real Eo.a binding code runs against it. */
public class TornadoButton extends android.view.View {
 public CharSequence text; public android.view.View.OnClickListener listener;
 public TornadoButton(android.content.Context context){super(context);}
 public void setText(CharSequence value){text=value;}
 @Override public void setOnClickListener(android.view.View.OnClickListener value){listener=value;super.setOnClickListener(value);}
}
