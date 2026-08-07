.class public Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SDKInitConfig"
.end annotation


# instance fields
.field private mContext:Landroid/app/Application;

.field private mJsonParser:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$JsonParser;

.field private mSDKMd5:Ljava/lang/String;

.field private mSDKSoMd5Path:Ljava/lang/String;

.field private mSDKUrl:Ljava/lang/String;

.field private mSoPathInZipArmv7a:Ljava/lang/String;

.field private mSoSaveRootDir:Ljava/io/File;


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

.method public static synthetic access$000(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mSoPathInZipArmv7a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mSDKUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mSDKMd5:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mSDKSoMd5Path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)Landroid/app/Application;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mContext:Landroid/app/Application;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$JsonParser;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mJsonParser:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$JsonParser;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public getContext()Landroid/app/Application;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mContext:Landroid/app/Application;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSoSaveRootDir()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mSoSaveRootDir:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public setApplicationContext(Landroid/app/Application;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mContext:Landroid/app/Application;

    .line 2
    .line 3
    return-void
.end method

.method public setArmv7aSoPathInZip(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mSoPathInZipArmv7a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setContext(Landroid/app/Application;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mContext:Landroid/app/Application;

    .line 2
    .line 3
    return-void
.end method

.method public setJsonParser(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$JsonParser;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mJsonParser:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$JsonParser;

    .line 2
    .line 3
    return-void
.end method

.method public setSDKDownloadUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mSDKUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSDKMd5(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mSDKMd5:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSDKSoMd5Path(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mSDKSoMd5Path:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSoSaveRootDir(Ljava/io/File;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->mSoSaveRootDir:Ljava/io/File;

    .line 2
    .line 3
    return-void
.end method
