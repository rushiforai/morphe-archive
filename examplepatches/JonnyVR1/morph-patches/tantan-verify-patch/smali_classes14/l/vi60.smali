.class public Ll/vi60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/si60;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VMaterialEdit;

.field public c:Lv/VButton_FakeShadow;

.field public d:Ll/si60;

.field public e:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vi60;->e:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/vi60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vi60;->e(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/vi60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vi60;->f()V

    return-void
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vi60;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vi60;->b:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
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
    iget-object p0, p0, Ll/vi60;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vi60;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/wi60;->b(Ll/vi60;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/si60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vi60;->d:Ll/si60;

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
    check-cast p1, Ll/si60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vi60;->d(Ll/si60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vi60;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vi60;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vi60;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->o0:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/vi60;->a:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    new-instance v1, Ll/ti60;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/ti60;-><init>(Ll/vi60;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ll/ui60;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/ui60;-><init>(Ll/vi60;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/vi60;->d:Ll/si60;

    .line 35
    .line 36
    iget-object v1, p0, Ll/vi60;->b:Lv/VMaterialEdit;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/si60;->o0(Lv/VMaterialEdit;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/vi60;->c:Lv/VButton_FakeShadow;

    .line 42
    .line 43
    iget-object v1, p0, Ll/vi60;->d:Ll/si60;

    .line 44
    .line 45
    iget-object p0, p0, Ll/vi60;->b:Lv/VMaterialEdit;

    .line 46
    .line 47
    invoke-virtual {v1, p0}, Ll/si60;->j0(Lv/VMaterialEdit;)Landroid/view/View$OnClickListener;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
