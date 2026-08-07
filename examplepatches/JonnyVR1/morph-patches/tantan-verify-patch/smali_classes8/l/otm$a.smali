.class public Ll/otm$a;
.super Ll/gcj;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/otm;->w()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/otm;


# direct methods
.method public constructor <init>(Ll/otm;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/otm$a;->a:Ll/otm;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcj;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/otm$a;->a:Ll/otm;

    .line 2
    .line 3
    invoke-static {v0}, Ll/otm;->f(Ll/otm;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/otm$a;->a:Ll/otm;

    .line 10
    .line 11
    invoke-static {v0}, Ll/otm;->j(Ll/otm;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/otm$a;->a:Ll/otm;

    .line 18
    .line 19
    invoke-static {v0}, Ll/otm;->e(Ll/otm;)Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    new-instance v1, Landroid/content/Intent;

    .line 30
    .line 31
    iget-object v2, p0, Ll/otm$a;->a:Ll/otm;

    .line 32
    .line 33
    invoke-static {v2}, Ll/otm;->e(Ll/otm;)Ljava/lang/ref/WeakReference;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Landroid/content/Context;

    .line 42
    .line 43
    const-class v3, Lcom/p1/mobile/putong/core/ui/incentivevideo/IncentVideoResultAct;

    .line 44
    .line 45
    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/otm$a;->a:Ll/otm;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-static {v0, v1}, Ll/otm;->i(Ll/otm;Ll/v8d0;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/otm$a;->a:Ll/otm;

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-static {p0, v0}, Ll/otm;->h(Ll/otm;Z)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public c(Ll/b70;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/otm$a;->a:Ll/otm;

    .line 2
    .line 3
    invoke-static {p1}, Ll/otm;->g(Ll/otm;)Ll/v8d0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0}, Ll/v8d0;->c(Ll/gcj;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/otm$a;->a:Ll/otm;

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/otm;->i(Ll/otm;Ll/v8d0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    return-void
.end method
