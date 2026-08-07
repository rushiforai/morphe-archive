.class public final Ll/zio0;
.super Ll/y8s;
.source "SourceFile"

# interfaces
.implements Ll/o9p0$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ljava/lang/Object;",
        ">;",
        "Ll/o9p0$a;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u00012\u00020\u0004B\u000f\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\u000c\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\u000bJ\u0017\u0010\u000f\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u000bJ\u000f\u0010\u0012\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u000bJ\u000f\u0010\u0013\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u000bR\u0016\u0010\u0016\u001a\u00020\r8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0015R\u001b\u0010\u001c\u001a\u00020\u00178BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0018\u0010\u0019\u001a\u0004\u0008\u001a\u0010\u001b\u00a8\u0006\u001d"
    }
    d2 = {
        "Ll/zio0;",
        "Ll/y8s;",
        "Ll/oo2;",
        "",
        "Ll/o9p0$a;",
        "Ll/uzn0;",
        "info",
        "<init>",
        "(Ll/uzn0;)V",
        "",
        "t",
        "()V",
        "X0",
        "",
        "liveId",
        "X3",
        "(Ljava/lang/String;)V",
        "a4",
        "Z3",
        "Y3",
        "j",
        "Ljava/lang/String;",
        "voiceLiveId",
        "Ll/o9p0;",
        "k",
        "Lkotlin/Lazy;",
        "W3",
        "()Ll/o9p0;",
        "voiceVerifyHelper",
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


# instance fields
.field public j:Ljava/lang/String;

.field public final k:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/uzn0;)V
    .locals 0
    .param p1    # Ll/uzn0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ll/wio0;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/wio0;-><init>(Ll/zio0;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/zio0;->k:Lkotlin/Lazy;

    .line 17
    .line 18
    return-void
.end method

.method public static S3(Ll/zio0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zio0;->Y3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static T3(Ll/zio0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoicePublicLive$VoicePublicLive;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoicePublicLive$VoicePublicLive;->getLiveId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/zio0;->X3(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static U3(Ll/zio0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zio0;->Z3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static V3(Ll/zio0;)Ll/o9p0;
    .locals 2

    .line 1
    new-instance v0, Ll/o9p0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1}, Ll/o9p0;-><init>(Ll/o9p0$a;Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public final W3()Ll/o9p0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zio0;->k:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/o9p0;

    .line 8
    .line 9
    return-object p0
.end method

.method public X0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zio0;->j:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "voiceLiveId"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->publicVoiceRoom(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final X3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zio0;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zio0;->a4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final Y3()V
    .locals 0

    .line 1
    return-void
.end method

.method public final Z3()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/zio0;->W3()Ll/o9p0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/o9p0;->p()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/zio0;->X0()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final a4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Bb:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ab:I

    .line 14
    .line 15
    new-instance v2, Ll/xio0;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/xio0;-><init>(Ll/zio0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->zb:I

    .line 25
    .line 26
    new-instance v2, Ll/yio0;

    .line 27
    .line 28
    invoke-direct {v2, p0}, Ll/yio0;-><init>(Ll/zio0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->l1()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/vio0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/vio0;-><init>(Ll/zio0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method
