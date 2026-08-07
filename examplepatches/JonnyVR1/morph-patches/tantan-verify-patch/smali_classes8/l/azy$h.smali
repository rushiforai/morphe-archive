.class public Ll/azy$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xqc0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/azy;->X()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/azy;


# direct methods
.method public constructor <init>(Ll/azy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/azy$h;->a:Ll/azy;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/azy$h;->a:Ll/azy;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/azy;->y0(Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/azy$h;->a:Ll/azy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azy;->M()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 2
    .line 3
    invoke-static {v0}, Ll/azy;->v(Ll/azy;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 12
    .line 13
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getMaskLayer()Landroid/view/ViewGroup;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 24
    .line 25
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeBubble()Landroid/widget/TextView;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/16 v1, 0x8

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/azy$h;->a:Ll/azy;

    .line 37
    .line 38
    iget-object p0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getNoticeVideo()Landroid/widget/TextView;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 2
    .line 3
    invoke-static {v0}, Ll/azy;->v(Ll/azy;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Ll/azy$h;->a:Ll/azy;

    .line 12
    .line 13
    iget-object p0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getMaskLayer()Landroid/view/ViewGroup;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/azy$h;->a:Ll/azy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azy;->L0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/azy$h;->a:Ll/azy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azy;->J0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onCancel()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 2
    .line 3
    invoke-static {v0}, Ll/azy;->v(Ll/azy;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 12
    .line 13
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getMaskLayer()Landroid/view/ViewGroup;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 24
    .line 25
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBarWrapper()Landroid/widget/FrameLayout;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v2, 0x1

    .line 32
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 36
    .line 37
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getExpandView()Landroid/widget/ImageView;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 47
    .line 48
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getBarMaskLayer()Landroid/widget/LinearLayout;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 58
    .line 59
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSwitchCameraView()Landroid/widget/ImageView;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ll/azy;->u0(I)V

    .line 71
    .line 72
    .line 73
    new-instance v0, Ll/pf60;

    .line 74
    .line 75
    const-string v2, "photo_video"

    .line 76
    .line 77
    const-string v3, "1"

    .line 78
    .line 79
    invoke-direct {v0, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    filled-new-array {v0}, [Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const-string v2, "e_camera_chat_on"

    .line 87
    .line 88
    const-string v3, "p_chat_view"

    .line 89
    .line 90
    invoke-static {v2, v3, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 94
    .line 95
    invoke-static {v0}, Ll/azy;->w(Ll/azy;)Ll/xvx;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Ll/xvx;->a()V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/azy$h;->a:Ll/azy;

    .line 103
    .line 104
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getMessageBarRoot()Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Ll/azy$h;->a:Ll/azy;

    .line 114
    .line 115
    invoke-virtual {p0}, Ll/azy;->L()V

    .line 116
    .line 117
    .line 118
    return-void
.end method
