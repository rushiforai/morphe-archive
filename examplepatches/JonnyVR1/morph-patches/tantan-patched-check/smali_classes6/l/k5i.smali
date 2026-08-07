.class public final synthetic Ll/k5i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/FeedStateSquareBottomViewParams;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/FeedStateSquareBottomViewParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k5i;->a:Lcom/p1/mobile/putong/feed/data/FeedStateSquareBottomViewParams;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5i;->a:Lcom/p1/mobile/putong/feed/data/FeedStateSquareBottomViewParams;

    check-cast p1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$f;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->O4(Lcom/p1/mobile/putong/feed/data/FeedStateSquareBottomViewParams;Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$f;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
