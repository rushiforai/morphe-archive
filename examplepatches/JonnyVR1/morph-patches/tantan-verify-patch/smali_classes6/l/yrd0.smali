.class public final synthetic Ll/yrd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

.field public final synthetic b:Lrx/subjects/a;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;Lrx/subjects/a;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yrd0;->a:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    iput-object p2, p0, Ll/yrd0;->b:Lrx/subjects/a;

    iput-object p3, p0, Ll/yrd0;->c:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yrd0;->a:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    iget-object v1, p0, Ll/yrd0;->b:Lrx/subjects/a;

    iget-object p0, p0, Ll/yrd0;->c:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->c(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;Lrx/subjects/a;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)V

    return-void
.end method
