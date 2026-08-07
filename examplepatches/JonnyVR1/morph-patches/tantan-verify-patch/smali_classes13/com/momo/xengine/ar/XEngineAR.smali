.class public abstract Lcom/momo/xengine/ar/XEngineAR;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/IXEngineModule;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xengine/ar/XEngineAR$InstanceHolder;,
        Lcom/momo/xengine/ar/XEngineAR$SupportType;
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

.method public static getInstance()Lcom/momo/xengine/ar/XEngineAR;
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/xengine/ar/XEngineAR$InstanceHolder;->access$000()Lcom/momo/xengine/ar/XEngineAR;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public abstract createCamera(Lcom/momo/xeengine/IXEngine;)Lcom/momo/xengine/ar/IXARCamera;
.end method

.method public abstract getSupportType()Lcom/momo/xengine/ar/XEngineAR$SupportType;
.end method
