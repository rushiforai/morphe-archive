.class public Lcom/ss/bytertc/engine/data/EngineConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "EngineConfig"


# instance fields
.field public appID:Ljava/lang/String;

.field public context:Landroid/content/Context;

.field public eglContext:Ljava/lang/Object;

.field public isGameScene:Z

.field public nativeLoadPath:Ljava/lang/String;

.field public parameters:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->context:Landroid/content/Context;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->eglContext:Ljava/lang/Object;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->nativeLoadPath:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->parameters:Lorg/json/JSONObject;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->isGameScene:Z

    .line 15
    .line 16
    return-void
.end method
