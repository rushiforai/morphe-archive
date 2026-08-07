.class final Lcom/heytap/mcssdk/e;
.super Ljava/lang/Object;


# static fields
.field private static final a:Lcom/heytap/mcssdk/PushManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/heytap/mcssdk/PushManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/heytap/mcssdk/PushManager;-><init>(Lcom/heytap/mcssdk/d;)V

    sput-object v0, Lcom/heytap/mcssdk/e;->a:Lcom/heytap/mcssdk/PushManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a()Lcom/heytap/mcssdk/PushManager;
    .locals 1

    sget-object v0, Lcom/heytap/mcssdk/e;->a:Lcom/heytap/mcssdk/PushManager;

    return-object v0
.end method
