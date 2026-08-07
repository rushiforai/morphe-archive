.class Lcom/sina/weibo/sdk/sso/WeiboSsoManager$Instance;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sina/weibo/sdk/sso/WeiboSsoManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Instance"
.end annotation


# static fields
.field private static final instance:Lcom/sina/weibo/sdk/sso/WeiboSsoManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/sina/weibo/sdk/sso/WeiboSsoManager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/sina/weibo/sdk/sso/WeiboSsoManager;-><init>(Lcom/sina/weibo/sdk/sso/WeiboSsoManager$1;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/sina/weibo/sdk/sso/WeiboSsoManager$Instance;->instance:Lcom/sina/weibo/sdk/sso/WeiboSsoManager;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100()Lcom/sina/weibo/sdk/sso/WeiboSsoManager;
    .locals 1

    .line 1
    sget-object v0, Lcom/sina/weibo/sdk/sso/WeiboSsoManager$Instance;->instance:Lcom/sina/weibo/sdk/sso/WeiboSsoManager;

    .line 2
    .line 3
    return-object v0
.end method
