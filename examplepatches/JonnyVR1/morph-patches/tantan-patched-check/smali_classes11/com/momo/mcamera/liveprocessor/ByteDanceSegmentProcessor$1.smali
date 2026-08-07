.class Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->process(Ll/omw;)Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->access$200(Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;)Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/jv0;->a()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;

    .line 12
    .line 13
    invoke-static {v2}, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->access$000(Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PortraitMatting;->BEF_PORTAITMATTING_SMALL_MODEL:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PortraitMatting;

    .line 18
    .line 19
    iget-object v4, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;

    .line 20
    .line 21
    invoke-static {v4}, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->access$100(Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->init(Landroid/content/Context;Ljava/lang/String;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PortraitMatting;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v0, v2

    .line 37
    :goto_0
    invoke-static {v1, v0}, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->access$302(Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;Z)Z

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;

    .line 41
    .line 42
    invoke-static {p0, v2}, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->access$402(Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;Z)Z

    .line 43
    .line 44
    .line 45
    return-void
.end method
