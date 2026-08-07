.class public Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopMenuEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/live/eventbus/LiveEventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "VoiceTopMenuEvent"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantan/live/eventbus/LiveEventBus;


# direct methods
.method public constructor <init>(Lcom/tantan/live/eventbus/LiveEventBus;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopMenuEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public showTopMenu()Ll/v3f$c;
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
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopMenuEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "33_0"

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
