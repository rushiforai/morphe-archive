.class public final Lapp/spicetify/extension/spotify/settings/nativebridge/ModelFactory;
.super Lp/qra0;
.implements Lp/me30;

# Spotify 9.1.94.1929: Lp/qra0; is the lambda base (was Lp/qf60;), Lp/me30; the one-argument function
# interface Lp/rfo; takes (was kotlin Function1), Lp/bjf0; the settings page model (was Lp/osa0;).
.field private final model:Lp/bjf0;

.method public constructor <init>(Lp/bjf0;)V
    .locals 1
    const/4 v0, 0x1
    invoke-direct {p0, v0}, Lp/qra0;-><init>(I)V
    iput-object p1, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/ModelFactory;->model:Lp/bjf0;
    return-void
.end method

.method public invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    iget-object v0, p0, Lapp/spicetify/extension/spotify/settings/nativebridge/ModelFactory;->model:Lp/bjf0;
    return-object v0
.end method
