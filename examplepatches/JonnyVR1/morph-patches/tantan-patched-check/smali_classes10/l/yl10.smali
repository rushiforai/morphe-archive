.class public final synthetic Ll/yl10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallTurnOnGuide;

.field public final synthetic b:Ll/bm10;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallTurnOnGuide;Ll/bm10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yl10;->a:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallTurnOnGuide;

    iput-object p2, p0, Ll/yl10;->b:Ll/bm10;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yl10;->a:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallTurnOnGuide;

    iget-object p0, p0, Ll/yl10;->b:Ll/bm10;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/bm10;->x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallTurnOnGuide;Ll/bm10;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
