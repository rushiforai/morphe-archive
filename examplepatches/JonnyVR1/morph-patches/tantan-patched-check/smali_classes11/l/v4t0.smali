.class public final Ll/v4t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ll/x4t0;


# direct methods
.method public constructor <init>(Ll/x4t0;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/v4t0;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p1, p0, Ll/v4t0;->b:Ll/x4t0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic call()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/v4t0;->b:Ll/x4t0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/x4t0;->a(Ll/x4t0;)Ljava/util/WeakHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/v4t0;->a:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/w4t0;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    sget-object v1, Ll/ois0;->a:Ll/kis0;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/lang/Long;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    iget-wide v3, v0, Ll/w4t0;->a:J

    .line 30
    .line 31
    add-long/2addr v3, v1

    .line 32
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 37
    .line 38
    .line 39
    move-result-wide v1

    .line 40
    cmp-long v1, v3, v1

    .line 41
    .line 42
    if-gez v1, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget-object v1, p0, Ll/v4t0;->a:Landroid/content/Context;

    .line 46
    .line 47
    iget-object v0, v0, Ll/w4t0;->b:Ll/u4t0;

    .line 48
    .line 49
    new-instance v2, Ll/t4t0;

    .line 50
    .line 51
    invoke-direct {v2, v1, v0}, Ll/t4t0;-><init>(Landroid/content/Context;Ll/u4t0;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Ll/t4t0;->a()Ll/u4t0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/v4t0;->a:Landroid/content/Context;

    .line 60
    .line 61
    new-instance v1, Ll/t4t0;

    .line 62
    .line 63
    invoke-direct {v1, v0}, Ll/t4t0;-><init>(Landroid/content/Context;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ll/t4t0;->a()Ll/u4t0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :goto_1
    iget-object v1, p0, Ll/v4t0;->b:Ll/x4t0;

    .line 71
    .line 72
    iget-object p0, p0, Ll/v4t0;->a:Landroid/content/Context;

    .line 73
    .line 74
    invoke-static {v1}, Ll/x4t0;->a(Ll/x4t0;)Ljava/util/WeakHashMap;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    new-instance v3, Ll/w4t0;

    .line 79
    .line 80
    invoke-direct {v3, v1, v0}, Ll/w4t0;-><init>(Ll/x4t0;Ll/u4t0;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, p0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    return-object v0
.end method
