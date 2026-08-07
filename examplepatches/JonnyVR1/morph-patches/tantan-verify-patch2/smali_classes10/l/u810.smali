.class public final Ll/u810;
.super Ll/h7t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h7t<",
        "Ll/e910<",
        "*>;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0002\u0008\n\u0018\u00002\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\u000c\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0017\u0010\u0010\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u000eH\u0014\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u001d\u0010\u0018\u001a\u00020\u00072\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0014H\u0016\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\tR\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001a\u0010\u001d\u001a\u0004\u0008\u001e\u0010\u001f\u00a8\u0006 "
    }
    d2 = {
        "Ll/u810;",
        "Ll/h7t;",
        "Ll/e910;",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Landroid/content/Context;)V",
        "",
        "init",
        "()V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;",
        "callInvite",
        "z",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;)V",
        "",
        "withShadow",
        "F0",
        "(Z)V",
        "e",
        "()Z",
        "",
        "showSeconds",
        "",
        "cnt",
        "A",
        "(IJ)V",
        "k",
        "()I",
        "B",
        "Landroid/content/Context;",
        "getContext",
        "()Landroid/content/Context;",
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
.field public final k:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/h7t;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/u810;->k:Landroid/content/Context;

    .line 8
    .line 9
    return-void
.end method

.method public static v()V
    .locals 0

    .line 1
    return-void
.end method

.method public static w(Ll/u810;Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p1, Ll/jr10;->INSTANCE:Ll/jr10;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 4
    .line 5
    check-cast v0, Ll/e910;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xzs;->L2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, "invited"

    .line 12
    .line 13
    const-string v2, "refuse"

    .line 14
    .line 15
    invoke-virtual {p1, v1, v2, v0}, Ll/jr10;->c(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 19
    .line 20
    check-cast p0, Ll/e910;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/e910;->f4()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static x(Ll/u810;Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p1, Ll/jr10;->INSTANCE:Ll/jr10;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 4
    .line 5
    check-cast v0, Ll/e910;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xzs;->L2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, "invited"

    .line 12
    .line 13
    const-string v2, "accept"

    .line 14
    .line 15
    invoke-virtual {p1, v1, v2, v0}, Ll/jr10;->c(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 19
    .line 20
    check-cast p0, Ll/e910;

    .line 21
    .line 22
    sget-object p1, Ll/cd10;->i:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/e910;->Y3(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static y(Ll/u810;Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p1, Ll/jr10;->INSTANCE:Ll/jr10;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 4
    .line 5
    check-cast v0, Ll/e910;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xzs;->L2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, "invited"

    .line 12
    .line 13
    const-string v2, "accept"

    .line 14
    .line 15
    invoke-virtual {p1, v1, v2, v0}, Ll/jr10;->c(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 19
    .line 20
    check-cast p0, Ll/e910;

    .line 21
    .line 22
    sget-object p1, Ll/cd10;->j:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/e910;->Y3(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final A(IJ)V
    .locals 2

    .line 1
    int-to-long v0, p1

    .line 2
    sub-long/2addr v0, p2

    .line 3
    iget-object p0, p0, Ll/h7t;->h:Lv/VText;

    .line 4
    .line 5
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->i9:I

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {p1, p2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final B()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h7t;->j:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->m9:I

    .line 4
    .line 5
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/h7t;->i:Lv/VText;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public F0(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->F0(Z)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/jr10;->INSTANCE:Ll/jr10;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 7
    .line 8
    check-cast p0, Ll/e910;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const-string v0, "invited"

    .line 15
    .line 16
    invoke-virtual {p1, v0, p0}, Ll/jr10;->o(Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public init()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->init()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/h7t;->h:Lv/VText;

    .line 5
    .line 6
    new-instance v1, Ll/q810;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/q810;-><init>(Ll/u810;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/h7t;->i:Lv/VText;

    .line 15
    .line 16
    new-instance v1, Ll/r810;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/r810;-><init>(Ll/u810;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/h7t;->j:Lv/VText;

    .line 25
    .line 26
    new-instance v1, Ll/s810;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/s810;-><init>(Ll/u810;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 35
    .line 36
    check-cast v0, Ll/e910;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/xzs;->L2()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    invoke-static {}, Ll/bf10;->O()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/u810;->B()V

    .line 51
    .line 52
    .line 53
    :cond_0
    new-instance v0, Ll/t810;

    .line 54
    .line 55
    invoke-direct {v0}, Ll/t810;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->s(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$c;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public z(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/h7t;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallConnectionIconView;

    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->ownerUserAvatar:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallConnectionIconView;->i0(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 16
    .line 17
    check-cast v0, Ll/e910;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/xzs;->L2()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/h7t;->g:Lv/VText;

    .line 26
    .line 27
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->y8:I

    .line 28
    .line 29
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->ownerUserName:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    const/4 v4, 0x2

    .line 35
    const/4 v5, 0x0

    .line 36
    invoke-static {v3, v2, v4, v5}, Ll/bf10;->x(Ljava/lang/String;IILjava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v1, v2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->showSeconds:J

    .line 48
    .line 49
    const-wide/16 v2, 0x0

    .line 50
    .line 51
    cmp-long p1, v0, v2

    .line 52
    .line 53
    if-lez p1, :cond_1

    .line 54
    .line 55
    long-to-int p1, v0

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    const/16 p1, 0x3c

    .line 58
    .line 59
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 60
    .line 61
    check-cast p0, Ll/e910;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/e910;->c4(I)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
