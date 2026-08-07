.class public final synthetic Ll/w3i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w3i;->a:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    iput-object p2, p0, Ll/w3i;->b:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w3i;->a:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    iget-object p0, p0, Ll/w3i;->b:Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->a(Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
