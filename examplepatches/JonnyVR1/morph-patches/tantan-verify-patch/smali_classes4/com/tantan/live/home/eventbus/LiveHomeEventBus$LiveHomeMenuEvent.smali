.class public Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LiveHomeMenuEvent"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;


# direct methods
.method public constructor <init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->this$0:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public isLiveVideoStyle()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->this$0:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->a(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_3"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public multiCallPartyIcon()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/String;",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->this$0:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->a(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_1"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public onMenuDialogShow()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->this$0:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->a(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_5"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public refresh()Ll/v3f$c;
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
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->this$0:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->a(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_4"

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

.method public searchIcon()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/String;",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->this$0:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->a(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_2"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public skinConfig()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/String;",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->this$0:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->a(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_0"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
