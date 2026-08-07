.class public Lv/navigationbar/VNavigationTabLayout$TabView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/navigationbar/VNavigationTabLayout$TabView;->K(ZZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lv/navigationbar/VNavigationTabLayout$TabView;


# direct methods
.method public constructor <init>(Lv/navigationbar/VNavigationTabLayout$TabView;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView$b;->b:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lv/navigationbar/VNavigationTabLayout$TabView$b;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-boolean v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView$b;->a:Z

    .line 6
    .line 7
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView$b;->b:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->e(Lv/navigationbar/VNavigationTabLayout$TabView;F)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 16
    .line 17
    sub-float/2addr v0, p1

    .line 18
    invoke-static {p0, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->e(Lv/navigationbar/VNavigationTabLayout$TabView;F)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
