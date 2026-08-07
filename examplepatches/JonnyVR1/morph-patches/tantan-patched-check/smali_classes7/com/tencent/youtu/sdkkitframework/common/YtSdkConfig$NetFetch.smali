.class public Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig$NetFetch;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NetFetch"
.end annotation


# static fields
.field public static appId:Ljava/lang/String; = null

.field public static backendProtoType:I = 0x0

.field public static changePointNum:I = 0x2

.field public static configUrl:Ljava/lang/String;

.field public static controlConfig:Ljava/lang/String;

.field public static extraConfig:Ljava/lang/String;

.field public static needActionlLocalConfig:Z

.field public static needBuglyShared:Z

.field public static needLocalConfig:Z

.field public static netRequestTimeoutMS:I

.field public static resourceDownloadPath:Ljava/lang/String;

.field public static resourceOnline:Z

.field public static selectData:Lorg/json/JSONObject;


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
