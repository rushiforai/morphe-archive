.class public final Ll/b8y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/zzje;

.field public final synthetic b:J

.field public final synthetic c:J

.field public final synthetic d:Z

.field public final synthetic e:Lcom/google/android/gms/measurement/internal/zzje;

.field public final synthetic f:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;Lcom/google/android/gms/measurement/internal/zzje;JJZLcom/google/android/gms/measurement/internal/zzje;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/b8y0;->a:Lcom/google/android/gms/measurement/internal/zzje;

    .line 2
    .line 3
    iput-wide p3, p0, Ll/b8y0;->b:J

    .line 4
    .line 5
    iput-wide p5, p0, Ll/b8y0;->c:J

    .line 6
    .line 7
    iput-boolean p7, p0, Ll/b8y0;->d:Z

    .line 8
    .line 9
    iput-object p8, p0, Ll/b8y0;->e:Lcom/google/android/gms/measurement/internal/zzje;

    .line 10
    .line 11
    iput-object p1, p0, Ll/b8y0;->f:Lcom/google/android/gms/measurement/internal/g;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/b8y0;->f:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    iget-object v1, p0, Ll/b8y0;->a:Lcom/google/android/gms/measurement/internal/zzje;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/g;->K(Lcom/google/android/gms/measurement/internal/zzje;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/ziy0;->a()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/b8y0;->f:Lcom/google/android/gms/measurement/internal/g;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/yyx0;->a()Ll/ajr0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Ll/whs0;->Y0:Ll/zpw0;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/b8y0;->f:Lcom/google/android/gms/measurement/internal/g;

    .line 29
    .line 30
    iget-wide v1, p0, Ll/b8y0;->b:J

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/g;->D(JZ)V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget-object v4, p0, Ll/b8y0;->f:Lcom/google/android/gms/measurement/internal/g;

    .line 37
    .line 38
    iget-object v5, p0, Ll/b8y0;->a:Lcom/google/android/gms/measurement/internal/zzje;

    .line 39
    .line 40
    iget-wide v6, p0, Ll/b8y0;->c:J

    .line 41
    .line 42
    const/4 v8, 0x1

    .line 43
    iget-boolean v9, p0, Ll/b8y0;->d:Z

    .line 44
    .line 45
    invoke-static/range {v4 .. v9}, Lcom/google/android/gms/measurement/internal/g;->O(Lcom/google/android/gms/measurement/internal/g;Lcom/google/android/gms/measurement/internal/zzje;JZZ)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/b8y0;->f:Lcom/google/android/gms/measurement/internal/g;

    .line 49
    .line 50
    iget-object v1, p0, Ll/b8y0;->a:Lcom/google/android/gms/measurement/internal/zzje;

    .line 51
    .line 52
    iget-object p0, p0, Ll/b8y0;->e:Lcom/google/android/gms/measurement/internal/zzje;

    .line 53
    .line 54
    invoke-static {v0, v1, p0}, Lcom/google/android/gms/measurement/internal/g;->P(Lcom/google/android/gms/measurement/internal/g;Lcom/google/android/gms/measurement/internal/zzje;Lcom/google/android/gms/measurement/internal/zzje;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
