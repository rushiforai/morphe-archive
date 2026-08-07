.class public final Ll/qmy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public b:Lcom/google/android/gms/internal/measurement/zzfy$zzj;

.field public c:Ljava/lang/String;

.field public d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/google/android/gms/measurement/internal/zznt;


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


# virtual methods
.method public final a()Ll/hmy0;
    .locals 8

    .line 1
    new-instance v0, Ll/hmy0;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/qmy0;->a:J

    .line 4
    .line 5
    iget-object v3, p0, Ll/qmy0;->b:Lcom/google/android/gms/internal/measurement/zzfy$zzj;

    .line 6
    .line 7
    iget-object v4, p0, Ll/qmy0;->c:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v5, p0, Ll/qmy0;->d:Ljava/util/Map;

    .line 10
    .line 11
    iget-object v6, p0, Ll/qmy0;->e:Lcom/google/android/gms/measurement/internal/zznt;

    .line 12
    .line 13
    const/4 v7, 0x0

    .line 14
    invoke-direct/range {v0 .. v7}, Ll/hmy0;-><init>(JLcom/google/android/gms/internal/measurement/zzfy$zzj;Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/measurement/internal/zznt;Ll/nmy0;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public final b(J)Ll/qmy0;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/qmy0;->a:J

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Lcom/google/android/gms/internal/measurement/zzfy$zzj;)Ll/qmy0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qmy0;->b:Lcom/google/android/gms/internal/measurement/zzfy$zzj;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Lcom/google/android/gms/measurement/internal/zznt;)Ll/qmy0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qmy0;->e:Lcom/google/android/gms/measurement/internal/zznt;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Ljava/lang/String;)Ll/qmy0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qmy0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f(Ljava/util/Map;)Ll/qmy0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ll/qmy0;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qmy0;->d:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method
