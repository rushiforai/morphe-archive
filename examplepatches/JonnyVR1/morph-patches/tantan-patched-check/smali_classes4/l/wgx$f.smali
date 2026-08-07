.class public Ll/wgx$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wgx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/wgx;


# direct methods
.method public constructor <init>(Ll/wgx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/wgx$f;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wgx$f;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wgx;->k(Ll/wgx;)Landroid/widget/PopupWindow;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 10
    .line 11
    invoke-static {v0}, Ll/wgx;->k(Ll/wgx;)Landroid/widget/PopupWindow;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 22
    .line 23
    invoke-static {v0}, Ll/wgx;->k(Ll/wgx;)Landroid/widget/PopupWindow;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-static {p0, v0}, Ll/wgx;->q(Ll/wgx;Landroid/widget/PopupWindow;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wgx;->j(Ll/wgx;)Ll/syl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 14
    .line 15
    invoke-static {v0}, Ll/wgx;->k(Ll/wgx;)Landroid/widget/PopupWindow;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 26
    .line 27
    invoke-static {v0}, Ll/wgx;->j(Ll/wgx;)Ll/syl;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/vgx;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/vgx;-><init>(Ll/wgx$f;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v1}, Ll/syl;->N(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v0, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-static {v0, v1}, Ll/wgx;->r(Ll/wgx;Ljava/util/LinkedList;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/wgx;->m(Ll/wgx;Lcom/p1/mobile/putong/data/User;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-static {v0, v2}, Ll/wgx;->l(Ll/wgx;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/wgx;->n(Ll/wgx;Landroid/view/GestureDetector;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/wgx$f;->a:Ll/wgx;

    .line 62
    .line 63
    invoke-static {p0, v2}, Ll/wgx;->p(Ll/wgx;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
