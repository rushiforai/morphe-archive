.class public final Lcom/google/android/gms/internal/measurement/q0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/google/android/gms/internal/measurement/zzjc;

.field public final b:[B


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-array p1, p1, [B

    .line 5
    .line 6
    iput-object p1, p0, Lcom/google/android/gms/internal/measurement/q0;->b:[B

    .line 7
    .line 8
    invoke-static {p1}, Lcom/google/android/gms/internal/measurement/zzjc;->H([B)Lcom/google/android/gms/internal/measurement/zzjc;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/google/android/gms/internal/measurement/q0;->a:Lcom/google/android/gms/internal/measurement/zzjc;

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(ILl/sxx0;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/measurement/q0;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a()Lcom/google/android/gms/internal/measurement/zzik;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/q0;->a:Lcom/google/android/gms/internal/measurement/zzjc;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzjc;->I()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/google/android/gms/internal/measurement/zziv;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/q0;->b:[B

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/measurement/zziv;-><init>([B)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public final b()Lcom/google/android/gms/internal/measurement/zzjc;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/q0;->a:Lcom/google/android/gms/internal/measurement/zzjc;

    .line 2
    .line 3
    return-object p0
.end method
