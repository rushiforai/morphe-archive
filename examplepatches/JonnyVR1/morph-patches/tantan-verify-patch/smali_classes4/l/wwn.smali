.class public final Ll/wwn;
.super Ll/fq1;
.source "SourceFile"

# interfaces
.implements Ll/fjn$a;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u00012\u00020\u0002B\'\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000c\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\rJ\u000f\u0010\u0010\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0017\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\u0013\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0019\u0010\u0018\u001a\u00020\u000b2\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0016H\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019\u00a8\u0006\u001a"
    }
    d2 = {
        "Ll/wwn;",
        "Ll/fq1;",
        "Ll/fjn$a;",
        "Ll/dum;",
        "info",
        "",
        "imageRes",
        "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
        "button",
        "<init>",
        "(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V",
        "",
        "j4",
        "()V",
        "T",
        "Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;",
        "X3",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;",
        "",
        "isShowRedDot",
        "h0",
        "(Z)V",
        "Landroid/view/View;",
        "view",
        "V3",
        "(Landroid/view/View;)V",
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


# direct methods
.method public constructor <init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 0
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "*>;I",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/fq1;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final j4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vp20;->p()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "p_anchor_live_room"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "p_user_live_room"

    .line 15
    .line 16
    :goto_0
    new-instance v0, Lkotlin/Pair;

    .line 17
    .line 18
    const-string v1, "live_type"

    .line 19
    .line 20
    const-string v2, "live"

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "e_gametab_entry_exposure"

    .line 30
    .line 31
    invoke-static {v1, p0, v0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/kf2;->T()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/wwn;->j4()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/fjn;

    .line 8
    .line 9
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-direct {v0, v1, p0}, Ll/fjn;-><init>(Ll/dum;Ll/fjn$a;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public V3(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/kf2;->g4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kf2;->c4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "intlGamePanel"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public h0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->g0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
