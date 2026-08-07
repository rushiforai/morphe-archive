.class public Ll/u8c;
.super Ll/p7;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/p7<",
        "Ll/pf60<",
        "Lcom/p1/mobile/putong/data/Links;",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/jv00;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/p7;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/u8c$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/u8c$a;-><init>(Ll/u8c;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/u8c;->f:Ll/jv00;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/p7;->c()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/u8c;->e:Ljava/util/List;

    .line 6
    .line 7
    return-void
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p7;->b:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Ll/pf60;

    .line 7
    .line 8
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p0, Ll/pf60;

    .line 13
    .line 14
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-lez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public h()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/u8c;->f:Ll/jv00;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/jka;->Ec(Ll/jv00;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public l()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/u8c;->e:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
