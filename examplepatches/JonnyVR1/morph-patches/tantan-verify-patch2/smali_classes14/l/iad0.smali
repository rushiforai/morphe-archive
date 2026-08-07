.class public Ll/iad0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/tbd0;

.field public b:Ll/jbt;

.field public c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Lcom/p1/mobile/putong/live/base/bean/UserRightType;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/bean/UserRightType;Lcom/p1/mobile/android/app/Act;Ll/tbd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iad0;->e:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 5
    .line 6
    iput-object p2, p0, Ll/iad0;->d:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iput-object p3, p0, Ll/iad0;->a:Ll/tbd0;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/iad0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/iad0;->f()V

    return-void
.end method

.method public static synthetic b(Ll/iad0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iad0;->g(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iad0;->b:Ll/jbt;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/iad0;->b:Ll/jbt;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/jbt;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public d()Lcom/p1/mobile/putong/live/base/bean/UserRightType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iad0;->e:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/iad0;->b:Ll/jbt;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/iad0;->d:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/xec0;->e1:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

    .line 19
    .line 20
    iput-object v0, p0, Ll/iad0;->c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

    .line 21
    .line 22
    new-instance v0, Ll/jbt;

    .line 23
    .line 24
    iget-object v1, p0, Ll/iad0;->d:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    iget-object v2, p0, Ll/iad0;->c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

    .line 27
    .line 28
    invoke-direct {v0, v1, v2}, Ll/jbt;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/iad0;->b:Ll/jbt;

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final synthetic f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iad0;->b:Ll/jbt;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/iad0;->b:Ll/jbt;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/jbt;->dismiss()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/iad0;->c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->t0()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/iad0;->a:Ll/tbd0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/tbd0;->S0()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic g(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iad0;->c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->t0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/iad0;->a:Ll/tbd0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, p2, v0}, Ll/tbd0;->R0(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public i(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/iad0;->a:Ll/tbd0;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, p1, v0, v1}, Ll/tbd0;->R0(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j(Ll/a9d0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iad0;->b:Ll/jbt;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/iad0;->c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->B0(Ll/a9d0;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public k(Ll/d9d0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/iad0;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/iad0;->b:Ll/jbt;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Ll/iad0;->c:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

    .line 14
    .line 15
    new-instance v1, Ll/gad0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/gad0;-><init>(Ll/iad0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0, p1, v1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->u0(Ll/iad0;Ll/d9d0;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/iad0;->b:Ll/jbt;

    .line 24
    .line 25
    new-instance v0, Ll/had0;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/had0;-><init>(Ll/iad0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/iad0;->b:Ll/jbt;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 36
    .line 37
    .line 38
    return-void
.end method
