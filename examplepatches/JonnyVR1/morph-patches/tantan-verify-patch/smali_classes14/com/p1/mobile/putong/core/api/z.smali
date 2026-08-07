.class public Lcom/p1/mobile/putong/core/api/z;
.super Ll/dy6;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/api/z$b;,
        Lcom/p1/mobile/putong/core/api/z$c;
    }
.end annotation


# instance fields
.field public R:Ll/jxd0;

.field public S:Lcom/p1/mobile/putong/core/api/z$b;

.field public T:Lcom/p1/mobile/putong/core/api/z$c;

.field public U:Ll/byd0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    const-string v0, "is_emotion_clicked"

    .line 7
    .line 8
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/z;->R:Ll/jxd0;

    .line 14
    .line 15
    new-instance p1, Lcom/p1/mobile/putong/core/api/z$b;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/api/z$b;-><init>(Lcom/p1/mobile/putong/core/api/z;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/z;->S:Lcom/p1/mobile/putong/core/api/z$b;

    .line 21
    .line 22
    new-instance p1, Ll/byd0;

    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "customStickerLastReadTime"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 32
    .line 33
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 34
    .line 35
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-wide/16 v1, 0x0

    .line 47
    .line 48
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/z;->U:Ll/byd0;

    .line 56
    .line 57
    new-instance p1, Lcom/p1/mobile/putong/core/api/z$c;

    .line 58
    .line 59
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/api/z$c;-><init>(Lcom/p1/mobile/putong/core/api/z;)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 63
    .line 64
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 65
    .line 66
    iget-object p0, p0, Ll/il8;->g:Ll/wzh0;

    .line 67
    .line 68
    const/16 p1, 0xc8

    .line 69
    .line 70
    const/16 v0, 0x3e8

    .line 71
    .line 72
    invoke-virtual {p0, p1, v0}, Ll/wzh0;->warmUp(II)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public static synthetic a3(Z[Ljava/lang/Object;)Ljava/util/List;
    .locals 7

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    array-length v1, p1

    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    :goto_0
    if-ge v3, v1, :cond_3

    .line 10
    .line 11
    aget-object v4, p1, v3

    .line 12
    .line 13
    check-cast v4, Ljava/util/List;

    .line 14
    .line 15
    if-nez p0, :cond_2

    .line 16
    .line 17
    array-length v5, p1

    .line 18
    const/4 v6, 0x1

    .line 19
    if-ne v5, v6, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    if-nez v5, :cond_1

    .line 27
    .line 28
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    check-cast v4, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 33
    .line 34
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    :goto_1
    return-object v4

    .line 41
    :cond_3
    return-object v0
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/data/Envelope;)Landroid/util/Pair;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-class v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :cond_0
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    .line 59
    .line 60
    const-string v0, ""

    .line 61
    .line 62
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method public static synthetic c3(Ljava/util/List;)Ljava/util/List;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public static synthetic d3(Ljava/lang/String;)Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "/stickers?filter=third-party&query="

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static synthetic e3(Lcom/p1/mobile/putong/core/api/z;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/z;->j3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    new-instance v1, Ll/g0b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/g0b;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-direct {v0, v1, p0}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Ll/h0b;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/h0b;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic g3(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static bridge synthetic h3(Lcom/p1/mobile/putong/core/api/z;)Ll/byd0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/z;->U:Ll/byd0;

    return-object p0
.end method


# virtual methods
.method public i3()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/z;->S:Lcom/p1/mobile/putong/core/api/z$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mof0;->o()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/mof0;->o()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/z;->U:Ll/byd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/byd0;->clear()Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic j3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    new-instance v1, Ll/f0b;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/f0b;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-direct {v0, v1, p1}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Lcom/p1/mobile/putong/core/api/z$a;

    .line 14
    .line 15
    invoke-direct {p1, p0, p2, p3}, Lcom/p1/mobile/putong/core/api/z$a;-><init>(Lcom/p1/mobile/putong/core/api/z;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public k3()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/z;->m3(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "loadPopularStickers"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/e0b;

    .line 18
    .line 19
    invoke-direct {v1, p1}, Ll/e0b;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public m3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "&channel="

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p1, ""

    .line 23
    .line 24
    :goto_0
    const-string v0, "/stickers?search=trending&limit=40&offset=0"

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/z;->l3(Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public n3(Ljava/util/List;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/api/z;->o3(Ljava/util/List;ZLjava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public o3(Ljava/util/List;ZLjava/lang/String;)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-ge v1, v2, :cond_1

    .line 28
    .line 29
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, v2, p3}, Lcom/p1/mobile/putong/core/api/z;->q3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    new-instance v3, Ll/c0b;

    .line 40
    .line 41
    invoke-direct {v3}, Ll/c0b;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    new-instance p0, Ll/d0b;

    .line 55
    .line 56
    invoke-direct {p0, p2}, Ll/d0b;-><init>(Z)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, p0}, Lrx/c;->zip(Ljava/lang/Iterable;Ll/zcj;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method public p3(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/z;->q3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->o9()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    const-string v0, "chat_text_associate"

    .line 34
    .line 35
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    const-string v0, "chat_ice_break"

    .line 42
    .line 43
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    :cond_1
    invoke-static {}, Ll/g5g0;->e()Ll/g5g0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0, p1}, Ll/g5g0;->c(Ljava/lang/String;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_2

    .line 62
    .line 63
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_2
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_3

    .line 73
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v1, "&channel="

    .line 77
    .line 78
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    goto :goto_0

    .line 89
    :cond_3
    const-string v0, ""

    .line 90
    .line 91
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iget-object v1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 107
    .line 108
    const-string v2, "searchThirdPartyStickers"

    .line 109
    .line 110
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    new-instance v3, Ll/b0b;

    .line 115
    .line 116
    invoke-direct {v3, p0, v0, p2, p1}, Ll/b0b;-><init>(Lcom/p1/mobile/putong/core/api/z;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    const/4 p0, 0x0

    .line 120
    invoke-virtual {v1, v2, p0, v3}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0
.end method

.method public r3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->g:Ll/wzh0;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/Sticker;->NAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/data/Sticker;->SOURCE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 12
    .line 13
    const-string v1, "poke"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "intimate"

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    filled-new-array {v1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    filled-new-array {p1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x0

    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-virtual {p0, p1, v0, v1}, Ll/wzh0;->queryCache(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Sticker;->new_()Lcom/p1/mobile/putong/core/data/Sticker;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_0
    const/4 p1, 0x0

    .line 59
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 64
    .line 65
    return-object p0
.end method

.method public s3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->g:Ll/wzh0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Sticker;->new_()Lcom/p1/mobile/putong/core/data/Sticker;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_0
    return-object p0
.end method
