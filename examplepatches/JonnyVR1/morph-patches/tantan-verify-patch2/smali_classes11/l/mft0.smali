.class public final synthetic Ll/mft0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/internal/ads/zzchd;

.field public final synthetic b:Z

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/internal/ads/zzchd;ZJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mft0;->a:Lcom/google/android/gms/internal/ads/zzchd;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/mft0;->b:Z

    .line 7
    .line 8
    iput-wide p3, p0, Ll/mft0;->c:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mft0;->a:Lcom/google/android/gms/internal/ads/zzchd;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/mft0;->b:Z

    .line 4
    .line 5
    iget-wide v2, p0, Ll/mft0;->c:J

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/ads/zzchd;->H(ZJ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
