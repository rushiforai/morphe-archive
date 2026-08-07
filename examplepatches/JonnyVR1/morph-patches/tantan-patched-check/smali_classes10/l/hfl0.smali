.class public final synthetic Ll/hfl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y9m;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

.field public final synthetic b:Ll/hre;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hfl0;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    iput-object p2, p0, Ll/hfl0;->b:Ll/hre;

    return-void
.end method


# virtual methods
.method public final onCompletion()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hfl0;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    iget-object p0, p0, Ll/hfl0;->b:Ll/hre;

    invoke-static {v0, p0}, Ll/jfl0;->i(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;)V

    return-void
.end method
