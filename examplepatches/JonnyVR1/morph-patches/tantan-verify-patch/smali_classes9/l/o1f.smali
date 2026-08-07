.class public Ll/o1f;
.super Ll/zh2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/zh2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public e(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ljava/util/List;Ll/pf60;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p2

    .line 8
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const/16 p1, 0xc8

    .line 13
    .line 14
    if-le p0, p1, :cond_1

    .line 15
    .line 16
    add-int/lit16 p0, p0, -0xb4

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-interface {p2, p1, p0}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-object p2
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
