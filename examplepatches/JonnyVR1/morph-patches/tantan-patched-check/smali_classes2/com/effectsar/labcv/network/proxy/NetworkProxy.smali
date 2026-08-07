.class public Lcom/effectsar/labcv/network/proxy/NetworkProxy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/network/proxy/NetworkProxy$IOnRequestCallback;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static native on_request(Lcom/effectsar/labcv/network/proxy/NetworkProxy$IOnRequestCallback;)V
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end method

.method private static native on_response(Lcom/effectsar/labcv/network/proxy/Response;)V
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end method
