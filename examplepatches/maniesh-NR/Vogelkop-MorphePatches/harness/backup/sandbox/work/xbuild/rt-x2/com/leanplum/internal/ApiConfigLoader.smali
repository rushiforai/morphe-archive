.class public Lcom/leanplum/internal/ApiConfigLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/internal/ApiConfigLoader$KeyListener;
    }
.end annotation


# static fields
.field private static final ENV_DEV:Ljava/lang/String; = "development"

.field private static final ENV_PROD:Ljava/lang/String; = "production"

.field private static final STRING_APPID:Ljava/lang/String; = "leanplum_app_id"

.field private static final STRING_DEV_KEY:Ljava/lang/String; = "leanplum_dev_key"

.field private static final STRING_ENV:Ljava/lang/String; = "leanplum_environment"

.field private static final STRING_PROD_KEY:Ljava/lang/String; = "leanplum_prod_key"


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/internal/ApiConfigLoader;->context:Landroid/content/Context;

    return-void
.end method

.method private getStringResource(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    :try_start_0
    iget-object v0, p0, Lcom/leanplum/internal/ApiConfigLoader;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/internal/ApiConfigLoader;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "string"

    invoke-virtual {v1, p1, v2, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iget-object p0, p0, Lcom/leanplum/internal/ApiConfigLoader;->context:Landroid/content/Context;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0
    :try_end_18
    .catchall {:try_start_0 .. :try_end_18} :catchall_19

    return-object p0

    :catchall_19
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "Cannot load string for key = %s. Message = %s"

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public loadFromResources(Lcom/leanplum/internal/ApiConfigLoader$KeyListener;Lcom/leanplum/internal/ApiConfigLoader$KeyListener;)V
    .registers 9

    const-string v0, "leanplum_app_id"

    invoke-direct {p0, v0}, Lcom/leanplum/internal/ApiConfigLoader;->getStringResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "leanplum_prod_key"

    invoke-direct {p0, v1}, Lcom/leanplum/internal/ApiConfigLoader;->getStringResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "leanplum_dev_key"

    invoke-direct {p0, v2}, Lcom/leanplum/internal/ApiConfigLoader;->getStringResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "leanplum_environment"

    invoke-direct {p0, v3}, Lcom/leanplum/internal/ApiConfigLoader;->getStringResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_48

    const-string v3, "development"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz p0, :cond_3c

    if-nez v4, :cond_48

    invoke-interface {p2, v0, v2}, Lcom/leanplum/internal/ApiConfigLoader$KeyListener;->onKeysLoaded(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "Using appId and accessKey from Android resources for development environment."

    new-array p1, v5, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_3c
    if-nez v3, :cond_48

    invoke-interface {p1, v0, v1}, Lcom/leanplum/internal/ApiConfigLoader$KeyListener;->onKeysLoaded(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "Using appId and accessKey from Android resources for production environment."

    new-array p1, v5, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_48
    return-void
.end method
