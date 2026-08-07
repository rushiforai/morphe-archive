.class public final Ll/ryx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/internal/appset/a;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/internal/appset/a;Ll/vtx0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ryx0;->a:Lcom/google/android/gms/internal/appset/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ryx0;->a:Lcom/google/android/gms/internal/appset/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/appset/a;->b()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, -0x1

    .line 8
    .line 9
    cmp-long v2, v0, v2

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/google/android/gms/common/util/DefaultClock;->getInstance()Lcom/google/android/gms/common/util/Clock;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    cmp-long v0, v2, v0

    .line 22
    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/ryx0;->a:Lcom/google/android/gms/internal/appset/a;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/google/android/gms/internal/appset/a;->c(Lcom/google/android/gms/internal/appset/a;)Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/google/android/gms/internal/appset/a;->f(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
