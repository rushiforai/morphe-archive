.class public final Ll/d6y0;
.super Ll/l2s0;
.source "SourceFile"


# instance fields
.field public final synthetic e:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;Ll/hzx0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d6y0;->e:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/l2s0;-><init>(Ll/hzx0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final d()V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/d6y0;->e:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    iget-object v0, v0, Ll/yyx0;->a:Ll/atx0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/atx0;->p()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/d6y0;->e:Lcom/google/android/gms/measurement/internal/g;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/google/android/gms/measurement/internal/g;->F0(Lcom/google/android/gms/measurement/internal/g;)Ll/l2s0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-wide/16 v0, 0x7d0

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/l2s0;->b(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
