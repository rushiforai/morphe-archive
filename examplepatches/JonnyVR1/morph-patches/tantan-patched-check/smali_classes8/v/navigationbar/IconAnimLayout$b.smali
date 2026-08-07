.class public Lv/navigationbar/IconAnimLayout$b;
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
.field public final synthetic a:Lv/navigationbar/IconAnimLayout;


# direct methods
.method public constructor <init>(Lv/navigationbar/IconAnimLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/navigationbar/IconAnimLayout$b;->a:Lv/navigationbar/IconAnimLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 4
    .line 5
    .line 6
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
