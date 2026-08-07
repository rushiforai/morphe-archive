.class public Lv/navigationbar/VNavigationBar$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/navigationbar/VNavigationBar;->setupViewPager(Landroidx/viewpager/widget/ViewPager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/w0m;

.field public final synthetic b:Lv/navigationbar/VNavigationBar;


# direct methods
.method public constructor <init>(Lv/navigationbar/VNavigationBar;Ll/w0m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/navigationbar/VNavigationBar$a;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iput-object p2, p0, Lv/navigationbar/VNavigationBar$a;->a:Ll/w0m;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/w0m;ILandroid/view/View;)Landroid/animation/Animator;
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2}, Ll/w0m;->a(ILandroid/view/View;)Landroid/animation/Animator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ll/w0m;ILandroid/view/View;)Landroid/animation/Animator;
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2}, Ll/w0m;->b(ILandroid/view/View;)Landroid/animation/Animator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationBar$a;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-static {v0}, Lv/navigationbar/VNavigationBar;->u(Lv/navigationbar/VNavigationBar;)Lv/navigationbar/IconAnimLayout;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lv/navigationbar/VNavigationBar$a;->b:Lv/navigationbar/VNavigationBar;

    .line 10
    .line 11
    invoke-static {v0}, Lv/navigationbar/VNavigationBar;->u(Lv/navigationbar/VNavigationBar;)Lv/navigationbar/IconAnimLayout;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lv/navigationbar/VNavigationBar$a;->a:Ll/w0m;

    .line 16
    .line 17
    invoke-interface {v1, p1}, Ll/w0m;->g(I)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Lv/navigationbar/VNavigationBar$a;->a:Ll/w0m;

    .line 22
    .line 23
    new-instance v3, Ll/wyk0;

    .line 24
    .line 25
    invoke-direct {v3, v2, p1}, Ll/wyk0;-><init>(Ll/w0m;I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lv/navigationbar/VNavigationBar$a;->a:Ll/w0m;

    .line 29
    .line 30
    new-instance v2, Ll/xyk0;

    .line 31
    .line 32
    invoke-direct {v2, p0, p1}, Ll/xyk0;-><init>(Ll/w0m;I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v3, v2}, Lv/navigationbar/IconAnimLayout;->e(Ljava/util/List;Ll/qcj;Ll/qcj;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method
