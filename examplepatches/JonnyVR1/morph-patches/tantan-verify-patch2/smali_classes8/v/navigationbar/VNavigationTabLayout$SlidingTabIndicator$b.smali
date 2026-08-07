.class public Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->k(ZII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;


# direct methods
.method public constructor <init>(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$b;->b:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 2
    .line 3
    iput p2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$b;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$b;->b:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 2
    .line 3
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$b;->a:I

    .line 4
    .line 5
    iput p0, p1, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->d:I

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    iput p0, p1, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->e:F

    .line 9
    .line 10
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$b;->b:Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;

    .line 2
    .line 3
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$b;->a:I

    .line 4
    .line 5
    iput p0, p1, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->d:I

    .line 6
    .line 7
    return-void
.end method
