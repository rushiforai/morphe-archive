.class public Ll/t4i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation
.end field

.field public c:I

.field public d:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/t4i;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iput-object p2, p0, Ll/t4i;->b:Ljava/util/List;

    .line 12
    .line 13
    iput p3, p0, Ll/t4i;->c:I

    .line 14
    .line 15
    iput p3, p0, Ll/t4i;->d:I

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t4i;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t4i;->b:Ljava/util/List;

    .line 2
    .line 3
    iget p0, p0, Ll/t4i;->d:I

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 10
    .line 11
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t4i;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(I)Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t4i;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public e()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t4i;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(I)Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/t4i;->b:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public g(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/t4i;->d:I

    .line 2
    .line 3
    return-void
.end method
