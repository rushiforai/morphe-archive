.class public Ll/zif0$a;
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
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/zif0;


# direct methods
.method public constructor <init>(Ll/zif0;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zif0$a;->b:Ll/zif0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zif0$a;->a:Ll/x20;

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
    .locals 1

    .line 1
    iget-object p1, p0, Ll/zif0$a;->b:Ll/zif0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, v0}, Ll/zif0;->c2(I)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/zif0$a;->b:Ll/zif0;

    .line 8
    .line 9
    iget-object p1, p1, Ll/zif0;->g:Lv/VImage;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/zif0$a;->b:Ll/zif0;

    .line 16
    .line 17
    invoke-static {p1}, Ll/zif0;->y0(Ll/zif0;)Ll/jxd0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/zif0$a;->a:Ll/x20;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Ll/zif0$a;->a:Ll/x20;

    .line 35
    .line 36
    invoke-interface {p0}, Ll/x20;->call()V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method
