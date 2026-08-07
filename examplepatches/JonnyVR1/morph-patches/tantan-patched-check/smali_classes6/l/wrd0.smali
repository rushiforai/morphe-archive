.class public final synthetic Ll/wrd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;

.field public final synthetic c:Lrx/subjects/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;Lrx/subjects/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wrd0;->a:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    iput-object p2, p0, Ll/wrd0;->b:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;

    iput-object p3, p0, Ll/wrd0;->c:Lrx/subjects/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wrd0;->a:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    iget-object v1, p0, Ll/wrd0;->b:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;

    iget-object p0, p0, Ll/wrd0;->c:Lrx/subjects/a;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->a(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;Lrx/subjects/a;Ljava/lang/Object;)V

    return-void
.end method
