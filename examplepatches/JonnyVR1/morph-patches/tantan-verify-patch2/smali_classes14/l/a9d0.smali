.class public Ll/a9d0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/data/Pagination;

.field public c:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/data/Pagination;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;",
            ">;",
            "Lcom/p1/mobile/putong/data/Pagination;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a9d0;->a:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Ll/a9d0;->b:Lcom/p1/mobile/putong/data/Pagination;

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/a9d0;->c:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/a9d0;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/a9d0;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/a9d0;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/data/Pagination;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a9d0;->b:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/a9d0;->c:Z

    .line 2
    .line 3
    return p0
.end method
