.class public final Ll/hjy0;
.super Ll/l2s0;
.source "SourceFile"


# instance fields
.field public final synthetic e:Ll/kjy0;


# direct methods
.method public constructor <init>(Ll/kjy0;Ll/hzx0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hjy0;->e:Ll/kjy0;

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

    .line 1
    iget-object v0, p0, Ll/hjy0;->e:Ll/kjy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/kjy0;->t()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/hjy0;->e:Ll/kjy0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "Starting upload from DelayedRunnable"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/hjy0;->e:Ll/kjy0;

    .line 22
    .line 23
    iget-object p0, p0, Ll/qjy0;->b:Lcom/google/android/gms/measurement/internal/j;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/j;->z0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
