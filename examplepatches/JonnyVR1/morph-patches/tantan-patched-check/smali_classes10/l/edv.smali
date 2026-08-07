.class public final synthetic Ll/edv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/LiveVoiceTopicInputView;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/LiveVoiceTopicInputView;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/edv;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/LiveVoiceTopicInputView;

    iput-object p2, p0, Ll/edv;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/edv;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/LiveVoiceTopicInputView;

    iget-object p0, p0, Ll/edv;->b:Ll/y20;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/LiveVoiceTopicInputView;->b(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/LiveVoiceTopicInputView;Ll/y20;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
