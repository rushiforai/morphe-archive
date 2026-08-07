.class public Ll/zif0$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zif0;->g2(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/animation/Animator;

.field public final synthetic b:Landroid/animation/Animator;

.field public final synthetic c:Ll/zif0;


# direct methods
.method public constructor <init>(Ll/zif0;Landroid/animation/Animator;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zif0$b;->c:Ll/zif0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zif0$b;->a:Landroid/animation/Animator;

    .line 4
    .line 5
    iput-object p3, p0, Ll/zif0$b;->b:Landroid/animation/Animator;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/zif0$b;->c:Ll/zif0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/zif0;->o:Lv/VImage;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/zif0$b;->c:Ll/zif0;

    .line 10
    .line 11
    iget-object p1, p1, Ll/zif0;->e:Lv/VFrame;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/zif0$b;->c:Ll/zif0;

    .line 18
    .line 19
    iget-object p1, p1, Ll/zif0;->c:Landroid/view/View;

    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/zif0$b;->a:Landroid/animation/Animator;

    .line 25
    .line 26
    iget-object p0, p0, Ll/zif0$b;->b:Landroid/animation/Animator;

    .line 27
    .line 28
    filled-new-array {p1, p0}, [Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 37
    .line 38
    .line 39
    return-void
.end method
