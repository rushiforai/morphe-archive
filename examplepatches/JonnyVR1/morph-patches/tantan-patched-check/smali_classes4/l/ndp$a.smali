.class public Ll/ndp$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ndp;->e(Landroid/view/View;Ljava/lang/Runnable;Z)Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Ll/ndp;


# direct methods
.method public constructor <init>(Ll/ndp;Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ndp$a;->c:Ll/ndp;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ndp$a;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Ll/ndp$a;->b:Ljava/lang/Runnable;

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
    iget-object p1, p0, Ll/ndp$a;->c:Ll/ndp;

    .line 2
    .line 3
    invoke-static {p1}, Ll/ndp;->b(Ll/ndp;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/ndp$a;->c:Ll/ndp;

    .line 7
    .line 8
    iget-object v0, p0, Ll/ndp$a;->a:Landroid/view/View;

    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/ndp;->c(Ll/ndp;Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/ndp$a;->b:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ll/ndp$a;->b:Ljava/lang/Runnable;

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/ndp$a;->c:Ll/ndp;

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-static {p0, p1}, Ll/ndp;->a(Ll/ndp;Landroid/animation/AnimatorSet;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
