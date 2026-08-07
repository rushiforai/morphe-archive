.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->i0(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->i0(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->j0(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->k0(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
