.class public Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Landroid/widget/TextView;

.field public c:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;Ljava/lang/String;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->M(Ljava/lang/String;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->L(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method private synthetic L(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->Q(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->G(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s(Ljava/util/List;Ll/bkj0;)Ll/bkj0;
    .locals 2

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/util/List;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Ljava/lang/CharSequence;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, Ljava/lang/String;

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    const-string p1, ""

    .line 33
    .line 34
    :goto_1
    invoke-static {p0, v0, p1}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;Ljava/lang/String;Ll/bkj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->K(Ljava/lang/String;Ll/bkj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 9
    .line 10
    const v1, 0x9c6a

    .line 11
    .line 12
    .line 13
    if-eq v0, v1, :cond_2

    .line 14
    .line 15
    const v1, 0x9c6c

    .line 16
    .line 17
    .line 18
    if-eq v0, v1, :cond_2

    .line 19
    .line 20
    const v1, 0x9c6d

    .line 21
    .line 22
    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const v1, 0x9c6e

    .line 27
    .line 28
    .line 29
    if-ne v0, v1, :cond_1

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    :goto_0
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 44
    .line 45
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 50
    .line 51
    if-eqz p0, :cond_8

    .line 52
    .line 53
    move-object p0, p1

    .line 54
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 55
    .line 56
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 57
    .line 58
    const v1, 0x9d85

    .line 59
    .line 60
    .line 61
    if-eq v0, v1, :cond_7

    .line 62
    .line 63
    const v1, 0x9d93

    .line 64
    .line 65
    .line 66
    if-ne v0, v1, :cond_4

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_4
    invoke-static {p0}, Ll/g39;->e(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_5

    .line 74
    .line 75
    const-string p0, "\u5bf9\u65b9\u540c\u610f\u914d\u5bf9\u540e\u53ef\u53d1\u9001\u6d88\u606f\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85"

    .line 76
    .line 77
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_5
    invoke-static {p0}, Ll/g39;->d(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_6

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_6
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_7
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 98
    .line 99
    sget p1, Lcom/tantan/core/base/R$string;->o:I

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_8
    instance-of p0, p1, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 110
    .line 111
    if-eqz p0, :cond_9

    .line 112
    .line 113
    const-string p0, "\u7167\u7247\u542b\u6709\u8fdd\u89c4\u5185\u5bb9\uff0c\u8bf7\u66f4\u6362\u540e\u518d\u8bd5"

    .line 114
    .line 115
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_9
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public static synthetic w(Ll/bkj0;Ljava/util/List;)Ll/bkj0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, v0, p0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic z(Ll/bkj0;)Lrx/c;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    const-string v1, "chat"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "greeting"

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-static {v0, v2, v3, v1}, Ll/yb5;->K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/h6q;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/h6q;-><init>(Ll/bkj0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method


# virtual methods
.method public final F(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/i6q;->a(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final G(Ljava/util/List;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)",
            "Lrx/c<",
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
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
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    sget-object v1, Ll/uqb0;->R:Ll/s5m;

    .line 17
    .line 18
    invoke-interface {v1}, Ll/s5m;->c()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget-object p0, Ll/uqb0;->R:Ll/s5m;

    .line 25
    .line 26
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {p0, v0}, Ll/s5m;->b(Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance v0, Ll/g6q;

    .line 47
    .line 48
    invoke-direct {v0, p1}, Ll/g6q;-><init>(Ljava/util/List;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic$1;

    .line 57
    .line 58
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic$1;-><init>(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;)V

    .line 59
    .line 60
    .line 61
    const-string p0, ""

    .line 62
    .line 63
    invoke-static {p1, v0, p0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0
.end method

.method public final synthetic K(Ljava/lang/String;Ll/bkj0;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    iget-object v1, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/util/List;

    .line 8
    .line 9
    iget-object p2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p2, Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->P(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic M(Ljava/lang/String;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/4 p2, -0x1

    .line 2
    if-ne p3, p2, :cond_1

    .line 3
    .line 4
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    sget-object p2, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p4, p2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    check-cast p2, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    const/4 p4, 0x1

    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    return p4

    .line 26
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->N(Ljava/lang/String;Ljava/util/List;)V

    .line 27
    .line 28
    .line 29
    return p4

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public N(Ljava/lang/String;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/i1y;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p2, v1}, Ll/i1y;-><init>(Ljava/util/List;Z)V

    .line 5
    .line 6
    .line 7
    new-instance p2, Ll/b6q;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Ll/b6q;-><init>(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Lrx/c;->last()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p2, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    new-instance v0, Ll/c6q;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/c6q;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p2, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    new-instance v0, Ll/d6q;

    .line 54
    .line 55
    invoke-direct {v0, p0, p1}, Ll/d6q;-><init>(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    new-instance p2, Ll/e6q;

    .line 71
    .line 72
    invoke-direct {p2}, Ll/e6q;-><init>()V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ll/f6q;

    .line 76
    .line 77
    invoke-direct {v0, p1}, Ll/f6q;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public O(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "e_city_cover_send_pic"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->a:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/z5q;

    .line 25
    .line 26
    invoke-direct {v0, p0, p1}, Ll/z5q;-><init>(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final P(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    const-string p0, "picture"

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iput-object p0, v3, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    iput-object p2, v3, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    iput-object p3, v3, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 22
    .line 23
    :cond_0
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    iput-object p4, v3, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 30
    .line 31
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 34
    .line 35
    const-string p0, "city_c"

    .line 36
    .line 37
    invoke-static {p0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const/4 v4, 0x0

    .line 42
    const/4 v5, 0x0

    .line 43
    move-object v1, p1

    .line 44
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/j;->u6(Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final Q(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "e_city_cover_send_pic"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const/4 v3, 0x1

    .line 27
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMinPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const/4 v4, 0x0

    .line 36
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->showPreviewEditBtn(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v2, "\u53d1\u9001"

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withSubmitButtonTitle(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needClickPreview(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const/16 v2, 0xe

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    new-instance v2, Ll/a6q;

    .line 79
    .line 80
    invoke-direct {v2, p0, p1}, Ll/a6q;-><init>(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    sget p1, Ll/y7c0;->e:I

    .line 93
    .line 94
    sget v0, Ll/y7c0;->a:I

    .line 95
    .line 96
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->F(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
