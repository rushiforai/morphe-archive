.class final Lcom/xiaomi/push/service/x$1;
.super Ll/tsq0$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/x;->a(Landroid/content/Context;Lcom/xiaomi/push/hb;[B)Lcom/xiaomi/push/service/x$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic a:Lcom/xiaomi/push/service/af;

.field final synthetic a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/xiaomi/push/service/af;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/service/x$1;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/xiaomi/push/service/x$1;->a:Lcom/xiaomi/push/service/af;

    .line 4
    .line 5
    iput p3, p0, Lcom/xiaomi/push/service/x$1;->a:I

    .line 6
    .line 7
    invoke-direct {p0}, Ll/tsq0$c;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/service/x$1;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/x$1;->a:Lcom/xiaomi/push/service/af;

    .line 2
    .line 3
    iget p0, p0, Lcom/xiaomi/push/service/x$1;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/service/af;->a(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
