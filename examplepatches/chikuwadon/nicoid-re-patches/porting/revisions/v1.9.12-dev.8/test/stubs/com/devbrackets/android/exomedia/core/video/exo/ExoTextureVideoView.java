package com.devbrackets.android.exomedia.core.video.exo;
public class ExoTextureVideoView extends android.view.TextureView {
 public boolean available;public int availabilityChecks;public android.graphics.SurfaceTexture surface=new android.graphics.SurfaceTexture(0);
 public ExoTextureVideoView(android.content.Context c){super(c);}public boolean isAvailable(){availabilityChecks++;return available;}public android.graphics.SurfaceTexture getSurfaceTexture(){return surface;}
}
