.class final Lcom/bef/effectsdk/EffectSDKUtils$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/FileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/EffectSDKUtils;->needUpdate(Landroid/content/Context;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$file:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/EffectSDKUtils$1;->val$file:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/bef/effectsdk/EffectSDKUtils$1;->val$context:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/EffectSDKUtils$1;->val$file:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    :try_start_0
    iget-object v2, p0, Lcom/bef/effectsdk/EffectSDKUtils$1;->val$context:Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object p0, p0, Lcom/bef/effectsdk/EffectSDKUtils$1;->val$file:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v2, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    int-to-long p0, p0

    .line 36
    cmp-long p0, v2, p0

    .line 37
    .line 38
    if-nez p0, :cond_0

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    :cond_0
    invoke-static {v0}, Lcom/bef/effectsdk/EffectSDKUtils;->access$000(Ljava/io/Closeable;)V

    .line 42
    .line 43
    .line 44
    return v1

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    invoke-static {v0}, Lcom/bef/effectsdk/EffectSDKUtils;->access$000(Ljava/io/Closeable;)V

    .line 47
    .line 48
    .line 49
    throw p0

    .line 50
    :catch_0
    invoke-static {v0}, Lcom/bef/effectsdk/EffectSDKUtils;->access$000(Ljava/io/Closeable;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return v1
.end method
