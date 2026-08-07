.class public Lv/navigationbar/IconAnimLayout$a;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/navigationbar/IconAnimLayout;->f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;Ljava/util/List;Ll/qcj;Ll/qcj;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/ViewGroup;

.field public final synthetic b:Lv/navigationbar/IconAnimLayout;


# direct methods
.method public constructor <init>(Lv/navigationbar/IconAnimLayout;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/navigationbar/IconAnimLayout$a;->b:Lv/navigationbar/IconAnimLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lv/navigationbar/IconAnimLayout$a;->a:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/gt0$j;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/animation/Animator;->end()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/gt0$j;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lv/navigationbar/IconAnimLayout$a;->b:Lv/navigationbar/IconAnimLayout;

    .line 5
    .line 6
    iget-object p0, p0, Lv/navigationbar/IconAnimLayout$a;->a:Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p1, p0, v0}, Lv/navigationbar/IconAnimLayout;->b(Lv/navigationbar/IconAnimLayout;Landroid/view/ViewGroup;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
