.class public final Ll/wnc0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u001d\u0012\u000c\u0010\u0005\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0015\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Ll/wnc0;",
        "Ll/i6t;",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;",
        "Ll/dum;",
        "info",
        "giftUsersView",
        "<init>",
        "(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;",
        "currentAnchorInfo",
        "",
        "J3",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;)V",
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
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;)V
    .locals 0
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "*>;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final J3(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorName:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorAvatar:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;->m0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
