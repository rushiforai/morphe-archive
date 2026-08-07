.class public final Ll/l9t0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/content/Context;

.field public b:Lcom/google/android/gms/common/util/Clock;

.field public c:Ll/grw0;

.field public d:Ll/s9t0;


# direct methods
.method public synthetic constructor <init>(Ll/d9t0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/grw0;)Ll/l9t0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l9t0;->c:Ll/grw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Landroid/content/Context;)Ll/l9t0;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l9t0;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-object p0
.end method

.method public final c(Lcom/google/android/gms/common/util/Clock;)Ll/l9t0;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l9t0;->b:Lcom/google/android/gms/common/util/Clock;

    .line 5
    .line 6
    return-object p0
.end method

.method public final d(Ll/s9t0;)Ll/l9t0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l9t0;->d:Ll/s9t0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ll/t9t0;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/l9t0;->a:Landroid/content/Context;

    .line 2
    .line 3
    const-class v1, Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/l9t0;->b:Lcom/google/android/gms/common/util/Clock;

    .line 9
    .line 10
    const-class v1, Lcom/google/android/gms/common/util/Clock;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/l9t0;->c:Ll/grw0;

    .line 16
    .line 17
    const-class v1, Ll/grw0;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/l9t0;->d:Ll/s9t0;

    .line 23
    .line 24
    const-class v1, Ll/s9t0;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/n9t0;

    .line 30
    .line 31
    iget-object v3, p0, Ll/l9t0;->a:Landroid/content/Context;

    .line 32
    .line 33
    iget-object v4, p0, Ll/l9t0;->b:Lcom/google/android/gms/common/util/Clock;

    .line 34
    .line 35
    iget-object v5, p0, Ll/l9t0;->c:Ll/grw0;

    .line 36
    .line 37
    iget-object v6, p0, Ll/l9t0;->d:Ll/s9t0;

    .line 38
    .line 39
    const/4 v7, 0x0

    .line 40
    invoke-direct/range {v2 .. v7}, Ll/n9t0;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/util/Clock;Ll/grw0;Ll/s9t0;Ll/m9t0;)V

    .line 41
    .line 42
    .line 43
    return-object v2
.end method
