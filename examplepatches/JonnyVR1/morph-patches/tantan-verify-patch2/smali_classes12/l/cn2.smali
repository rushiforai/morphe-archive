.class public abstract Ll/cn2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/base/algorithm/IIdentityDelegate;


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


# virtual methods
.method public abstract config(Lcom/idv/identity/base/algorithm/IdentityAlgConfig;)Z
.end method

.method public abstract finishPhotinus()V
.end method

.method public abstract handleCaptureCompleted(ILjava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract handleEventStated(I)V
.end method

.method public abstract handleInfoReady(Lcom/idv/identity/base/algorithm/IDFrame;)V
.end method

.method public abstract handleStateUpdated(ILcom/idv/identity/base/algorithm/IdentityFaceAttr;)V
.end method

.method public abstract init(Landroid/content/Context;Lcom/idv/identity/base/algorithm/IdentityAlgConfig;Ll/gfm;)Z
.end method

.method public abstract preProcess()V
.end method

.method public abstract processImage(Lcom/idv/identity/base/algorithm/IDFrame;)Z
.end method

.method public abstract registerIdentityFaceCallback(Ll/gfm;)V
.end method

.method public abstract release()V
.end method

.method public abstract removeIdentityFaceCallback(Ll/gfm;)V
.end method

.method public abstract setFarNeatAction(Z)Z
.end method
