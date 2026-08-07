.class public final Ll/r4l;
.super Ll/cyr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cyr<",
        "Ll/o4l;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0003\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J9\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\t2\u000c\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000b2\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u000b\u00a2\u0006\u0004\u0008\u0011\u0010\u0012\u00a8\u0006\u0013"
    }
    d2 = {
        "Ll/r4l;",
        "Ll/cyr;",
        "Ll/o4l;",
        "Lcom/p1/mobile/putong/live/external/page/setting/privacy/frag/HideWealthIconFrag;",
        "hideWealthIconFrag",
        "<init>",
        "(Lcom/p1/mobile/putong/live/external/page/setting/privacy/frag/HideWealthIconFrag;)V",
        "",
        "position",
        "",
        "isChecked",
        "Lcom/tantanapp/media/ttmediautils/download/Action1;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
        "onSuccessAction",
        "",
        "onFailAction",
        "",
        "s2",
        "(Ljava/lang/String;ZLcom/tantanapp/media/ttmediautils/download/Action1;Lcom/tantanapp/media/ttmediautils/download/Action1;)V",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/page/setting/privacy/frag/HideWealthIconFrag;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/external/page/setting/privacy/frag/HideWealthIconFrag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/cyr;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static q2(Lcom/tantanapp/media/ttmediautils/download/Action1;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/Action1;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static r2(Lcom/tantanapp/media/ttmediautils/download/Action1;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/Action1;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final s2(Ljava/lang/String;ZLcom/tantanapp/media/ttmediautils/download/Action1;Lcom/tantanapp/media/ttmediautils/download/Action1;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/tantanapp/media/ttmediautils/download/Action1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lcom/tantanapp/media/ttmediautils/download/Action1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;",
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/external/module/api/LivePrivacyApiProvider;->changeWealthIconShowStatusNew(Ljava/lang/String;Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Ll/p4l;

    .line 19
    .line 20
    invoke-direct {p1, p3}, Ll/p4l;-><init>(Lcom/tantanapp/media/ttmediautils/download/Action1;)V

    .line 21
    .line 22
    .line 23
    new-instance p2, Ll/q4l;

    .line 24
    .line 25
    invoke-direct {p2, p4}, Ll/q4l;-><init>(Lcom/tantanapp/media/ttmediautils/download/Action1;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method
