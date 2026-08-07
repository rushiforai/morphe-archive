.class final Lcom/google/android/gms/internal/play_billing/zzdg;
.super Ll/jau0;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field static final zza:Ll/jau0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/play_billing/zzdg;

    invoke-direct {v0}, Lcom/google/android/gms/internal/play_billing/zzdg;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/play_billing/zzdg;->zza:Ll/jau0;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ll/jau0;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/play_billing/zzdh;

    .line 2
    .line 3
    check-cast p2, Lcom/google/android/gms/internal/play_billing/zzdh;

    .line 4
    .line 5
    invoke-static {}, Ll/x6t0;->f()Ll/x6t0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p1, Lcom/google/android/gms/internal/play_billing/zzdh;->zza:Lcom/google/android/gms/internal/play_billing/zzce;

    .line 10
    .line 11
    iget-object v1, p2, Lcom/google/android/gms/internal/play_billing/zzdh;->zza:Lcom/google/android/gms/internal/play_billing/zzce;

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Ll/x6t0;->b(Ljava/lang/Comparable;Ljava/lang/Comparable;)Ll/x6t0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p1, p1, Lcom/google/android/gms/internal/play_billing/zzdh;->zzb:Lcom/google/android/gms/internal/play_billing/zzce;

    .line 18
    .line 19
    iget-object p2, p2, Lcom/google/android/gms/internal/play_billing/zzdh;->zzb:Lcom/google/android/gms/internal/play_billing/zzce;

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ll/x6t0;->b(Ljava/lang/Comparable;Ljava/lang/Comparable;)Ll/x6t0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/x6t0;->a()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method
