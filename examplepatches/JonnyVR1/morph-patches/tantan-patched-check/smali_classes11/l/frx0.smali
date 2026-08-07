.class public final Ll/frx0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Long;

.field public b:Lcom/google/android/gms/internal/mlkit_language_id_common/zzhx;

.field public c:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic e(Ll/frx0;)Lcom/google/android/gms/internal/mlkit_language_id_common/zzhx;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/frx0;->b:Lcom/google/android/gms/internal/mlkit_language_id_common/zzhx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic f(Ll/frx0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/frx0;->c:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic g(Ll/frx0;)Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/frx0;->a:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a(Ljava/lang/Long;)Ll/frx0;
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide v2, 0x7fffffffffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v0, v2

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/frx0;->a:Ljava/lang/Long;

    .line 16
    .line 17
    return-object p0
.end method

.method public final b(Lcom/google/android/gms/internal/mlkit_language_id_common/zzhx;)Ll/frx0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/frx0;->b:Lcom/google/android/gms/internal/mlkit_language_id_common/zzhx;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Ljava/lang/Boolean;)Ll/frx0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/frx0;->c:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/nrx0;
    .locals 2

    .line 1
    new-instance v0, Ll/nrx0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/nrx0;-><init>(Ll/frx0;Ll/jrx0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
