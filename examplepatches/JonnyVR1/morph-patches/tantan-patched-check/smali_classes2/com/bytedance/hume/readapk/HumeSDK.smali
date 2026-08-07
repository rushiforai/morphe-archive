.class public Lcom/bytedance/hume/readapk/HumeSDK;
.super Ljava/lang/Object;


# static fields
.field public static final TAG:Ljava/lang/String; = "HumeSDK"

.field private static final a:I = 0x71777778

.field private static final b:I = -0x6699999a

.field private static final c:I = 0x71777777

.field private static d:[Ljava/lang/String;

.field private static volatile e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 2
    sget-boolean v0, Lcom/bytedance/hume/readapk/HumeSDK;->e:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/bytedance/hume/readapk/HumeSDK;->c(Landroid/content/Context;)V

    sput-boolean v1, Lcom/bytedance/hume/readapk/HumeSDK;->e:Z

    :cond_0
    sget-object p0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    const/4 v0, 0x0

    aget-object p0, p0, v0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    sget-object p0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    aget-object p0, p0, v0

    return-object p0

    :cond_1
    sget-object p0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    aget-object p0, p0, v1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2

    sget-object p0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    aget-object p0, p0, v1

    return-object p0

    :cond_2
    const-string p0, ""

    return-object p0
.end method

.method private static a(Ljava/lang/String;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :catch_1
    move-exception p0

    goto :goto_1

    :cond_1
    return-object v2

    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-object v1
.end method

.method private static b(Landroid/content/Context;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-boolean v0, Lcom/bytedance/hume/readapk/HumeSDK;->e:Z

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/bytedance/hume/readapk/HumeSDK;->c(Landroid/content/Context;)V

    const/4 p0, 0x1

    sput-boolean p0, Lcom/bytedance/hume/readapk/HumeSDK;->e:Z

    :cond_0
    sget-object p0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    const/4 v0, 0x2

    aget-object p0, p0, v0

    invoke-static {p0}, Lcom/bytedance/hume/readapk/HumeSDK;->a(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    if-nez p0, :cond_1

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    :cond_1
    return-object p0
.end method

.method private static c(Landroid/content/Context;)V
    .locals 5

    const v0, 0x71777777

    const v1, 0x71777778

    const v2, -0x6699999a

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    invoke-static {p0}, Lcom/bytedance/hume/readapk/HumeSDK;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v2, ""

    if-eqz v1, :cond_0

    filled-new-array {v2, v2, v2}, [Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v0}, Lcom/bytedance/hume/readapk/d;->a(Ljava/io/File;[I)[Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    :goto_0
    sput-object p0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    array-length v0, p0

    const/4 v3, 0x2

    if-lt v0, v3, :cond_3

    const/4 v0, 0x0

    aget-object p0, p0, v0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3

    sget-object p0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object p0, p0, v4

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-static {v1}, Lcom/bytedance/hume/readapk/a/a;->a(Ljava/io/File;)Ljava/lang/String;

    move-result-object p0

    sget-object v1, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    if-nez p0, :cond_2

    move-object p0, v2

    :cond_2
    aput-object p0, v1, v0

    :cond_3
    sget-object p0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    array-length v0, p0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_5

    aget-object p0, p0, v3

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_5

    sget-object p0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    aget-object p0, p0, v3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v0, 0x4

    if-le p0, v0, :cond_4

    sget-object v0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    aget-object v1, v0, v3

    sub-int/2addr p0, v3

    invoke-virtual {v1, v3, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v0, v3

    return-void

    :cond_4
    sget-object p0, Lcom/bytedance/hume/readapk/HumeSDK;->d:[Ljava/lang/String;

    aput-object v2, p0, v3

    :cond_5
    return-void
.end method

.method private static d(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    return-object v0
.end method

.method public static getChannel(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    sget-boolean v0, Lcom/bytedance/hume/readapk/HumeSDK;->e:Z

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/bytedance/hume/readapk/HumeSDK;->c(Landroid/content/Context;)V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/bytedance/hume/readapk/HumeSDK;->e:Z

    :cond_0
    invoke-static {p0}, Lcom/bytedance/hume/readapk/HumeSDK;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/bytedance/hume/readapk/HumeSDK;->a(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_1

    const-string v0, "hume_channel_id"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_1
    const-string p0, ""

    return-object p0
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 1

    const-string v0, "1.0.0"

    return-object v0
.end method
