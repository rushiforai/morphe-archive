.class public final Ll/nrx0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Long;

.field public final b:Lcom/google/android/gms/internal/mlkit_language_id_common/zzhx;

.field public final c:Ljava/lang/Boolean;


# direct methods
.method public synthetic constructor <init>(Ll/frx0;Ll/jrx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/frx0;->g(Ll/frx0;)Ljava/lang/Long;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    iput-object p2, p0, Ll/nrx0;->a:Ljava/lang/Long;

    .line 9
    .line 10
    invoke-static {p1}, Ll/frx0;->e(Ll/frx0;)Lcom/google/android/gms/internal/mlkit_language_id_common/zzhx;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p0, Ll/nrx0;->b:Lcom/google/android/gms/internal/mlkit_language_id_common/zzhx;

    .line 15
    .line 16
    invoke-static {p1}, Ll/frx0;->f(Ll/frx0;)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/nrx0;->c:Ljava/lang/Boolean;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a()Lcom/google/android/gms/internal/mlkit_language_id_common/zzhx;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Ll/wqr0;
        zza = 0x2
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nrx0;->b:Lcom/google/android/gms/internal/mlkit_language_id_common/zzhx;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ljava/lang/Boolean;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Ll/wqr0;
        zza = 0x3
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nrx0;->c:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ljava/lang/Long;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Ll/wqr0;
        zza = 0x1
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nrx0;->a:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method
