.class public Ll/izh;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ozh;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/uzh;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/izh;->b:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e0(Ll/izh;Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/izh;->j0(Ll/x20;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/izh;Ll/x20;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/izh;->i0(Ll/x20;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method private h0()V
    .locals 7

    .line 1
    sget-object v0, Ll/owi;->g:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-class v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/4 v2, 0x1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 38
    .line 39
    new-instance v3, Ll/uzh;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    iget-object v5, v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;->categoryName:Ljava/lang/String;

    .line 43
    .line 44
    invoke-direct {v3, v2, v4, v5}, Ll/uzh;-><init>(ZLcom/p1/mobile/putong/data/Emotion;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Ll/izh;->b:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;->emotions:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_1

    .line 63
    .line 64
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Lcom/p1/mobile/putong/data/Emotion;

    .line 69
    .line 70
    new-instance v4, Ll/uzh;

    .line 71
    .line 72
    const/4 v5, 0x0

    .line 73
    iget-object v6, v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;->categoryName:Ljava/lang/String;

    .line 74
    .line 75
    invoke-direct {v4, v5, v3, v6}, Ll/uzh;-><init>(ZLcom/p1/mobile/putong/data/Emotion;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v3, p0, Ll/izh;->b:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    iget-object v0, p0, Ll/izh;->c:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 87
    .line 88
    if-nez v0, :cond_3

    .line 89
    .line 90
    iget-object v0, p0, Ll/izh;->b:Ljava/util/List;

    .line 91
    .line 92
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_3

    .line 97
    .line 98
    iget-object v0, p0, Ll/izh;->b:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-le v0, v2, :cond_3

    .line 105
    .line 106
    iget-object v0, p0, Ll/izh;->c:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 107
    .line 108
    iget-object v1, p0, Ll/izh;->b:Ljava/util/List;

    .line 109
    .line 110
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    check-cast v1, Ll/uzh;

    .line 115
    .line 116
    invoke-virtual {v1}, Ll/uzh;->b()Lcom/p1/mobile/putong/data/Emotion;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 121
    .line 122
    :cond_3
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 123
    .line 124
    check-cast v0, Ll/ozh;

    .line 125
    .line 126
    iget-object v1, p0, Ll/izh;->c:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 127
    .line 128
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ll/ozh;->A(Lcom/p1/mobile/putong/data/Emotion;)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 134
    .line 135
    check-cast p0, Ll/ozh;

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/ozh;->q()V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method private synthetic i0(Ll/x20;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/izh;->a:Z

    .line 3
    .line 4
    const-class p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 5
    .line 6
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/data/Detect;->text:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/data/Detect;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    invoke-interface {p1}, Ll/x20;->call()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const-string p1, "p_set_my_state_post"

    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/ksg;->l(Lcom/p1/mobile/putong/data/Detect;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->s:I

    .line 43
    .line 44
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->W2:I

    .line 49
    .line 50
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private synthetic j0(Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/izh;->a:Z

    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 9
    .line 10
    iput-object v0, p0, Ll/izh;->c:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 11
    .line 12
    invoke-direct {p0}, Ll/izh;->h0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public g0(Ljava/lang/String;Ll/x20;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/izh;->a:Z

    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/data/DetectRequest;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DetectRequest;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "moment"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DetectRequest;->category:Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 16
    .line 17
    new-instance v1, Lcom/p1/mobile/putong/data/DetectText;

    .line 18
    .line 19
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/DetectText;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v2, "myState"

    .line 23
    .line 24
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DetectText;->key:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p1, v1, Lcom/p1/mobile/putong/data/DetectText;->value:Ljava/lang/String;

    .line 27
    .line 28
    new-instance p1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, v0, Lcom/p1/mobile/putong/data/DetectRequest;->text:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ll/jka;->P6(Lcom/p1/mobile/putong/data/DetectRequest;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v0, Ll/gzh;

    .line 49
    .line 50
    invoke-direct {v0, p0, p2}, Ll/gzh;-><init>(Ll/izh;Ll/x20;)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Ll/hzh;

    .line 54
    .line 55
    invoke-direct {v1, p0, p2}, Ll/hzh;-><init>(Ll/izh;Ll/x20;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/izh;->c:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->l:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p0}, Ll/ms8;->V0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method
