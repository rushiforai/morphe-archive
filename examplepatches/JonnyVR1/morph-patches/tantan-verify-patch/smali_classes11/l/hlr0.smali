.class public final Ll/hlr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public final b:Lcom/google/android/gms/internal/mlkit_language_id_common/zzal;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/google/android/gms/internal/mlkit_language_id_common/zzal;->zza:Lcom/google/android/gms/internal/mlkit_language_id_common/zzal;

    .line 5
    .line 6
    iput-object v0, p0, Ll/hlr0;->b:Lcom/google/android/gms/internal/mlkit_language_id_common/zzal;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(I)Ll/hlr0;
    .locals 0

    .line 1
    iput p1, p0, Ll/hlr0;->a:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ll/wqr0;
    .locals 2

    .line 1
    new-instance v0, Ll/fkr0;

    .line 2
    .line 3
    iget v1, p0, Ll/hlr0;->a:I

    .line 4
    .line 5
    iget-object p0, p0, Ll/hlr0;->b:Lcom/google/android/gms/internal/mlkit_language_id_common/zzal;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Ll/fkr0;-><init>(ILcom/google/android/gms/internal/mlkit_language_id_common/zzal;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
