.class public final Ll/ssv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/wuv0;

.field public final b:J

.field public final c:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method public constructor <init>(Ll/wuv0;JLjava/util/concurrent/ScheduledExecutorService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ssv0;->a:Ll/wuv0;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/ssv0;->b:J

    .line 7
    .line 8
    iput-object p4, p0, Ll/ssv0;->c:Ljava/util/concurrent/ScheduledExecutorService;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ssv0;->a:Ll/wuv0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/wuv0;->zza()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ssv0;->a:Ll/wuv0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/wuv0;->zzb()Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-wide v1, p0, Ll/ssv0;->b:J

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    cmp-long v3, v1, v3

    .line 12
    .line 13
    if-lez v3, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/ssv0;->c:Ljava/util/concurrent/ScheduledExecutorService;

    .line 16
    .line 17
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 18
    .line 19
    invoke-static {v0, v1, v2, v3, p0}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_0
    sget-object p0, Ll/rsv0;->a:Ll/rsv0;

    .line 24
    .line 25
    sget-object v1, Ll/oct0;->f:Ll/xvw0;

    .line 26
    .line 27
    const-class v2, Ljava/lang/Throwable;

    .line 28
    .line 29
    invoke-static {v0, v2, p0, v1}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method
