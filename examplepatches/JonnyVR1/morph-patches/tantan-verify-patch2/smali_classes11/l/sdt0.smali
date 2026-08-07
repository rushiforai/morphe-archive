.class public final Ll/sdt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/google/android/gms/internal/ads/zzcfp;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/zzcfp;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/sdt0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/sdt0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Ll/sdt0;->c:Lcom/google/android/gms/internal/ads/zzcfp;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sdt0;->c:Lcom/google/android/gms/internal/ads/zzcfp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzcfp;->H(Lcom/google/android/gms/internal/ads/zzcfp;)Ll/zdt0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/sdt0;->a:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Ll/sdt0;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzcfp;->H(Lcom/google/android/gms/internal/ads/zzcfp;)Ll/zdt0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0, v1, p0}, Ll/zdt0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
