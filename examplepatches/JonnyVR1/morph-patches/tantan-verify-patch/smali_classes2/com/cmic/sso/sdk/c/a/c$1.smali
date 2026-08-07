.class Lcom/cmic/sso/sdk/c/a/c$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cmic/sso/sdk/c/d/c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cmic/sso/sdk/c/a/c;->b(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/c;Lcom/cmic/sso/sdk/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/cmic/sso/sdk/c/c/c;

.field final synthetic b:Lcom/cmic/sso/sdk/a;

.field final synthetic c:Lcom/cmic/sso/sdk/c/d/c;

.field final synthetic d:Lcom/cmic/sso/sdk/c/a/c;


# direct methods
.method public constructor <init>(Lcom/cmic/sso/sdk/c/a/c;Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/c/d/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/a/c$1;->d:Lcom/cmic/sso/sdk/c/a/c;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cmic/sso/sdk/c/a/c$1;->a:Lcom/cmic/sso/sdk/c/c/c;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/cmic/sso/sdk/c/a/c$1;->b:Lcom/cmic/sso/sdk/a;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/cmic/sso/sdk/c/a/c$1;->c:Lcom/cmic/sso/sdk/c/d/c;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Lcom/cmic/sso/sdk/c/d/a;)V
    .locals 2

    .line 75
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/a/c$1;->a:Lcom/cmic/sso/sdk/c/c/c;

    invoke-virtual {v0}, Lcom/cmic/sso/sdk/c/c/c;->i()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "retry: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/cmic/sso/sdk/c/a/c$1;->a:Lcom/cmic/sso/sdk/c/c/c;

    invoke-virtual {v0}, Lcom/cmic/sso/sdk/c/c/c;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "RetryAndRedirectInterceptor"

    invoke-static {v0, p1}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    iget-object p1, p0, Lcom/cmic/sso/sdk/c/a/c$1;->d:Lcom/cmic/sso/sdk/c/a/c;

    iget-object v0, p0, Lcom/cmic/sso/sdk/c/a/c$1;->a:Lcom/cmic/sso/sdk/c/c/c;

    iget-object v1, p0, Lcom/cmic/sso/sdk/c/a/c$1;->c:Lcom/cmic/sso/sdk/c/d/c;

    iget-object p0, p0, Lcom/cmic/sso/sdk/c/a/c$1;->b:Lcom/cmic/sso/sdk/a;

    invoke-virtual {p1, v0, v1, p0}, Lcom/cmic/sso/sdk/c/a/c;->b(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/c;Lcom/cmic/sso/sdk/a;)V

    return-void

    .line 78
    :cond_0
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/a/c$1;->c:Lcom/cmic/sso/sdk/c/d/c;

    invoke-interface {p0, p1}, Lcom/cmic/sso/sdk/c/d/c;->a(Lcom/cmic/sso/sdk/c/d/a;)V

    return-void
.end method

.method public a(Lcom/cmic/sso/sdk/c/d/b;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/cmic/sso/sdk/c/d/b;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/cmic/sso/sdk/c/a/c$1;->d:Lcom/cmic/sso/sdk/c/a/c;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {v1}, Lcom/cmic/sso/sdk/c/a/c;->a(Lcom/cmic/sso/sdk/c/a/c;)Lcom/cmic/sso/sdk/c/b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/cmic/sso/sdk/c/a/c$1;->a:Lcom/cmic/sso/sdk/c/c/c;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/cmic/sso/sdk/c/a/c$1;->b:Lcom/cmic/sso/sdk/a;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p1, v2}, Lcom/cmic/sso/sdk/c/b;->a(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/b;Lcom/cmic/sso/sdk/a;)Lcom/cmic/sso/sdk/c/c/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/a/c$1;->d:Lcom/cmic/sso/sdk/c/a/c;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/cmic/sso/sdk/c/a/c$1;->c:Lcom/cmic/sso/sdk/c/d/c;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/a/c$1;->b:Lcom/cmic/sso/sdk/a;

    .line 26
    .line 27
    invoke-virtual {v0, p1, v1, p0}, Lcom/cmic/sso/sdk/c/a/c;->b(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/c;Lcom/cmic/sso/sdk/a;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-static {v1}, Lcom/cmic/sso/sdk/c/a/c;->a(Lcom/cmic/sso/sdk/c/a/c;)Lcom/cmic/sso/sdk/c/b;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/cmic/sso/sdk/c/b;->a()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/a/c$1;->d:Lcom/cmic/sso/sdk/c/a/c;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/cmic/sso/sdk/c/a/c;->a(Lcom/cmic/sso/sdk/c/a/c;)Lcom/cmic/sso/sdk/c/b;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v1, p0, Lcom/cmic/sso/sdk/c/a/c$1;->a:Lcom/cmic/sso/sdk/c/c/c;

    .line 52
    .line 53
    iget-object v2, p0, Lcom/cmic/sso/sdk/c/a/c$1;->b:Lcom/cmic/sso/sdk/a;

    .line 54
    .line 55
    invoke-virtual {v0, v1, p1, v2}, Lcom/cmic/sso/sdk/c/b;->b(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/b;Lcom/cmic/sso/sdk/a;)Lcom/cmic/sso/sdk/c/c/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/a/c$1;->d:Lcom/cmic/sso/sdk/c/a/c;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/cmic/sso/sdk/c/a/c$1;->c:Lcom/cmic/sso/sdk/c/d/c;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/a/c$1;->b:Lcom/cmic/sso/sdk/a;

    .line 64
    .line 65
    invoke-virtual {v0, p1, v1, p0}, Lcom/cmic/sso/sdk/c/a/c;->b(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/c;Lcom/cmic/sso/sdk/a;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/a/c$1;->c:Lcom/cmic/sso/sdk/c/d/c;

    .line 70
    .line 71
    invoke-interface {p0, p1}, Lcom/cmic/sso/sdk/c/d/c;->a(Lcom/cmic/sso/sdk/c/d/b;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method
