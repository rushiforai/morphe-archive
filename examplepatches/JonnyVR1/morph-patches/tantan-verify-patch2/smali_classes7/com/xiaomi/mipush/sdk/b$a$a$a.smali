.class Lcom/xiaomi/mipush/sdk/b$a$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/b$a$a;->e(Lcom/xiaomi/push/gj;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/push/gj;

.field final synthetic b:Lcom/xiaomi/mipush/sdk/b$a$a;


# direct methods
.method public constructor <init>(Lcom/xiaomi/mipush/sdk/b$a$a;Lcom/xiaomi/push/gj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/b$a$a$a;->b:Lcom/xiaomi/mipush/sdk/b$a$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/b$a$a$a;->a:Lcom/xiaomi/push/gj;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/b$a$a$a;->b:Lcom/xiaomi/mipush/sdk/b$a$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/xiaomi/mipush/sdk/b$a$a;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/b$a$a$a;->a:Lcom/xiaomi/push/gj;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/b$a$a$a;->b:Lcom/xiaomi/mipush/sdk/b$a$a;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/b$a$a;->d(Lcom/xiaomi/mipush/sdk/b$a$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
