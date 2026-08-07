.class public Lcom/p1/mobile/putong/feed/newui/kankan/view/a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->T()Landroidx/recyclerview/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ywg;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/a;Ll/ywg;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$b;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$b;->a:Ll/ywg;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(ZI)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$b;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->C(Lcom/p1/mobile/putong/feed/newui/kankan/view/a;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$b;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->C(Lcom/p1/mobile/putong/feed/newui/kankan/view/a;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$b;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->C(Lcom/p1/mobile/putong/feed/newui/kankan/view/a;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$b;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$b;->a:Ll/ywg;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->C(Lcom/p1/mobile/putong/feed/newui/kankan/view/a;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->E(Lcom/p1/mobile/putong/feed/newui/kankan/view/a;Ll/ywg;Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$b;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$b;->a:Ll/ywg;

    .line 44
    .line 45
    invoke-static {v0, v1, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->F(Lcom/p1/mobile/putong/feed/newui/kankan/view/a;Ll/ywg;Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a$b;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 49
    .line 50
    new-instance v0, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->D(Lcom/p1/mobile/putong/feed/newui/kankan/view/a;Ljava/util/List;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
