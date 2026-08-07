.class public Ll/yaj0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

.field public c:Ljava/lang/String;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/zaj0;

.field public f:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/yaj0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/yaj0$a;-><init>(Ll/yaj0;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/yaj0;->f:Lrx/c;

    .line 22
    .line 23
    iput-object p1, p0, Ll/yaj0;->a:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    iput-object p2, p0, Ll/yaj0;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 26
    .line 27
    new-instance p2, Ll/zaj0;

    .line 28
    .line 29
    invoke-direct {p2}, Ll/zaj0;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object p2, p0, Ll/yaj0;->e:Ll/zaj0;

    .line 33
    .line 34
    new-instance v0, Ll/xaj0;

    .line 35
    .line 36
    invoke-direct {v0, p0, p1}, Ll/xaj0;-><init>(Ll/yaj0;Lcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, v0}, Ll/zaj0;->o(Ll/y20;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Ll/yaj0;Lcom/p1/mobile/android/app/Act;Ll/tee0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yaj0;->d(Lcom/p1/mobile/android/app/Act;Ll/tee0;)V

    return-void
.end method


# virtual methods
.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yaj0;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-object p1, p0, Ll/yaj0;->c:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    iget-object p1, p0, Ll/yaj0;->d:Ljava/util/List;

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    new-instance p1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/yaj0;->d:Ljava/util/List;

    .line 28
    .line 29
    :cond_1
    iget-object p1, p0, Ll/yaj0;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 30
    .line 31
    iget-object p0, p0, Ll/yaj0;->d:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->y1(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    iget-object p1, p0, Ll/yaj0;->e:Ll/zaj0;

    .line 38
    .line 39
    iget-object p0, p0, Ll/yaj0;->c:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Ll/b6;->i(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public c()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yaj0;->f:Lrx/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic d(Lcom/p1/mobile/android/app/Act;Ll/tee0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Ll/yaj0;->c:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p2, Ll/tee0;->c:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Ll/yaj0;->c:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p2, p2, Ll/tee0;->b:Ll/pf60;

    .line 33
    .line 34
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p2, Ljava/util/List;

    .line 37
    .line 38
    invoke-virtual {p0, p1, p2}, Ll/yaj0;->f(Ljava/lang/String;Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return-void
.end method

.method public e(Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yaj0;->f(Ljava/lang/String;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f(Ljava/lang/String;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x5

    .line 18
    if-le v1, v3, :cond_0

    .line 19
    .line 20
    invoke-interface {p2, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->new_()Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    iget-object v1, p0, Ll/yaj0;->a:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->g0:I

    .line 42
    .line 43
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 48
    .line 49
    invoke-interface {v0, v2, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/yaj0;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 53
    .line 54
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->w1(Ljava/lang/String;Ljava/util/List;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public g(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/yaj0;->d:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
