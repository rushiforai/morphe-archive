.class public Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$c;
.super Ll/jv00;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->g4(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jv00;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    check-cast v2, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 10
    .line 11
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->t5(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->r5(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;)Ll/qn00;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/qn00;->h(Ljava/util/List;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    check-cast v2, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 10
    .line 11
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->t5(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->r5(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;)Ll/qn00;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/qn00;->i(Ljava/util/List;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method
