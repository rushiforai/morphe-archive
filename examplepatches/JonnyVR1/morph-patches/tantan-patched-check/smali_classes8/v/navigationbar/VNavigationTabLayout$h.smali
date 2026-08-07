.class public Lv/navigationbar/VNavigationTabLayout$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/navigationbar/VNavigationTabLayout$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/navigationbar/VNavigationTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation


# instance fields
.field public final a:Landroidx/viewpager/widget/ViewPager;


# direct methods
.method public constructor <init>(Landroidx/viewpager/widget/ViewPager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$h;->a:Landroidx/viewpager/widget/ViewPager;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 2
    .line 3
    invoke-static {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->d(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 10
    .line 11
    invoke-static {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->d(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/widget/TextView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public b(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 1
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$h;->a:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 11
    .line 12
    invoke-static {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->d(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/widget/TextView;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    iget-object p0, p1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 19
    .line 20
    invoke-static {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->d(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/widget/TextView;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
