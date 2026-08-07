.class public final Ll/s4y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-boolean p2, p0, Ll/s4y0;->a:Z

    .line 2
    .line 3
    iput-object p1, p0, Ll/s4y0;->b:Lcom/google/android/gms/measurement/internal/g;

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
    .locals 4

    .line 1
    iget-object v0, p0, Ll/s4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    iget-object v0, v0, Ll/yyx0;->a:Ll/atx0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/atx0;->k()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/s4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 10
    .line 11
    iget-object v1, v1, Ll/yyx0;->a:Ll/atx0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/atx0;->j()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object v2, p0, Ll/s4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 18
    .line 19
    iget-object v2, v2, Ll/yyx0;->a:Ll/atx0;

    .line 20
    .line 21
    iget-boolean v3, p0, Ll/s4y0;->a:Z

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ll/atx0;->h(Z)V

    .line 24
    .line 25
    .line 26
    iget-boolean v2, p0, Ll/s4y0;->a:Z

    .line 27
    .line 28
    if-ne v1, v2, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Ll/s4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 31
    .line 32
    iget-object v1, v1, Ll/yyx0;->a:Ll/atx0;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/atx0;->zzj()Ll/d6x0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ll/d6x0;->E()Ll/l8x0;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-boolean v2, p0, Ll/s4y0;->a:Z

    .line 43
    .line 44
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const-string v3, "Default data collection state already set to"

    .line 49
    .line 50
    invoke-virtual {v1, v3, v2}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    iget-object v1, p0, Ll/s4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 54
    .line 55
    iget-object v1, v1, Ll/yyx0;->a:Ll/atx0;

    .line 56
    .line 57
    invoke-virtual {v1}, Ll/atx0;->k()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eq v1, v0, :cond_1

    .line 62
    .line 63
    iget-object v1, p0, Ll/s4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 64
    .line 65
    iget-object v1, v1, Ll/yyx0;->a:Ll/atx0;

    .line 66
    .line 67
    invoke-virtual {v1}, Ll/atx0;->k()Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iget-object v2, p0, Ll/s4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 72
    .line 73
    iget-object v2, v2, Ll/yyx0;->a:Ll/atx0;

    .line 74
    .line 75
    invoke-virtual {v2}, Ll/atx0;->j()Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eq v1, v2, :cond_2

    .line 80
    .line 81
    :cond_1
    iget-object v1, p0, Ll/s4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 82
    .line 83
    iget-object v1, v1, Ll/yyx0;->a:Ll/atx0;

    .line 84
    .line 85
    invoke-virtual {v1}, Ll/atx0;->zzj()Ll/d6x0;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v1}, Ll/d6x0;->G()Ll/l8x0;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iget-boolean v2, p0, Ll/s4y0;->a:Z

    .line 94
    .line 95
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-string v3, "Default data collection is different than actual status"

    .line 104
    .line 105
    invoke-virtual {v1, v3, v2, v0}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    iget-object p0, p0, Ll/s4y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 109
    .line 110
    invoke-static {p0}, Lcom/google/android/gms/measurement/internal/g;->T0(Lcom/google/android/gms/measurement/internal/g;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method
