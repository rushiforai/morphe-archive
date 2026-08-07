.class public Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/helper/NetworkLoggerCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->setLoggerCallBack(Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;


# direct methods
.method public constructor <init>(Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$1;->a:Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public logger(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$1;->a:Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;->logger(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
