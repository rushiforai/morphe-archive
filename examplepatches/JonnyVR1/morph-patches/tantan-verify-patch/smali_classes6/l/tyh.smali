.class public final synthetic Ll/tyh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yyh;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;


# direct methods
.method public synthetic constructor <init>(Ll/yyh;Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tyh;->a:Ll/yyh;

    iput-object p2, p0, Ll/tyh;->b:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tyh;->a:Ll/yyh;

    iget-object p0, p0, Ll/tyh;->b:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;

    check-cast p1, Lcom/p1/mobile/putong/data/KanPostData;

    invoke-static {v0, p0, p1}, Ll/yyh;->i(Ll/yyh;Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/view/FeedMineStatusBottomOperationView;Lcom/p1/mobile/putong/data/KanPostData;)V

    return-void
.end method
