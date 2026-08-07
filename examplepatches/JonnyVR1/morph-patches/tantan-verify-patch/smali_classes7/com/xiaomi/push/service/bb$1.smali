.class final Lcom/xiaomi/push/service/bb$1;
.super Ll/tsq0$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/bb;->a(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Landroid/app/Notification;)Ll/tsq0$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic a:Landroid/app/Notification;

.field final synthetic a:Landroid/content/Context;

.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Landroid/content/Context;Ljava/lang/String;Landroid/app/Notification;)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/xiaomi/push/service/bb$1;->a:I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/xiaomi/push/service/bb$1;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/xiaomi/push/service/bb$1;->a:Landroid/content/Context;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/xiaomi/push/service/bb$1;->b:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/xiaomi/push/service/bb$1;->a:Landroid/app/Notification;

    .line 10
    .line 11
    invoke-direct {p0}, Ll/tsq0$c;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    .line 1
    iget v0, p0, Lcom/xiaomi/push/service/bb$1;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/xiaomi/push/service/bb$1;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/xiaomi/push/service/bb;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public run()V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/bb$1;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/xiaomi/push/service/bb$1;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget v2, p0, Lcom/xiaomi/push/service/bb$1;->a:I

    .line 6
    .line 7
    iget-object v3, p0, Lcom/xiaomi/push/service/bb$1;->a:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/service/bb$1;->a:Landroid/app/Notification;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lcom/xiaomi/push/service/bb;->b(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Landroid/app/Notification;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
