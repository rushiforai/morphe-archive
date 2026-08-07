.class public Ll/ku;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ju;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/account/ui/account/AccountNewCropperAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/account/AccountNewCropperAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ku;->a:Lcom/p1/mobile/putong/account/ui/account/AccountNewCropperAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ku;->a:Lcom/p1/mobile/putong/account/ui/account/AccountNewCropperAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Ll/ju;)V
    .locals 0

    .line 1
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ku;->a:Lcom/p1/mobile/putong/account/ui/account/AccountNewCropperAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ku;->a:Lcom/p1/mobile/putong/account/ui/account/AccountNewCropperAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/ku;->a:Lcom/p1/mobile/putong/account/ui/account/AccountNewCropperAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Ll/bbc0;->S1:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Ll/ku;->a:Lcom/p1/mobile/putong/account/ui/account/AccountNewCropperAct;

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->setGradientStatusBar()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const/high16 p1, -0x1000000

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ku;->a:Lcom/p1/mobile/putong/account/ui/account/AccountNewCropperAct;

    .line 2
    .line 3
    sget v0, Ll/yfc0;->b:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ju;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ku;->a(Ll/ju;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
