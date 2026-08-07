.class public Ll/z7j;
.super Ll/em2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/em2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Ljava/lang/String;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic p(Ljava/lang/String;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public bridge synthetic a(Ll/oql;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/z7j;->t(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Ll/em2;->c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    instance-of p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagLayout;

    .line 5
    .line 6
    if-nez p3, :cond_0

    .line 7
    .line 8
    goto/16 :goto_1

    .line 9
    .line 10
    :cond_0
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagLayout;

    .line 11
    .line 12
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagLayout;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 13
    .line 14
    invoke-virtual {p0, p3, p1, p4}, Ll/em2;->k(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 18
    .line 19
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->g:Ljava/util/List;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->f:Ll/gj40$h;

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagLayout;->f:Lv/VText;

    .line 30
    .line 31
    sget p3, Ll/qa00;->Q:I

    .line 32
    .line 33
    invoke-static {p0, p3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagLayout;->g:Lv/VText;

    .line 37
    .line 38
    invoke-static {p0, p3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagLayout;->e:Lv/VLinear;

    .line 42
    .line 43
    const/4 p3, 0x0

    .line 44
    invoke-virtual {p0, p3}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagLayout;->h:Lcom/p1/mobile/putong/core/view/CardLabelShowView;

    .line 48
    .line 49
    const/16 p4, 0x8

    .line 50
    .line 51
    invoke-virtual {p0, p4}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->d:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-lez p0, :cond_2

    .line 63
    .line 64
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagLayout;->f:Lv/VText;

    .line 65
    .line 66
    iget-object p4, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 67
    .line 68
    iget-object p4, p4, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->d:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p4

    .line 74
    check-cast p4, Ljava/lang/CharSequence;

    .line 75
    .line 76
    invoke-virtual {p0, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->d:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    const/4 p4, 0x1

    .line 88
    if-le p0, p4, :cond_3

    .line 89
    .line 90
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagLayout;->g:Lv/VText;

    .line 91
    .line 92
    iget-object p5, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 93
    .line 94
    iget-object p5, p5, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->d:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {p5, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p5

    .line 100
    check-cast p5, Ljava/lang/CharSequence;

    .line 101
    .line 102
    invoke-virtual {p0, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    :cond_3
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagLayout;->f:Lv/VText;

    .line 106
    .line 107
    iget-object p5, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 108
    .line 109
    iget-object p5, p5, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->d:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {p5}, Ljava/util/List;->size()I

    .line 112
    .line 113
    .line 114
    move-result p5

    .line 115
    if-lez p5, :cond_4

    .line 116
    .line 117
    move p5, p4

    .line 118
    goto :goto_0

    .line 119
    :cond_4
    move p5, p3

    .line 120
    :goto_0
    invoke-static {p0, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagLayout;->g:Lv/VText;

    .line 124
    .line 125
    iget-object p2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 126
    .line 127
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->d:Ljava/util/List;

    .line 128
    .line 129
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    if-le p2, p4, :cond_5

    .line 134
    .line 135
    move p3, p4

    .line 136
    :cond_5
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->d:Ljava/util/List;

    .line 142
    .line 143
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-nez p0, :cond_6

    .line 148
    .line 149
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->TAG:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 150
    .line 151
    const/high16 p2, 0x42ac0000    # 86.0f

    .line 152
    .line 153
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result p2

    .line 157
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->w(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;I)V

    .line 158
    .line 159
    .line 160
    :cond_6
    :goto_1
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Ll/qk4;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/em2;->j(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Ll/qk4;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/qk4;->c()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    instance-of p2, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagLayout;

    .line 9
    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p0, p2, p1}, Ll/z7j;->r(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/z7j;->s(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->e:Ljava/util/Map;

    .line 29
    .line 30
    invoke-static {p0}, Ll/pza0;->i(Ljava/util/Map;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 4
    .line 5
    new-instance p1, Ll/x7j;

    .line 6
    .line 7
    invoke-direct {p1, p3}, Ll/x7j;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 39
    .line 40
    new-instance v0, Ll/y7j;

    .line 41
    .line 42
    invoke-direct {v0, p3}, Ll/y7j;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 51
    .line 52
    :goto_0
    invoke-interface {p1, p0}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/4 v1, 0x0

    .line 60
    if-nez v0, :cond_1

    .line 61
    .line 62
    invoke-interface {p0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 63
    .line 64
    .line 65
    invoke-interface {p0, v1, p1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 66
    .line 67
    .line 68
    :cond_1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    new-instance p1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-ge v1, v0, :cond_3

    .line 84
    .line 85
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lcom/p1/mobile/putong/data/Tag;

    .line 90
    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    const-string v2, "\u3001"

    .line 94
    .line 95
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    add-int/lit8 v1, v1, 0x1

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_3
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    invoke-virtual {p1, p0, p2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-interface {p4, p3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-interface {p5, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    :cond_4
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 16
    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final s(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;)V
    .locals 7

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->f:Ll/gj40$h;

    .line 19
    .line 20
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_4

    .line 25
    .line 26
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 27
    .line 28
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->f:Ll/gj40$h;

    .line 29
    .line 30
    invoke-virtual {v2}, Ll/gj40$h;->b()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_4

    .line 39
    .line 40
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 41
    .line 42
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->f:Ll/gj40$h;

    .line 43
    .line 44
    invoke-virtual {v2}, Ll/gj40$h;->b()Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_4

    .line 57
    .line 58
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 63
    .line 64
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    const-string v5, ","

    .line 71
    .line 72
    if-nez v4, :cond_1

    .line 73
    .line 74
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    :cond_1
    iget-boolean v4, v3, Lcom/p1/mobile/putong/core/data/NewTags;->localIsCommonLabel:Z

    .line 83
    .line 84
    if-eqz v4, :cond_2

    .line 85
    .line 86
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    :cond_2
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    if-nez v4, :cond_0

    .line 101
    .line 102
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    :cond_3
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-eqz v4, :cond_0

    .line 113
    .line 114
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    check-cast v4, Lcom/p1/mobile/putong/core/data/TagCategories;

    .line 119
    .line 120
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/TagCategories;->name:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v6

    .line 126
    if-nez v6, :cond_3

    .line 127
    .line 128
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/TagCategories;->name:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 142
    .line 143
    const-string v2, "receiver_user_id"

    .line 144
    .line 145
    invoke-static {v2, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    const-string v2, "personal_tag_category"

    .line 150
    .line 151
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-static {v2, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    const-string v2, "personal_tag_name"

    .line 160
    .line 161
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-static {v2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    const-string v2, "common_personal_tag"

    .line 170
    .line 171
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    filled-new-array {p1, p0, v0, v1}, [Ll/sfj0$a;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    const-string p1, "e_card_personal_tag"

    .line 184
    .line 185
    const-string v0, "p_suggest_users_home_view"

    .line 186
    .line 187
    invoke-static {p1, v0, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    const/4 p2, 0x0

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    return p2

    .line 9
    :cond_0
    sget-object p3, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->TAG:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 10
    .line 11
    const/high16 v0, 0x42a00000    # 80.0f

    .line 12
    .line 13
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1, p3, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->w(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;I)V

    .line 18
    .line 19
    .line 20
    new-instance v4, Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 23
    .line 24
    .line 25
    new-instance v5, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object p3, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 31
    .line 32
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 33
    .line 34
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 35
    .line 36
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    new-instance p3, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-interface {v4}, Ljava/util/Map;->clear()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    const-string v2, "userId"

    .line 59
    .line 60
    invoke-interface {v4, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const/4 v6, 0x1

    .line 68
    if-nez v0, :cond_5

    .line 69
    .line 70
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0, p3}, Ll/gj40;->P(Ljava/util/List;)Ll/gj40$h;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-boolean v2, v0, Ll/gj40$h;->a:Z

    .line 79
    .line 80
    if-eqz v2, :cond_4

    .line 81
    .line 82
    invoke-virtual {v0}, Ll/gj40$h;->b()Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-nez v2, :cond_4

    .line 91
    .line 92
    invoke-virtual {v0}, Ll/gj40$h;->b()Ljava/util/List;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    sget v1, Lcom/p1/mobile/putong/core/R$string;->S0:I

    .line 97
    .line 98
    invoke-virtual {p4, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p4

    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-ge p2, v2, :cond_3

    .line 112
    .line 113
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    check-cast v2, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 118
    .line 119
    if-eqz p2, :cond_2

    .line 120
    .line 121
    const-string v3, "\u3001"

    .line 122
    .line 123
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    :cond_2
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    add-int/lit8 p2, p2, 0x1

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_3
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    invoke-virtual {v1, p0, p2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    const-string p2, "newTags"

    .line 147
    .line 148
    invoke-interface {v4, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-interface {v5, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 159
    .line 160
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->g:Ljava/util/List;

    .line 161
    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->f:Ll/gj40$h;

    .line 163
    .line 164
    iput-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->d:Ljava/util/List;

    .line 165
    .line 166
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->e:Ljava/util/Map;

    .line 167
    .line 168
    return v6

    .line 169
    :cond_4
    :goto_1
    move-object p2, v0

    .line 170
    goto :goto_2

    .line 171
    :cond_5
    const/4 v0, 0x0

    .line 172
    goto :goto_1

    .line 173
    :goto_2
    sget v0, Lcom/p1/mobile/putong/core/R$string;->S0:I

    .line 174
    .line 175
    invoke-virtual {p4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    const-string v3, "sports"

    .line 180
    .line 181
    move-object v0, p0

    .line 182
    invoke-virtual/range {v0 .. v5}, Ll/z7j;->q(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V

    .line 183
    .line 184
    .line 185
    sget p0, Lcom/p1/mobile/putong/core/R$string;->R0:I

    .line 186
    .line 187
    invoke-virtual {p4, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    const-string v3, "places"

    .line 192
    .line 193
    invoke-virtual/range {v0 .. v5}, Ll/z7j;->q(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V

    .line 194
    .line 195
    .line 196
    sget p0, Lcom/p1/mobile/putong/core/R$string;->U0:I

    .line 197
    .line 198
    invoke-virtual {p4, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    const-string v3, "movies"

    .line 203
    .line 204
    invoke-virtual/range {v0 .. v5}, Ll/z7j;->q(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V

    .line 205
    .line 206
    .line 207
    sget p0, Lcom/p1/mobile/putong/core/R$string;->S0:I

    .line 208
    .line 209
    invoke-virtual {p4, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    const-string v3, "literature"

    .line 214
    .line 215
    invoke-virtual/range {v0 .. v5}, Ll/z7j;->q(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V

    .line 216
    .line 217
    .line 218
    sget p0, Lcom/p1/mobile/putong/core/R$string;->S0:I

    .line 219
    .line 220
    invoke-virtual {p4, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    const-string v3, "music"

    .line 225
    .line 226
    invoke-virtual/range {v0 .. v5}, Ll/z7j;->q(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V

    .line 227
    .line 228
    .line 229
    sget p0, Lcom/p1/mobile/putong/core/R$string;->T0:I

    .line 230
    .line 231
    invoke-virtual {p4, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    const-string v3, "food"

    .line 236
    .line 237
    invoke-virtual/range {v0 .. v5}, Ll/z7j;->q(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V

    .line 238
    .line 239
    .line 240
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 241
    .line 242
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->g:Ljava/util/List;

    .line 243
    .line 244
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->f:Ll/gj40$h;

    .line 245
    .line 246
    iput-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->d:Ljava/util/List;

    .line 247
    .line 248
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->e:Ljava/util/Map;

    .line 249
    .line 250
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 251
    .line 252
    .line 253
    move-result p0

    .line 254
    xor-int/2addr p0, v6

    .line 255
    return p0
.end method
