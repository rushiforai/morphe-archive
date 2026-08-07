.class public interface abstract Ll/vdp0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\t\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u0008f\u0018\u00002\u00020\u0001J;\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u0003\u001a\u00020\u00022\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u00062\n\u0010\n\u001a\u0006\u0012\u0002\u0008\u00030\tH&\u00a2\u0006\u0004\u0008\u000c\u0010\rJ#\u0010\u0010\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u000e2\n\u0010\n\u001a\u0006\u0012\u0002\u0008\u00030\tH&\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J+\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0013\u001a\u00020\u00122\n\u0010\n\u001a\u0006\u0012\u0002\u0008\u00030\tH&\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J#\u0010\u0016\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u000e2\n\u0010\n\u001a\u0006\u0012\u0002\u0008\u00030\tH&\u00a2\u0006\u0004\u0008\u0016\u0010\u0011J\u0017\u0010\u0018\u001a\u00020\u000b2\u0006\u0010\u0017\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u0017\u0010\u001a\u001a\u00020\u000b2\u0006\u0010\u0003\u001a\u00020\u0002H&\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u0017\u0010\u001e\u001a\u00020\u000b2\u0006\u0010\u001d\u001a\u00020\u001cH&\u00a2\u0006\u0004\u0008\u001e\u0010\u001f\u00a8\u0006 \u00c0\u0006\u0003"
    }
    d2 = {
        "Ll/vdp0;",
        "",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
        "call",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
        "bLiveMember",
        "Ll/nsv;",
        "Ll/h64;",
        "user",
        "Ll/scp0;",
        "presenter",
        "",
        "c",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveMember;Ll/nsv;Ll/scp0;)V",
        "",
        "pos",
        "f",
        "(ILl/scp0;)V",
        "",
        "isClearAvatar",
        "b",
        "(IZLl/scp0;)V",
        "e",
        "res",
        "setItemPlaceRes",
        "(I)V",
        "a",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V",
        "",
        "effectUrl",
        "d",
        "(Ljava/lang/String;)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# virtual methods
.method public abstract a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract b(IZLl/scp0;)V
    .param p3    # Ll/scp0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Ll/scp0<",
            "*>;)V"
        }
    .end annotation
.end method

.method public abstract c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveMember;Ll/nsv;Ll/scp0;)V
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveMember;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/nsv;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/scp0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Ll/scp0<",
            "*>;)V"
        }
    .end annotation
.end method

.method public abstract d(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract e(ILl/scp0;)V
    .param p2    # Ll/scp0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/scp0<",
            "*>;)V"
        }
    .end annotation
.end method

.method public abstract f(ILl/scp0;)V
    .param p2    # Ll/scp0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/scp0<",
            "*>;)V"
        }
    .end annotation
.end method

.method public setItemPlaceRes(I)V
    .locals 0

    .line 1
    return-void
.end method
