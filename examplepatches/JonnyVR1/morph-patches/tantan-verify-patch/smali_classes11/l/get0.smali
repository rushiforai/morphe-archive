.class public final Ll/get0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/google/android/gms/internal/ads/zzcfz;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/zzcfz;Z)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Ll/get0;->a:Z

    .line 2
    .line 3
    iput-object p1, p0, Ll/get0;->b:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/get0;->a:Z

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "isVisible"

    .line 8
    .line 9
    filled-new-array {v1, v0}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Ll/get0;->b:Lcom/google/android/gms/internal/ads/zzcfz;

    .line 14
    .line 15
    const-string v1, "windowVisibilityChanged"

    .line 16
    .line 17
    invoke-static {p0, v1, v0}, Lcom/google/android/gms/internal/ads/zzcfz;->p(Lcom/google/android/gms/internal/ads/zzcfz;Ljava/lang/String;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
