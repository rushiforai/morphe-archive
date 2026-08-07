.class public final Ll/g8y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/b;

.field public final synthetic b:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;Lcom/google/android/gms/measurement/internal/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/g8y0;->a:Lcom/google/android/gms/measurement/internal/b;

    .line 2
    .line 3
    iput-object p1, p0, Ll/g8y0;->b:Lcom/google/android/gms/measurement/internal/g;

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
    iget-object v0, p0, Ll/g8y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/g8y0;->a:Lcom/google/android/gms/measurement/internal/b;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/ajx0;->u(Lcom/google/android/gms/measurement/internal/b;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/g8y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "Setting DMA consent(FE)"

    .line 26
    .line 27
    iget-object v2, p0, Ll/g8y0;->a:Lcom/google/android/gms/measurement/internal/b;

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/g8y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/v1v0;->n()Ll/hcy0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/hcy0;->d0()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object p0, p0, Ll/g8y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/v1v0;->n()Ll/hcy0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ll/hcy0;->Y()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    invoke-virtual {p0}, Ll/v1v0;->n()Ll/hcy0;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const/4 v0, 0x0

    .line 59
    invoke-virtual {p0, v0}, Ll/hcy0;->O(Z)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/d6x0;->D()Ll/l8x0;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object p0, p0, Ll/g8y0;->a:Lcom/google/android/gms/measurement/internal/b;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/b;->a()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string v1, "Lower precedence consent source ignored, proposed source"

    .line 82
    .line 83
    invoke-virtual {v0, v1, p0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
