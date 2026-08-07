.class public final Ll/pkp0;
.super Ll/pdv;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pdv<",
        "Ll/tkp0<",
        "*>;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0005\u0018\u00002\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u000f\u0010\u0006\u001a\u00020\u0005H\u0002\u00a2\u0006\u0004\u0008\u0006\u0010\u0004J\u0017\u0010\t\u001a\u00020\u00052\u0006\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u0005H\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0004\u00a8\u0006\u0010"
    }
    d2 = {
        "Ll/pkp0;",
        "Ll/pdv;",
        "Ll/tkp0;",
        "<init>",
        "()V",
        "",
        "y",
        "",
        "withShadow",
        "F0",
        "(Z)V",
        "",
        "x",
        "()I",
        "k",
        "destroy",
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
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pdv;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static v(Ll/pkp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static w(Ll/pkp0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast p0, Ll/tkp0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tkp0;->T3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private final y()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pdv;->h:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/pdv;->h:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 8
    .line 9
    const-string v2, "\u4eba\u6c14\u699c\u5355"

    .line 10
    .line 11
    sget v3, Ll/n9c0;->p1:I

    .line 12
    .line 13
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->f(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/pdv;->h:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 17
    .line 18
    new-instance v2, Ll/nkp0;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/nkp0;-><init>(Ll/pkp0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setFAQListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/pdv;->h:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 27
    .line 28
    new-instance v2, Ll/okp0;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Ll/okp0;-><init>(Ll/pkp0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setBackListener(Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/pdv;->h:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setLeftView(I)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/pdv;->h:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 42
    .line 43
    const/4 v0, 0x3

    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setRightView(I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public F0(Z)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->F0(Z)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/pkp0;->y()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/pdv;->g:Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;

    .line 8
    .line 9
    const/high16 p1, 0x41800000    # 16.0f

    .line 10
    .line 11
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    neg-int v4, v1

    .line 16
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    const/4 v1, 0x0

    .line 21
    const/4 v2, 0x0

    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-static/range {v0 .. v5}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/pdv;->g:Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;

    .line 27
    .line 28
    const-string p1, "room"

    .line 29
    .line 30
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;->j0(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    sget p0, Ll/obc0;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public x()I
    .locals 0

    .line 1
    const p0, 0x440dc000    # 567.0f

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method
