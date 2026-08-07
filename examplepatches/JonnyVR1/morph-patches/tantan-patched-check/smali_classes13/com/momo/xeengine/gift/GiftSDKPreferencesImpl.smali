.class final Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/gift/GiftSDKPreferences;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl$Holder;
    }
.end annotation


# instance fields
.field private downloader:Lcom/momo/xeengine/gift/IResourceDownloader;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl;->downloader:Lcom/momo/xeengine/gift/IResourceDownloader;

    .line 6
    .line 7
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl$1;)V
    .locals 0

    .line 8
    invoke-direct {p0}, Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public getDownloader()Lcom/momo/xeengine/gift/IResourceDownloader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl;->downloader:Lcom/momo/xeengine/gift/IResourceDownloader;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/momo/xeengine/XEnginePreferences;->setApplicationContext(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl;->downloader:Lcom/momo/xeengine/gift/IResourceDownloader;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Lcom/momo/xeengine/gift/ResourceDownloaderImpl;

    .line 9
    .line 10
    invoke-direct {p1}, Lcom/momo/xeengine/gift/ResourceDownloaderImpl;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl;->downloader:Lcom/momo/xeengine/gift/IResourceDownloader;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public setDownloader(Lcom/momo/xeengine/gift/IResourceDownloader;)V
    .locals 0
    .param p1    # Lcom/momo/xeengine/gift/IResourceDownloader;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl;->downloader:Lcom/momo/xeengine/gift/IResourceDownloader;

    .line 4
    .line 5
    :cond_0
    return-void
.end method
