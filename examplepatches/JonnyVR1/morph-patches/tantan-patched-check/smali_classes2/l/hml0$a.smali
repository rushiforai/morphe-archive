.class public Ll/hml0$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hml0;->h(Landroid/view/View;Ll/jml0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jml0;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ll/hml0;


# direct methods
.method public constructor <init>(Ll/hml0;Ll/jml0;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hml0$a;->c:Ll/hml0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hml0$a;->a:Ll/jml0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/hml0$a;->b:Landroid/view/View;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/hml0$a;->a:Ll/jml0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hml0$a;->b:Landroid/view/View;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/jml0;->onAnimationCancel(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/hml0$a;->a:Ll/jml0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hml0$a;->b:Landroid/view/View;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/jml0;->onAnimationEnd(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/hml0$a;->a:Ll/jml0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hml0$a;->b:Landroid/view/View;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/jml0;->onAnimationStart(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
