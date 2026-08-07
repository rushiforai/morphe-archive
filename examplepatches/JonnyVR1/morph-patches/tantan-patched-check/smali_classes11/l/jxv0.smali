.class public final Ll/jxv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/ebt0;

.field public final c:Ljava/util/concurrent/ScheduledExecutorService;

.field public final d:Ljava/util/concurrent/Executor;

.field public final e:Ljava/lang/String;

.field public final f:Ll/vat0;


# direct methods
.method public constructor <init>(Ll/vat0;ILandroid/content/Context;Ll/ebt0;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jxv0;->f:Ll/vat0;

    .line 5
    .line 6
    iput-object p3, p0, Ll/jxv0;->a:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p4, p0, Ll/jxv0;->b:Ll/ebt0;

    .line 9
    .line 10
    iput-object p5, p0, Ll/jxv0;->c:Ljava/util/concurrent/ScheduledExecutorService;

    .line 11
    .line 12
    iput-object p6, p0, Ll/jxv0;->d:Ljava/util/concurrent/Executor;

    .line 13
    .line 14
    iput-object p7, p0, Ll/jxv0;->e:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Exception;)Ll/kxv0;
    .locals 1

    .line 1
    const-string v0, "AttestationTokenSignal"

    .line 2
    .line 3
    iget-object p0, p0, Ll/jxv0;->b:Ll/ebt0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x2c

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 5

    .line 1
    new-instance v0, Ll/gxv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gxv0;-><init>(Ll/jxv0;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/jxv0;->d:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/pvw0;->k(Ll/wuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Ll/hxv0;->a:Ll/hxv0;

    .line 17
    .line 18
    iget-object v2, p0, Ll/jxv0;->d:Ljava/util/concurrent/Executor;

    .line 19
    .line 20
    invoke-static {v0, v1, v2}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v1, Ll/sgs0;->V0:Ll/dgs0;

    .line 25
    .line 26
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/Long;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 37
    .line 38
    .line 39
    move-result-wide v1

    .line 40
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 41
    .line 42
    iget-object v4, p0, Ll/jxv0;->c:Ljava/util/concurrent/ScheduledExecutorService;

    .line 43
    .line 44
    invoke-static {v0, v1, v2, v3, v4}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ll/gvw0;

    .line 49
    .line 50
    new-instance v1, Ll/ixv0;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/ixv0;-><init>(Ll/jxv0;)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/google/android/gms/internal/ads/u3;->b()Ljava/util/concurrent/Executor;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-class v2, Ljava/lang/Exception;

    .line 60
    .line 61
    invoke-static {v0, v2, v1, p0}, Ll/pvw0;->e(Ll/hpr;Ljava/lang/Class;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method
