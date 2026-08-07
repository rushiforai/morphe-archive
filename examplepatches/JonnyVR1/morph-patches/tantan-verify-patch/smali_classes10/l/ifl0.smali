.class public final synthetic Ll/ifl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z9m;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ifl0;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    return-void
.end method


# virtual methods
.method public final onError(ILjava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ifl0;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    invoke-static {p0, p1, p2}, Ll/jfl0;->k(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;ILjava/lang/String;)Z

    move-result p0

    return p0
.end method
