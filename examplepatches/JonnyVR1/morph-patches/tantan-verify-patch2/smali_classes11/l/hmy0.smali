.class public final Ll/hmy0;
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
.method public constructor <init>(JLcom/google/android/gms/internal/measurement/zzfy$zzj;Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/measurement/internal/zznt;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/google/android/gms/internal/measurement/zzfy$zzj;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/measurement/internal/zznt;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/hmy0;->a:J

    .line 5
    .line 6
    iput-object p3, p0, Ll/hmy0;->b:Lcom/google/android/gms/internal/measurement/zzfy$zzj;

    .line 7
    .line 8
    iput-object p4, p0, Ll/hmy0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p5, p0, Ll/hmy0;->d:Ljava/util/Map;

    .line 11
    .line 12
    iput-object p6, p0, Ll/hmy0;->e:Lcom/google/android/gms/measurement/internal/zznt;

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(JLcom/google/android/gms/internal/measurement/zzfy$zzj;Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/measurement/internal/zznt;Ll/nmy0;)V
    .locals 0

    .line 15
    invoke-direct/range {p0 .. p6}, Ll/hmy0;-><init>(JLcom/google/android/gms/internal/measurement/zzfy$zzj;Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/measurement/internal/zznt;)V

    return-void
.end method


# virtual methods
.method public final a()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/hmy0;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final b()Ll/aky0;
    .locals 3

    .line 1
    new-instance v0, Ll/aky0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hmy0;->c:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/hmy0;->d:Ljava/util/Map;

    .line 6
    .line 7
    iget-object p0, p0, Ll/hmy0;->e:Lcom/google/android/gms/measurement/internal/zznt;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, p0}, Ll/aky0;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/measurement/internal/zznt;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public final c()Lcom/google/android/gms/internal/measurement/zzfy$zzj;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hmy0;->b:Lcom/google/android/gms/internal/measurement/zzfy$zzj;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmy0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hmy0;->d:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method
