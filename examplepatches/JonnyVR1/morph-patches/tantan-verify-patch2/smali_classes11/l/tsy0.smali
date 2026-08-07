.class public final Ll/tsy0;
.super Ll/rky0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-direct {p0, v0}, Ll/rky0;-><init>(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/Object;)Ll/tsy0;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/rky0;->a(Ljava/lang/Object;)Ll/rky0;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final d()Lcom/google/android/gms/internal/mlkit_language_id_common/zzu;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/rky0;->c:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/rky0;->a:[Ljava/lang/Object;

    .line 5
    .line 6
    iget p0, p0, Ll/rky0;->b:I

    .line 7
    .line 8
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/mlkit_language_id_common/zzu;->zzh([Ljava/lang/Object;I)Lcom/google/android/gms/internal/mlkit_language_id_common/zzu;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
