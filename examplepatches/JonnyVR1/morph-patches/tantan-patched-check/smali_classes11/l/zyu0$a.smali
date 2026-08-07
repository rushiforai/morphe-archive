.class public abstract Ll/zyu0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zyu0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "a"
.end annotation


# instance fields
.field public final a:J

.field public final b:J

.field public final c:Z

.field public final synthetic d:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;)V
    .locals 1

    const/4 v0, 0x1

    .line 25
    invoke-direct {p0, p1, v0}, Ll/zyu0$a;-><init>(Ll/zyu0;Z)V

    return-void
.end method

.method public constructor <init>(Ll/zyu0;Z)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/zyu0$a;->d:Ll/zyu0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ll/zyu0;->b:Lcom/google/android/gms/common/util/Clock;

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p0, Ll/zyu0$a;->a:J

    .line 13
    .line 14
    iget-object p1, p1, Ll/zyu0;->b:Lcom/google/android/gms/common/util/Clock;

    .line 15
    .line 16
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    iput-wide v0, p0, Ll/zyu0$a;->b:J

    .line 21
    .line 22
    iput-boolean p2, p0, Ll/zyu0$a;->c:Z

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public abstract a()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zyu0$a;->d:Ll/zyu0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zyu0;->Q(Ll/zyu0;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/zyu0$a;->b()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ll/zyu0$a;->a()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception v0

    .line 18
    iget-object v1, p0, Ll/zyu0$a;->d:Ll/zyu0;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    iget-boolean v3, p0, Ll/zyu0$a;->c:Z

    .line 22
    .line 23
    invoke-static {v1, v0, v2, v3}, Ll/zyu0;->x(Ll/zyu0;Ljava/lang/Exception;ZZ)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/zyu0$a;->b()V

    .line 27
    .line 28
    .line 29
    return-void
.end method
