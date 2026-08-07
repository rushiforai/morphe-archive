.class public Ll/o0j$a;
.super Ll/jv00;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/o0j;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/o0j;


# direct methods
.method public constructor <init>(Ll/o0j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o0j$a;->a:Ll/o0j;

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
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/o0j$a;->a:Ll/o0j;

    .line 18
    .line 19
    iget-object p0, p0, Ll/n570;->b:Ll/qn00;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/qn00;->h(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o0j$a;->a:Ll/o0j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n570;->b:Ll/qn00;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/qn00;->f(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/o0j$a;->a:Ll/o0j;

    .line 18
    .line 19
    iget-object p0, p0, Ll/n570;->b:Ll/qn00;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/qn00;->i(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public d(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o0j$a;->a:Ll/o0j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n570;->b:Ll/qn00;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/qn00;->g(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
