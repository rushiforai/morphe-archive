.class public final synthetic Ll/ffl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jfl0$a;


# instance fields
.field public final synthetic a:Ll/hre;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;


# direct methods
.method public synthetic constructor <init>(Ll/hre;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ffl0;->a:Ll/hre;

    iput-object p2, p0, Ll/ffl0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    iput-object p3, p0, Ll/ffl0;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    return-void
.end method


# virtual methods
.method public final a(Ll/udl0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ffl0;->a:Ll/hre;

    iget-object v1, p0, Ll/ffl0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    iget-object p0, p0, Ll/ffl0;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    invoke-static {v0, v1, p0, p1}, Ll/jfl0;->l(Ll/hre;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/udl0;)V

    return-void
.end method
