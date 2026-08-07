.class public abstract Lcom/vivo/push/o;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/vivo/push/o;->a:I

    .line 6
    .line 7
    if-ltz p1, :cond_0

    .line 8
    .line 9
    iput p1, p0, Lcom/vivo/push/o;->a:I

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string p0, "PushCommand: the value of command must > 0."

    .line 13
    .line 14
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    throw p0
.end method

.method private e(Lcom/vivo/push/a;)V
    .locals 2

    .line 1
    const-string v0, "command"

    .line 2
    .line 3
    iget v1, p0, Lcom/vivo/push/o;->a:I

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/a;->a(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    const-string v0, "client_pkgname"

    .line 9
    .line 10
    iget-object v1, p0, Lcom/vivo/push/o;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/vivo/push/o;->c(Lcom/vivo/push/a;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/vivo/push/o;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final a(Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/vivo/push/a;->a(Landroid/content/Intent;)Lcom/vivo/push/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "PushCommand"

    .line 8
    .line 9
    const-string p1, "bundleWapper is null"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/vivo/push/util/p;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0, v0}, Lcom/vivo/push/o;->a(Lcom/vivo/push/a;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/vivo/push/a;->b()Landroid/os/Bundle;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final a(Lcom/vivo/push/a;)V
    .locals 2

    .line 30
    iget v0, p0, Lcom/vivo/push/o;->a:I

    invoke-static {v0}, Lcom/vivo/push/p;->a(I)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 31
    const-string v0, ""

    :cond_0
    const-string v1, "method"

    invoke-virtual {p1, v1, v0}, Lcom/vivo/push/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    invoke-direct {p0, p1}, Lcom/vivo/push/o;->e(Lcom/vivo/push/a;)V

    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/vivo/push/o;->b:Ljava/lang/String;

    return-void
.end method

.method public final b()I
    .locals 0

    .line 35
    iget p0, p0, Lcom/vivo/push/o;->a:I

    return p0
.end method

.method public final b(Landroid/content/Intent;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/vivo/push/a;->a(Landroid/content/Intent;)Lcom/vivo/push/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "PushCommand"

    .line 8
    .line 9
    const-string p1, "bundleWapper is null"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/vivo/push/util/p;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string v1, "method"

    .line 16
    .line 17
    iget v2, p0, Lcom/vivo/push/o;->a:I

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/vivo/push/a;->a(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0, v0}, Lcom/vivo/push/o;->e(Lcom/vivo/push/a;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/vivo/push/a;->b()Landroid/os/Bundle;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public final b(Lcom/vivo/push/a;)V
    .locals 2

    .line 36
    invoke-virtual {p1}, Lcom/vivo/push/a;->a()Ljava/lang/String;

    move-result-object v0

    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 38
    iput-object v0, p0, Lcom/vivo/push/o;->b:Ljava/lang/String;

    goto :goto_0

    .line 39
    :cond_0
    const-string v0, "client_pkgname"

    invoke-virtual {p1, v0}, Lcom/vivo/push/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vivo/push/o;->b:Ljava/lang/String;

    .line 40
    :goto_0
    invoke-virtual {p0, p1}, Lcom/vivo/push/o;->d(Lcom/vivo/push/a;)V

    return-void
.end method

.method public abstract c(Lcom/vivo/push/a;)V
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public abstract d(Lcom/vivo/push/a;)V
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
