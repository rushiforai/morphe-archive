.class public Ll/owd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j5m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/j5m<",
        "Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;",
        ">;"
    }
.end annotation


# instance fields
.field public a:I

.field public final b:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/Runnable;

.field public d:Z

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/owd0;->a:I

    .line 6
    .line 7
    new-instance v0, Landroid/util/SparseArray;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/owd0;->b:Landroid/util/SparseArray;

    .line 13
    .line 14
    invoke-static {p1}, Ll/k1c;->n(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/owd0;->c:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    new-instance v0, Lcom/tantanapp/beatles/safety/exception/IgnoreException;

    .line 11
    .line 12
    const-string v1, "Toast \u8c03\u7528\u5931\u8d25\uff01"

    .line 13
    .line 14
    invoke-direct {v0, v1, p0}, Lcom/tantanapp/beatles/safety/exception/IgnoreException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    throw v0

    .line 18
    :cond_0
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/owd0;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public c(Ljava/lang/Throwable;)Z
    .locals 5

    .line 1
    invoke-static {}, Ll/vc60;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ":"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    invoke-static {}, Ll/g9r;->c()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v0, :cond_5

    .line 21
    .line 22
    invoke-static {}, Ll/du2;->e()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/yx0;->c(Landroid/content/Context;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    goto :goto_2

    .line 33
    :cond_1
    invoke-static {}, Ll/qtb;->b()Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v3, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 38
    .line 39
    if-eqz v3, :cond_2

    .line 40
    .line 41
    check-cast v3, Ljava/lang/Integer;

    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    move v3, v2

    .line 49
    :goto_0
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    check-cast v0, Ljava/lang/Integer;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    goto :goto_1

    .line 60
    :cond_3
    move v0, v2

    .line 61
    :goto_1
    iget-object v4, p0, Ll/owd0;->b:Landroid/util/SparseArray;

    .line 62
    .line 63
    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;

    .line 68
    .line 69
    if-eqz v4, :cond_4

    .line 70
    .line 71
    invoke-static {}, Ll/du2;->e()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v4, v2, p1}, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->execute(Landroid/content/Context;Ljava/lang/Throwable;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    :cond_4
    add-int/2addr v3, v1

    .line 80
    iget p0, p0, Ll/owd0;->a:I

    .line 81
    .line 82
    if-gt v3, p0, :cond_5

    .line 83
    .line 84
    invoke-static {v0, v3}, Ll/qtb;->d(II)V

    .line 85
    .line 86
    .line 87
    :cond_5
    :goto_2
    return v2
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/owd0;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public e(Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;)Ll/owd0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/owd0;->b:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->getCrashCount()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Ll/owd0;->a:I

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->getCrashCount()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Ll/owd0;->a:I

    .line 21
    .line 22
    return-object p0
.end method

.method public f(ZZZ)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/owd0;->d:Z

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/owd0;->e:Z

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/owd0;->f:Z

    .line 6
    .line 7
    return-void
.end method

.method public g(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/owd0;->c:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method
