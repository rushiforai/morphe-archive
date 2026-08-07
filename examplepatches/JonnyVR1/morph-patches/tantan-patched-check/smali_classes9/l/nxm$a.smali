.class public Ll/nxm$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nxm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/nxm;


# direct methods
.method public constructor <init>(Ll/nxm;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxm$a;->a:Ll/nxm;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/nxm$a;->a:Ll/nxm;

    .line 2
    .line 3
    iget-boolean v0, p1, Ll/nxm;->k:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/nxm;->j(Ll/nxm;)Ll/x20;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/nxm$a;->a:Ll/nxm;

    .line 18
    .line 19
    invoke-static {p1}, Ll/nxm;->j(Ll/nxm;)Ll/x20;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Ll/x20;->call()V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->E9()V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/nxm$a;->a:Ll/nxm;

    .line 38
    .line 39
    invoke-static {p1}, Ll/nxm;->l(Ll/nxm;)Ll/l4g0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/nxm$a;->a:Ll/nxm;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/nxm;->L()V

    .line 49
    .line 50
    .line 51
    return-void
.end method
