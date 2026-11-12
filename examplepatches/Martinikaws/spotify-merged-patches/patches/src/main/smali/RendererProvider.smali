.class public final Lapp/spicetify/extension/spotify/settings/nativebridge/RendererProvider;
.super Ljava/lang/Object;
.implements Lp/ssx0;

# Spotify 9.1.94.1929: Lp/ssx0; is the provider interface (was Lp/rfr0;), Lp/fj0; the renderer (was Lp/xh0;).
.field private final renderer:Lp/fj0;

.method public constructor <init>(Lp/fj0;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/RendererProvider;->renderer:Lp/fj0;
    return-void
.end method

.method public get()Ljava/lang/Object;
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/RendererProvider;->renderer:Lp/fj0;
    return-object v0
.end method
