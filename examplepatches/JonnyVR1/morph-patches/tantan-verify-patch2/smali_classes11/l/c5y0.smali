.class public final Ll/c5y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-wide p2, p0, Ll/c5y0;->a:J

    .line 2
    .line 3
    iput-object p1, p0, Ll/c5y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c5y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/ajx0;->m:Ll/zjx0;

    .line 8
    .line 9
    iget-wide v1, p0, Ll/c5y0;->a:J

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/zjx0;->b(J)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/c5y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/d6x0;->z()Ll/l8x0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-wide v1, p0, Ll/c5y0;->a:J

    .line 25
    .line 26
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v1, "Session timeout duration set"

    .line 31
    .line 32
    invoke-virtual {v0, v1, p0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
