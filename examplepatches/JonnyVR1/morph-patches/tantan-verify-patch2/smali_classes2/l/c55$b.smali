.class public Ll/c55$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/c55;->m()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/c55$c;

.field public final synthetic b:Ll/c55;


# direct methods
.method public constructor <init>(Ll/c55;Ll/c55$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c55$b;->b:Ll/c55;

    .line 2
    .line 3
    iput-object p2, p0, Ll/c55$b;->a:Ll/c55$c;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/c55$b;->b:Ll/c55;

    .line 2
    .line 3
    iget-object v1, p0, Ll/c55$b;->a:Ll/c55$c;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/high16 v3, 0x3f800000    # 1.0f

    .line 7
    .line 8
    invoke-virtual {v0, v3, v1, v2}, Ll/c55;->b(FLl/c55$c;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/c55$b;->a:Ll/c55$c;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/c55$c;->A()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/c55$b;->a:Ll/c55$c;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/c55$c;->l()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/c55$b;->b:Ll/c55;

    .line 22
    .line 23
    iget-boolean v1, v0, Ll/c55;->f:Z

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    iput-boolean v1, v0, Ll/c55;->f:Z

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 31
    .line 32
    .line 33
    const-wide/16 v2, 0x534

    .line 34
    .line 35
    invoke-virtual {p1, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/c55$b;->a:Ll/c55$c;

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Ll/c55$c;->x(Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget p0, v0, Ll/c55;->e:F

    .line 48
    .line 49
    add-float/2addr p0, v3

    .line 50
    iput p0, v0, Ll/c55;->e:F

    .line 51
    .line 52
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c55$b;->b:Ll/c55;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Ll/c55;->e:F

    .line 5
    .line 6
    return-void
.end method
