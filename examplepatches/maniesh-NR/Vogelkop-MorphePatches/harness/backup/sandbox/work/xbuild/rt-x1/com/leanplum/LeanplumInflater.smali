.class public Lcom/leanplum/LeanplumInflater;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private context:Landroid/content/Context;

.field private res:Lcom/leanplum/LeanplumResources;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/LeanplumInflater;->context:Landroid/content/Context;

    return-void
.end method

.method public static from(Landroid/content/Context;)Lcom/leanplum/LeanplumInflater;
    .registers 2

    new-instance v0, Lcom/leanplum/LeanplumInflater;

    invoke-direct {v0, p0}, Lcom/leanplum/LeanplumInflater;-><init>(Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public getLeanplumResources()Lcom/leanplum/LeanplumResources;
    .registers 2

    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, v0}, Lcom/leanplum/LeanplumInflater;->getLeanplumResources(Landroid/content/res/Resources;)Lcom/leanplum/LeanplumResources;

    move-result-object p0

    return-object p0
.end method

.method public getLeanplumResources(Landroid/content/res/Resources;)Lcom/leanplum/LeanplumResources;
    .registers 3

    iget-object v0, p0, Lcom/leanplum/LeanplumInflater;->res:Lcom/leanplum/LeanplumResources;

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    if-nez p1, :cond_d

    iget-object p1, p0, Lcom/leanplum/LeanplumInflater;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    :cond_d
    instance-of v0, p1, Lcom/leanplum/LeanplumResources;

    if-eqz v0, :cond_14

    check-cast p1, Lcom/leanplum/LeanplumResources;

    return-object p1

    :cond_14
    new-instance v0, Lcom/leanplum/LeanplumResources;

    invoke-direct {v0, p1}, Lcom/leanplum/LeanplumResources;-><init>(Landroid/content/res/Resources;)V

    iput-object v0, p0, Lcom/leanplum/LeanplumInflater;->res:Lcom/leanplum/LeanplumResources;

    return-object v0
.end method

.method public inflate(I)Landroid/view/View;
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 264
    invoke-virtual {p0, p1, v0, v1}, Lcom/leanplum/LeanplumInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public inflate(ILandroid/view/ViewGroup;)Landroid/view/View;
    .registers 4

    if-eqz p2, :cond_4

    const/4 v0, 0x1

    goto :goto_5

    :cond_4
    const/4 v0, 0x0

    .line 263
    :goto_5
    invoke-virtual {p0, p1, p2, v0}, Lcom/leanplum/LeanplumInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;
    .registers 14

    const-string v0, "Failed to close input stream."

    :try_start_2
    iget-object v1, p0, Lcom/leanplum/LeanplumInflater;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/leanplum/LeanplumInflater;->getLeanplumResources(Landroid/content/res/Resources;)Lcom/leanplum/LeanplumResources;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/leanplum/LeanplumResources;->getOverrideResource(I)Lcom/leanplum/Var;

    move-result-object v1

    if-eqz v1, :cond_e9

    iget-object v2, v1, Lcom/leanplum/Var;->stringValue:Ljava/lang/String;

    invoke-virtual {v1}, Lcom/leanplum/Var;->defaultValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e9

    invoke-virtual {v1}, Lcom/leanplum/Var;->overrideResId()I

    move-result v2

    if-eqz v2, :cond_2f

    iget-object v0, p0, Lcom/leanplum/LeanplumInflater;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {v0, v2, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0
    :try_end_2e
    .catchall {:try_start_2 .. :try_end_2e} :catchall_f4

    return-object p0

    :cond_2f
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_31
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-virtual {v1}, Lcom/leanplum/Var;->stream()Ljava/io/InputStream;

    move-result-object v5
    :try_end_3a
    .catchall {:try_start_31 .. :try_end_3a} :catchall_a3

    const/16 v6, 0x2000

    :try_start_3c
    new-array v6, v6, [B

    :goto_3e
    invoke-virtual {v5, v6}, Ljava/io/InputStream;->read([B)I

    move-result v7

    const/4 v8, -0x1

    if-le v7, v8, :cond_49

    invoke-virtual {v4, v6, v2, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_3e

    :cond_49
    const-string v6, "android.content.res.XmlBlock"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const-class v7, [B

    filled-new-array {v7}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4
    :try_end_65
    .catchall {:try_start_3c .. :try_end_65} :catchall_a1

    :try_start_65
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "newParser"

    invoke-virtual {v6, v7, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/res/XmlResourceParser;
    :try_end_75
    .catchall {:try_start_65 .. :try_end_75} :catchall_90

    :try_start_75
    iget-object v3, p0, Lcom/leanplum/LeanplumInflater;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    invoke-virtual {v3, v4, p2, p3}, Landroid/view/LayoutInflater;->inflate(Lorg/xmlpull/v1/XmlPullParser;Landroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3
    :try_end_7f
    .catchall {:try_start_75 .. :try_end_7f} :catchall_8e

    if-eqz v4, :cond_84

    :try_start_81
    invoke-interface {v4}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_84
    .catchall {:try_start_81 .. :try_end_84} :catchall_a1

    :cond_84
    :try_start_84
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_87
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_87} :catch_88

    return-object v3

    :catch_88
    new-array p0, v2, [Ljava/lang/Object;

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v3

    :catchall_8e
    move-exception v3

    goto :goto_94

    :catchall_90
    move-exception v4

    move-object v9, v4

    move-object v4, v3

    move-object v3, v9

    :goto_94
    :try_start_94
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6
    :try_end_9a
    .catchall {:try_start_94 .. :try_end_9a} :catchall_9a

    :catchall_9a
    move-exception v3

    if-eqz v4, :cond_a0

    :try_start_9d
    invoke-interface {v4}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_a0
    throw v3
    :try_end_a1
    .catchall {:try_start_9d .. :try_end_a1} :catchall_a1

    :catchall_a1
    move-exception v3

    goto :goto_a6

    :catchall_a3
    move-exception v4

    move-object v5, v3

    move-object v3, v4

    :goto_a6
    :try_start_a6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not inflate resource "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ":"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/leanplum/Var;->stringValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_c6
    .catchall {:try_start_a6 .. :try_end_c6} :catchall_dc

    if-eqz v5, :cond_d1

    :try_start_c8
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_cb
    .catch Ljava/io/IOException; {:try_start_c8 .. :try_end_cb} :catch_cc

    goto :goto_d1

    :catch_cc
    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_d1
    :goto_d1
    iget-object p0, p0, Lcom/leanplum/LeanplumInflater;->context:Landroid/content/Context;

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    invoke-virtual {p0, p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :catchall_dc
    move-exception p0

    if-eqz v5, :cond_e8

    :try_start_df
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_e2
    .catch Ljava/io/IOException; {:try_start_df .. :try_end_e2} :catch_e3

    goto :goto_e8

    :catch_e3
    new-array p1, v2, [Ljava/lang/Object;

    invoke-static {v0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_e8
    :goto_e8
    throw p0

    :cond_e9
    :try_start_e9
    iget-object v0, p0, Lcom/leanplum/LeanplumInflater;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0
    :try_end_f3
    .catchall {:try_start_e9 .. :try_end_f3} :catchall_f4

    return-object p0

    :catchall_f4
    move-exception v0

    instance-of v1, v0, Landroid/view/InflateException;

    if-nez v1, :cond_fc

    invoke-static {v0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_fc
    iget-object p0, p0, Lcom/leanplum/LeanplumInflater;->context:Landroid/content/Context;

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    invoke-virtual {p0, p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
