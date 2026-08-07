.class public Ll/mbu0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public e:I

.field public f:I

.field public g:Z

.field public final h:Lcom/google/android/gms/internal/ads/zzgaa;

.field public final i:Lcom/google/android/gms/internal/ads/zzgaa;

.field public final j:I

.field public final k:I

.field public final l:Lcom/google/android/gms/internal/ads/zzgaa;

.field public final m:Ll/fau0;

.field public n:Lcom/google/android/gms/internal/ads/zzgaa;

.field public o:I

.field public final p:Ljava/util/HashMap;

.field public final q:Ljava/util/HashSet;


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7fffffff

    iput v0, p0, Ll/mbu0;->a:I

    iput v0, p0, Ll/mbu0;->b:I

    iput v0, p0, Ll/mbu0;->c:I

    iput v0, p0, Ll/mbu0;->d:I

    iput v0, p0, Ll/mbu0;->e:I

    iput v0, p0, Ll/mbu0;->f:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Ll/mbu0;->g:Z

    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    move-result-object v1

    iput-object v1, p0, Ll/mbu0;->h:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 75
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    move-result-object v1

    iput-object v1, p0, Ll/mbu0;->i:Lcom/google/android/gms/internal/ads/zzgaa;

    iput v0, p0, Ll/mbu0;->j:I

    iput v0, p0, Ll/mbu0;->k:I

    .line 76
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    move-result-object v0

    iput-object v0, p0, Ll/mbu0;->l:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 77
    sget-object v0, Ll/fau0;->b:Ll/fau0;

    iput-object v0, p0, Ll/mbu0;->m:Ll/fau0;

    .line 78
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    move-result-object v0

    iput-object v0, p0, Ll/mbu0;->n:Lcom/google/android/gms/internal/ads/zzgaa;

    const/4 v0, 0x0

    iput v0, p0, Ll/mbu0;->o:I

    new-instance v0, Ljava/util/HashMap;

    .line 79
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ll/mbu0;->p:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashSet;

    .line 80
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Ll/mbu0;->q:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>(Ll/scu0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7fffffff

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/mbu0;->a:I

    .line 8
    .line 9
    iput v0, p0, Ll/mbu0;->b:I

    .line 10
    .line 11
    iput v0, p0, Ll/mbu0;->c:I

    .line 12
    .line 13
    iput v0, p0, Ll/mbu0;->d:I

    .line 14
    .line 15
    iget v1, p1, Ll/scu0;->i:I

    .line 16
    .line 17
    iput v1, p0, Ll/mbu0;->e:I

    .line 18
    .line 19
    iget v1, p1, Ll/scu0;->j:I

    .line 20
    .line 21
    iput v1, p0, Ll/mbu0;->f:I

    .line 22
    .line 23
    iget-boolean v1, p1, Ll/scu0;->k:Z

    .line 24
    .line 25
    iput-boolean v1, p0, Ll/mbu0;->g:Z

    .line 26
    .line 27
    iget-object v1, p1, Ll/scu0;->l:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 28
    .line 29
    iput-object v1, p0, Ll/mbu0;->h:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 30
    .line 31
    iget-object v1, p1, Ll/scu0;->n:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 32
    .line 33
    iput-object v1, p0, Ll/mbu0;->i:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 34
    .line 35
    iput v0, p0, Ll/mbu0;->j:I

    .line 36
    .line 37
    iput v0, p0, Ll/mbu0;->k:I

    .line 38
    .line 39
    iget-object v0, p1, Ll/scu0;->r:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 40
    .line 41
    iput-object v0, p0, Ll/mbu0;->l:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 42
    .line 43
    iget-object v0, p1, Ll/scu0;->s:Ll/fau0;

    .line 44
    .line 45
    iput-object v0, p0, Ll/mbu0;->m:Ll/fau0;

    .line 46
    .line 47
    iget-object v0, p1, Ll/scu0;->t:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 48
    .line 49
    iput-object v0, p0, Ll/mbu0;->n:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 50
    .line 51
    iget v0, p1, Ll/scu0;->u:I

    .line 52
    .line 53
    iput v0, p0, Ll/mbu0;->o:I

    .line 54
    .line 55
    iget-object v0, p1, Ll/scu0;->B:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 56
    .line 57
    new-instance v1, Ljava/util/HashSet;

    .line 58
    .line 59
    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 60
    .line 61
    .line 62
    iput-object v1, p0, Ll/mbu0;->q:Ljava/util/HashSet;

    .line 63
    .line 64
    iget-object p1, p1, Ll/scu0;->A:Lcom/google/android/gms/internal/ads/zzgad;

    .line 65
    .line 66
    new-instance v0, Ljava/util/HashMap;

    .line 67
    .line 68
    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Ll/mbu0;->p:Ljava/util/HashMap;

    .line 72
    .line 73
    return-void
.end method

.method public static bridge synthetic a(Ll/mbu0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/mbu0;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic b(Ll/mbu0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/mbu0;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic c(Ll/mbu0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/mbu0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic d(Ll/mbu0;)Ll/fau0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mbu0;->m:Ll/fau0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic g(Ll/mbu0;)Lcom/google/android/gms/internal/ads/zzgaa;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mbu0;->i:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic h(Ll/mbu0;)Lcom/google/android/gms/internal/ads/zzgaa;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mbu0;->l:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic i(Ll/mbu0;)Lcom/google/android/gms/internal/ads/zzgaa;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mbu0;->n:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic j(Ll/mbu0;)Lcom/google/android/gms/internal/ads/zzgaa;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mbu0;->h:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic k(Ll/mbu0;)Ljava/util/HashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mbu0;->p:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic l(Ll/mbu0;)Ljava/util/HashSet;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mbu0;->q:Ljava/util/HashSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic m(Ll/mbu0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mbu0;->g:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public final e(Landroid/content/Context;)Ll/mbu0;
    .locals 2

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x17

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    :cond_0
    const-string v0, "captioning"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Landroid/view/accessibility/CaptioningManager;

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/accessibility/CaptioningManager;->isEnabled()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/16 v0, 0x440

    .line 31
    .line 32
    iput v0, p0, Ll/mbu0;->o:I

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/accessibility/CaptioningManager;->getLocale()Ljava/util/Locale;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/util/Locale;->toLanguageTag()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Ll/mbu0;->n:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 49
    .line 50
    :cond_2
    :goto_0
    return-object p0
.end method

.method public f(IIZ)Ll/mbu0;
    .locals 0

    .line 1
    iput p1, p0, Ll/mbu0;->e:I

    .line 2
    .line 3
    iput p2, p0, Ll/mbu0;->f:I

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Ll/mbu0;->g:Z

    .line 7
    .line 8
    return-object p0
.end method
