.class public Lcom/tencent/could/component/common/ai/net/JsonCallBackListener$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/component/common/ai/net/JsonCallBackListener;->onFailed(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/tencent/could/component/common/ai/net/JsonCallBackListener;


# direct methods
.method public constructor <init>(Lcom/tencent/could/component/common/ai/net/JsonCallBackListener;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/net/JsonCallBackListener$3;->b:Lcom/tencent/could/component/common/ai/net/JsonCallBackListener;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/could/component/common/ai/net/JsonCallBackListener$3;->a:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/JsonCallBackListener$3;->b:Lcom/tencent/could/component/common/ai/net/JsonCallBackListener;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/could/component/common/ai/net/JsonCallBackListener;->a:Lcom/tencent/could/component/common/ai/net/IJsonDataListener;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/JsonCallBackListener$3;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Lcom/tencent/could/component/common/ai/net/IJsonDataListener;->onFailed(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/JsonCallBackListener$3;->b:Lcom/tencent/could/component/common/ai/net/JsonCallBackListener;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tencent/could/component/common/ai/net/JsonCallBackListener;->cleanListener()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
