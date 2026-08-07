.class public Lv/navigationbar/VNavigationTabLayout$TabView$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/navigationbar/VNavigationTabLayout$TabView;->K(ZZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/navigationbar/VNavigationTabLayout$TabView;


# direct methods
.method public constructor <init>(Lv/navigationbar/VNavigationTabLayout$TabView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView$c;->a:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView$c;->a:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->I()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView$c;->a:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p1, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->i(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView$c;->a:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 16
    .line 17
    invoke-static {p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->b(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView$c;->a:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 24
    .line 25
    invoke-static {p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->b(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView$c;->a:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 36
    .line 37
    invoke-static {p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->b(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView$c;->a:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
