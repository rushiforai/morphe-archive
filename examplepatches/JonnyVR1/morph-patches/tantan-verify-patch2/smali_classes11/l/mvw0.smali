.class public final Ll/mvw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Ljava/util/concurrent/Future;

.field public final b:Ll/lvw0;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Future;Ll/lvw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mvw0;->a:Ljava/util/concurrent/Future;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mvw0;->b:Ll/lvw0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mvw0;->a:Ljava/util/concurrent/Future;

    .line 2
    .line 3
    instance-of v1, v0, Ll/hww0;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    check-cast v0, Ll/hww0;

    .line 8
    .line 9
    invoke-static {v0}, Ll/iww0;->a(Ll/hww0;)Ljava/lang/Throwable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/mvw0;->b:Ll/lvw0;

    .line 17
    .line 18
    invoke-interface {p0, v0}, Ll/lvw0;->zza(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    :goto_0
    :try_start_0
    iget-object v0, p0, Ll/mvw0;->a:Ljava/util/concurrent/Future;

    .line 23
    .line 24
    invoke-static {v0}, Ll/pvw0;->p(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    iget-object p0, p0, Ll/mvw0;->b:Ll/lvw0;

    .line 29
    .line 30
    invoke-interface {p0, v0}, Ll/lvw0;->zzb(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_1

    .line 36
    :catch_0
    move-exception v0

    .line 37
    goto :goto_2

    .line 38
    :goto_1
    iget-object p0, p0, Ll/mvw0;->b:Ll/lvw0;

    .line 39
    .line 40
    invoke-interface {p0, v0}, Ll/lvw0;->zza(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :goto_2
    iget-object p0, p0, Ll/mvw0;->b:Ll/lvw0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {p0, v0}, Ll/lvw0;->zza(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Ll/jow0;->a(Ljava/lang/Object;)Ll/iow0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/mvw0;->b:Ll/lvw0;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/iow0;->a(Ljava/lang/Object;)Ll/iow0;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ll/iow0;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
