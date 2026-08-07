.class Lcom/xiaomi/push/h$a;
.super Lcom/xiaomi/push/service/ax$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/h;->j(Lcom/xiaomi/push/service/XMPushService;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic b:Lcom/xiaomi/push/h;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/push/h$a;->b:Lcom/xiaomi/push/h;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/xiaomi/push/service/ax$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/gzq0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/gzq0;->w()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1}, Ll/gzq0;->v()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/h;->h(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
