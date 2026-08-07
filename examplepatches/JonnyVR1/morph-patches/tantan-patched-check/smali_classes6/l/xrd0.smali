.class public final synthetic Ll/xrd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

.field public final synthetic b:Lrx/subjects/a;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;Lrx/subjects/a;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xrd0;->a:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    iput-object p2, p0, Ll/xrd0;->b:Lrx/subjects/a;

    iput-object p3, p0, Ll/xrd0;->c:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xrd0;->a:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    iget-object v1, p0, Ll/xrd0;->b:Lrx/subjects/a;

    iget-object p0, p0, Ll/xrd0;->c:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->b(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;Lrx/subjects/a;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;Ljava/lang/Throwable;)V

    return-void
.end method
