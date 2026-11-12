.class public final Lfl6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lfl6;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lfl6;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lfl6;->a:Lfl6;

    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 4

    const-string v0, "Current AssetManager is null."

    const/4 v1, 0x0

    :try_start_3
    sget-object v2, Lorg/jetbrains/compose/resources/AndroidContextProvider;->a:Landroid/content/Context;

    if-eqz v2, :cond_c

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    goto :goto_d

    :cond_c
    move-object v2, v1

    :goto_d
    if-eqz v2, :cond_16

    invoke-virtual {v2, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    if-eqz v2, :cond_16

    return-object v2

    :cond_16
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-direct {v2, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1c
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_1c} :catch_1c

    :catch_1c
    :try_start_1c
    invoke-static {}, Lr41;->b()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2
    :try_end_24
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1c .. :try_end_24} :catch_25
    .catch Ljava/io/FileNotFoundException; {:try_start_1c .. :try_end_24} :catch_34

    goto :goto_26

    :catch_25
    move-object v2, v1

    :goto_26
    if-eqz v2, :cond_2e

    :try_start_28
    invoke-virtual {v2, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    if-nez v2, :cond_42

    :cond_2e
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-direct {v2, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_34
    .catch Ljava/io/FileNotFoundException; {:try_start_28 .. :try_end_34} :catch_34

    :catch_34
    const-class v0, Lfl6;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    if-eqz v0, :cond_47

    invoke-virtual {v0, p0}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    if-eqz v2, :cond_43

    :cond_42
    return-object v2

    :cond_43
    invoke-static {p0}, Lfl6;->c(Ljava/lang/String;)V

    throw v1

    :cond_47
    const-string p0, "Cannot find class loader"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    invoke-static {p0}, Lfl6;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    :try_start_4
    invoke-static {p0}, Laib;->E(Ljava/io/InputStream;)[B

    move-result-object v0
    :try_end_8
    .catchall {:try_start_4 .. :try_end_8} :catchall_c

    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    return-object v0

    :catchall_c
    move-exception v0

    :try_start_d
    throw v0
    :try_end_e
    .catchall {:try_start_d .. :try_end_e} :catchall_e

    :catchall_e
    move-exception v1

    invoke-static {p0, v0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static c(Ljava/lang/String;)V
    .registers 4

    sget-object v0, Lorg/jetbrains/compose/resources/AndroidContextProvider;->a:Landroid/content/Context;

    const/16 v1, 0xc

    if-nez v0, :cond_12

    new-instance v0, Llv0;

    const-string v2, ". Android context is not initialized. If it happens in the Preview mode then call PreviewContextConfigurationEffect() function."

    invoke-virtual {p0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0, v1}, Llv0;-><init>(Ljava/lang/String;B)V

    throw v0

    :cond_12
    new-instance v0, Llv0;

    invoke-direct {v0, p0, v1}, Llv0;-><init>(Ljava/lang/String;B)V

    throw v0
.end method
