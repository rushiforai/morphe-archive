.class public final Ll/pwr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ll/kvr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Lcom/google/android/gms/internal/ads/zzaqj;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/zzaqj;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/pwr0;->d:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/pwr0;->a:Ljava/lang/Object;

    .line 9
    .line 10
    iput-object v0, p0, Ll/pwr0;->b:Ll/kvr0;

    .line 11
    .line 12
    iput-object p1, p0, Ll/pwr0;->c:Lcom/google/android/gms/internal/ads/zzaqj;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ll/kvr0;)V
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/kvr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Ll/pwr0;->d:Z

    iput-object p1, p0, Ll/pwr0;->a:Ljava/lang/Object;

    iput-object p2, p0, Ll/pwr0;->b:Ll/kvr0;

    const/4 p1, 0x0

    iput-object p1, p0, Ll/pwr0;->c:Lcom/google/android/gms/internal/ads/zzaqj;

    return-void
.end method

.method public static a(Lcom/google/android/gms/internal/ads/zzaqj;)Ll/pwr0;
    .locals 1

    .line 1
    new-instance v0, Ll/pwr0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pwr0;-><init>(Lcom/google/android/gms/internal/ads/zzaqj;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static b(Ljava/lang/Object;Ll/kvr0;)Ll/pwr0;
    .locals 1
    .param p0    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ll/kvr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/pwr0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/pwr0;-><init>(Ljava/lang/Object;Ll/kvr0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pwr0;->c:Lcom/google/android/gms/internal/ads/zzaqj;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
