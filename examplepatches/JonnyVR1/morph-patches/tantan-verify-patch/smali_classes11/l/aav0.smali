.class public final synthetic Ll/aav0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kbw0;


# instance fields
.field public final synthetic a:Ll/bav0;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Lcom/google/android/gms/internal/ads/m0;

.field public final synthetic e:Lcom/google/android/gms/internal/ads/zzbec;


# direct methods
.method public synthetic constructor <init>(Ll/bav0;ZLjava/util/ArrayList;Lcom/google/android/gms/internal/ads/m0;Lcom/google/android/gms/internal/ads/zzbec;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/aav0;->a:Ll/bav0;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/aav0;->b:Z

    .line 7
    .line 8
    iput-object p3, p0, Ll/aav0;->c:Ljava/util/ArrayList;

    .line 9
    .line 10
    iput-object p4, p0, Ll/aav0;->d:Lcom/google/android/gms/internal/ads/m0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/aav0;->e:Lcom/google/android/gms/internal/ads/zzbec;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/aav0;->a:Ll/bav0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/bav0;->b:Ll/cav0;

    .line 4
    .line 5
    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/dav0;->a()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Ll/aav0;->e:Lcom/google/android/gms/internal/ads/zzbec;

    .line 14
    .line 15
    iget-object v2, p0, Ll/aav0;->d:Lcom/google/android/gms/internal/ads/m0;

    .line 16
    .line 17
    iget-object v3, p0, Ll/aav0;->c:Ljava/util/ArrayList;

    .line 18
    .line 19
    iget-boolean p0, p0, Ll/aav0;->b:Z

    .line 20
    .line 21
    iget-object v4, v0, Ll/bav0;->b:Ll/cav0;

    .line 22
    .line 23
    invoke-static {v4, p0, v3, v2, v1}, Ll/cav0;->f(Ll/cav0;ZLjava/util/ArrayList;Lcom/google/android/gms/internal/ads/m0;Lcom/google/android/gms/internal/ads/zzbec;)[B

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-static {p1, p0, v2}, Ll/fav0;->g(Landroid/database/sqlite/SQLiteDatabase;ZZ)V

    .line 29
    .line 30
    .line 31
    iget-object p0, v0, Ll/bav0;->b:Ll/cav0;

    .line 32
    .line 33
    invoke-static {p0}, Ll/cav0;->d(Ll/cav0;)Ll/u9v0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/u9v0;->d()J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    invoke-static {p1, v2, v3, v1}, Ll/fav0;->d(Landroid/database/sqlite/SQLiteDatabase;J[B)V

    .line 42
    .line 43
    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return-object p0
.end method
