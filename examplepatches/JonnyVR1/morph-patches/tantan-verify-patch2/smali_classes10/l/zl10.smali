.class public final synthetic Ll/zl10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/bm10;

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallTurnOnGuide;


# direct methods
.method public synthetic constructor <init>(Ll/bm10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallTurnOnGuide;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zl10;->a:Ll/bm10;

    iput-object p2, p0, Ll/zl10;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallTurnOnGuide;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zl10;->a:Ll/bm10;

    iget-object p0, p0, Ll/zl10;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallTurnOnGuide;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/bm10;->v(Ll/bm10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallTurnOnGuide;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
