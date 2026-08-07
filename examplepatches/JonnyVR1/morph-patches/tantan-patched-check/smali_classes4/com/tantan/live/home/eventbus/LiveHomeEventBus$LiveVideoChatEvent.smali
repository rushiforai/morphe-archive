.class public Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVideoChatEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LiveVideoChatEvent"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;


# direct methods
.method public constructor <init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVideoChatEvent;->this$0:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public refreshVideoChat()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVideoChatEvent;->this$0:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->a(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "6_0"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
