.class public Lcom/xiaomi/mipush/sdk/MessageHandleService$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/MessageHandleService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field private a:Lcom/xiaomi/mipush/sdk/PushMessageReceiver;

.field private b:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Landroid/content/Intent;Lcom/xiaomi/mipush/sdk/PushMessageReceiver;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/MessageHandleService$c;->a:Lcom/xiaomi/mipush/sdk/PushMessageReceiver;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/MessageHandleService$c;->b:Landroid/content/Intent;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Landroid/content/Intent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/MessageHandleService$c;->b:Landroid/content/Intent;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lcom/xiaomi/mipush/sdk/PushMessageReceiver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/MessageHandleService$c;->a:Lcom/xiaomi/mipush/sdk/PushMessageReceiver;

    .line 2
    .line 3
    return-object p0
.end method
