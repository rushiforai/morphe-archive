.class public final synthetic Ll/zqy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/tar0;

.field public final synthetic b:Lcom/google/android/gms/internal/ads/zzccx;


# direct methods
.method public synthetic constructor <init>(Ll/tar0;Lcom/google/android/gms/internal/ads/zzccx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zqy0;->a:Ll/tar0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/zqy0;->b:Lcom/google/android/gms/internal/ads/zzccx;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zqy0;->a:Ll/tar0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zqy0;->b:Lcom/google/android/gms/internal/ads/zzccx;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/tar0;->Y8(Lcom/google/android/gms/internal/ads/zzccx;)Ll/rix0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
