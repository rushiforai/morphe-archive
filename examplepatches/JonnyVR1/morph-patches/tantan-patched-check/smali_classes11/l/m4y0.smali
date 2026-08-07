.class public final synthetic Ll/m4y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mwv0;


# static fields
.field public static final synthetic a:Ll/m4y0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/m4y0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/m4y0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/m4y0;->a:Ll/m4y0;

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
.method public final zza(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Ll/pkt0;

    .line 2
    .line 3
    new-instance p0, Lcom/google/android/gms/internal/ads/zzla;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/ads/zzla;-><init>(I)V

    .line 7
    .line 8
    .line 9
    const/16 v0, 0x3eb

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/ads/zziz;->zzd(Ljava/lang/RuntimeException;I)Lcom/google/android/gms/internal/ads/zziz;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p1, p0}, Ll/pkt0;->m(Lcom/google/android/gms/internal/ads/zzce;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
