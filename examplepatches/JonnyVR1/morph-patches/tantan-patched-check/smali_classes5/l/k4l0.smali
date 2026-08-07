.class public Ll/k4l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/h4l0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VLinear;

.field public c:Lv/VLinear;

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Ll/h4l0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/k4l0;->d:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/k4l0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k4l0;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/k4l0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k4l0;->f(Landroid/view/View;)V

    return-void
.end method

.method private e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k4l0;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p0, Ll/k4l0;->d:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/k4l0;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    const-string v0, "\u9009\u62e9\u8eab\u4efd\u8ba4\u8bc1\u65b9\u5f0f"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/k4l0;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v0, p0, Ll/k4l0;->e:Ll/h4l0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/h4l0;->b:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;->Y1(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Ll/k4l0;->d:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/k4l0;->d:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "e_authentication_name"

    .line 24
    .line 25
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/k4l0;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v0, p0, Ll/k4l0;->e:Ll/h4l0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/h4l0;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, v0}, Ll/pq4;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/k4l0;->d:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "e_authentication_ctid"

    .line 17
    .line 18
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/k4l0;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/k4l0;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/l4l0;->b(Ll/k4l0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/h4l0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k4l0;->e:Ll/h4l0;

    .line 2
    .line 3
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
    check-cast p1, Ll/h4l0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/k4l0;->d(Ll/h4l0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k4l0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/k4l0;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/k4l0;->b:Lv/VLinear;

    .line 5
    .line 6
    new-instance v1, Ll/i4l0;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/i4l0;-><init>(Ll/k4l0;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/k4l0;->c:Lv/VLinear;

    .line 15
    .line 16
    new-instance v1, Ll/j4l0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/j4l0;-><init>(Ll/k4l0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
