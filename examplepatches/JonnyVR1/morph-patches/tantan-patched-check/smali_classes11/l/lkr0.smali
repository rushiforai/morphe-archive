.class public final synthetic Ll/lkr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final synthetic a:Ll/lkr0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/lkr0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lkr0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/lkr0;->a:Ll/lkr0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/ads/zzahi;

    .line 2
    .line 3
    check-cast p2, Lcom/google/android/gms/internal/ads/zzahi;

    .line 4
    .line 5
    invoke-static {}, Ll/gqw0;->j()Ll/gqw0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-wide v0, p1, Lcom/google/android/gms/internal/ads/zzahi;->zzb:J

    .line 10
    .line 11
    iget-wide v2, p2, Lcom/google/android/gms/internal/ads/zzahi;->zzb:J

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/gqw0;->c(JJ)Ll/gqw0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-wide v0, p1, Lcom/google/android/gms/internal/ads/zzahi;->zzc:J

    .line 18
    .line 19
    iget-wide v2, p2, Lcom/google/android/gms/internal/ads/zzahi;->zzc:J

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/gqw0;->c(JJ)Ll/gqw0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget p1, p1, Lcom/google/android/gms/internal/ads/zzahi;->zzd:I

    .line 26
    .line 27
    iget p2, p2, Lcom/google/android/gms/internal/ads/zzahi;->zzd:I

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Ll/gqw0;->b(II)Ll/gqw0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/gqw0;->a()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method
