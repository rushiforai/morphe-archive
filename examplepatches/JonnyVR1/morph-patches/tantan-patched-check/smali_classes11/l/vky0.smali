.class public final Ll/vky0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/xuy0;


# direct methods
.method public constructor <init>(Ll/xuy0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vky0;->a:Ll/xuy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic call()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vky0;->a:Ll/xuy0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/xuy0;->u8(Ll/xuy0;)Lcom/google/android/gms/internal/ads/zzcei;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Ll/xuy0;->q8(Ll/xuy0;)Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, p0, v1}, Ll/u2s0;->x(Ljava/lang/String;Landroid/content/Context;Z)Ll/u2s0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Ll/v2s0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/v2s0;-><init>(Ll/r2s0;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method
