.class public Lv/navigationbar/VNavigationTabLayout$f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/navigationbar/VNavigationTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation


# instance fields
.field public a:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Landroid/graphics/drawable/Drawable;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ljava/lang/CharSequence;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ljava/lang/CharSequence;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:I

.field public f:Landroid/view/View;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:I

.field public h:Lv/navigationbar/VNavigationTabLayout;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Lv/navigationbar/VNavigationTabLayout$TabView;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->e:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->g:I

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lv/navigationbar/VNavigationTabLayout$f;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$f;->d:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic b(Lv/navigationbar/VNavigationTabLayout$f;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout$f;->g:I

    return p0
.end method

.method public static bridge synthetic c(Lv/navigationbar/VNavigationTabLayout$f;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$f;->c:Ljava/lang/CharSequence;

    return-object p0
.end method


# virtual methods
.method public d()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$f;->f:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Landroid/graphics/drawable/Drawable;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$f;->b:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout$f;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout$f;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public h()Ljava/lang/CharSequence;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$f;->c:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->h:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout;->getSelectedTabPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout$f;->e:I

    .line 10
    .line 11
    if-ne v0, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    const-string p0, "Tab not attached to a TabLayout"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public j()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->h:Lv/navigationbar/VNavigationTabLayout;

    .line 3
    .line 4
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 5
    .line 6
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->a:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->b:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->c:Ljava/lang/CharSequence;

    .line 11
    .line 12
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->d:Ljava/lang/CharSequence;

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    iput v1, p0, Lv/navigationbar/VNavigationTabLayout$f;->e:I

    .line 16
    .line 17
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->f:Landroid/view/View;

    .line 18
    .line 19
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->h:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationTabLayout;->D(Lv/navigationbar/VNavigationTabLayout$f;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "Tab not attached to a TabLayout"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public l(Ljava/lang/CharSequence;)Lv/navigationbar/VNavigationTabLayout$f;
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$f;->d:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$f;->r()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public m(I)Lv/navigationbar/VNavigationTabLayout$f;
    .locals 3
    .param p1    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$f;->n(Landroid/view/View;)Lv/navigationbar/VNavigationTabLayout$f;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public n(Landroid/view/View;)Lv/navigationbar/VNavigationTabLayout$f;
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$f;->f:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$f;->r()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public o(Landroid/graphics/drawable/Drawable;)Lv/navigationbar/VNavigationTabLayout$f;
    .locals 3
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$f;->b:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$f;->h:Lv/navigationbar/VNavigationTabLayout;

    .line 4
    .line 5
    iget v0, p1, Lv/navigationbar/VNavigationTabLayout;->G:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    iget v0, p1, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p1, v1}, Lv/navigationbar/VNavigationTabLayout;->M(Z)V

    .line 16
    .line 17
    .line 18
    :cond_1
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$f;->r()V

    .line 19
    .line 20
    .line 21
    sget-boolean p1, Lcom/google/android/material/badge/BadgeUtils;->USE_COMPAT_PARENT:Z

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 26
    .line 27
    invoke-static {p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->g(Lv/navigationbar/VNavigationTabLayout$TabView;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 34
    .line 35
    invoke-static {p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->a(Lv/navigationbar/VNavigationTabLayout$TabView;)Lcom/google/android/material/badge/BadgeDrawable;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 51
    .line 52
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->A()V

    .line 53
    .line 54
    .line 55
    return-object p0
.end method

.method public p(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout$f;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public q(Ljava/lang/CharSequence;)Lv/navigationbar/VNavigationTabLayout$f;
    .locals 1
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->d:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$f;->c:Ljava/lang/CharSequence;

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-lez v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->B(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$f;->r()V

    .line 40
    .line 41
    .line 42
    return-object p0
.end method

.method public r()V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->I()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
