.class Ll/u7k$a$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s7k;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u7k$a$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/u7k$a$a;


# direct methods
.method public constructor <init>(Ll/u7k$a$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u7k$a$a$a;->a:Ll/u7k$a$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getGpuBenmark(D)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u7k$a$a$a;->a:Ll/u7k$a$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u7k$a$a;->a:Ll/u7k$a;

    .line 4
    .line 5
    iget-object v0, v0, Ll/u7k$a;->a:Ll/u7k;

    .line 6
    .line 7
    const-wide/high16 v1, 0x4008000000000000L    # 3.0

    .line 8
    .line 9
    div-double/2addr p1, v1

    .line 10
    invoke-static {v0, p1, p2}, Ll/u7k;->g(Ll/u7k;D)D

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/u7k$a$a$a;->a:Ll/u7k$a$a;

    .line 14
    .line 15
    iget-object p1, p1, Ll/u7k$a$a;->a:Ll/u7k$a;

    .line 16
    .line 17
    iget-object p1, p1, Ll/u7k$a;->a:Ll/u7k;

    .line 18
    .line 19
    invoke-static {p1}, Ll/u7k;->a(Ll/u7k;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget-object p2, p0, Ll/u7k$a$a$a;->a:Ll/u7k$a$a;

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    if-eq p1, v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p2, Ll/u7k$a$a;->a:Ll/u7k$a;

    .line 29
    .line 30
    iget-object p0, p0, Ll/u7k$a;->a:Ll/u7k;

    .line 31
    .line 32
    invoke-static {p0}, Ll/u7k;->d(Ll/u7k;)Ll/q7k;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/q7k;->c()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object p1, p2, Ll/u7k$a$a;->a:Ll/u7k$a;

    .line 41
    .line 42
    iget-object p1, p1, Ll/u7k$a;->a:Ll/u7k;

    .line 43
    .line 44
    invoke-static {p1}, Ll/u7k;->h(Ll/u7k;)Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Ll/cq80;->c(Landroid/content/Context;)I

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/u7k$a$a$a;->a:Ll/u7k$a$a;

    .line 52
    .line 53
    iget-object p1, p1, Ll/u7k$a$a;->a:Ll/u7k$a;

    .line 54
    .line 55
    iget-object p1, p1, Ll/u7k$a;->a:Ll/u7k;

    .line 56
    .line 57
    invoke-static {p1}, Ll/u7k;->f(Ll/u7k;)D

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    invoke-static {p1, v0, v1}, Ll/u7k;->i(Ll/u7k;D)I

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/u7k$a$a$a;->a:Ll/u7k$a$a;

    .line 65
    .line 66
    iget-object p0, p0, Ll/u7k$a$a;->a:Ll/u7k$a;

    .line 67
    .line 68
    iget-object p0, p0, Ll/u7k$a;->a:Ll/u7k;

    .line 69
    .line 70
    invoke-static {p0}, Ll/u7k;->j(Ll/u7k;)Ll/r7k;

    .line 71
    .line 72
    .line 73
    const/4 p0, 0x0

    .line 74
    throw p0
.end method
