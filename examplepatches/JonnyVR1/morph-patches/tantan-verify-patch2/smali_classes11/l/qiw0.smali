.class public final Ll/qiw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/riw0;


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation


# static fields
.field public static final a:Lcom/google/android/gms/internal/ads/n;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/n;->l0()Ll/fzr0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "E"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/fzr0;->y0(Ljava/lang/String;)Ll/fzr0;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/google/android/gms/internal/ads/n;

    .line 15
    .line 16
    sput-object v0, Ll/qiw0;->a:Lcom/google/android/gms/internal/ads/n;

    .line 17
    .line 18
    return-void
.end method

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
.method public final zza()Lcom/google/android/gms/internal/ads/n;
    .locals 0

    .line 1
    sget-object p0, Ll/qiw0;->a:Lcom/google/android/gms/internal/ads/n;

    .line 2
    .line 3
    return-object p0
.end method
