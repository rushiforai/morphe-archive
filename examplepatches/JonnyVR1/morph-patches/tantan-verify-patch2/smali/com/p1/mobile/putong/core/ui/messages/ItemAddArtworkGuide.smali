.class public Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$a;,
        Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

.field public b:Lv/VText;

.field public c:Lv/VImage;

.field public d:Lv/VPager;

.field public e:Lv/VPagerCircleIndicator;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/data/User;

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;>;"
        }
    .end annotation
.end field

.field public j:Ljava/lang/String;

.field public k:Z

.field public final l:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->k:Z

    .line 7
    .line 8
    invoke-static {}, Ll/bnl0;->y0()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/high16 v0, 0x42d20000    # 105.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    sub-int/2addr p1, v0

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->l:I

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, -0x1

    .line 22
    invoke-direct {p0, p1, p2, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->k:Z

    .line 24
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p1

    const/high16 p2, 0x42d20000    # 105.0f

    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->l:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->k:Z

    .line 27
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p1

    const/high16 p2, 0x42d20000    # 105.0f

    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->l:I

    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->u(Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/Literatures;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;Ll/n100;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->v(Ll/n100;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_chat_close_artwork"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/p;->U:Ll/vxd0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    const-string v0, "local_add_artwork_guide"

    .line 38
    .line 39
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/data/Literatures;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->t(Ll/pf60;)V

    return-void
.end method

.method public static synthetic i(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/p;->w3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance p1, Ll/e1q;

    .line 18
    .line 19
    invoke-direct {p1}, Ll/e1q;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p2, p0, p1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/Literatures;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->l:I

    return p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->g:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->i:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->h:Lcom/p1/mobile/putong/data/User;

    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->j:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 2

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->d:Lv/VPager;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->l:I

    .line 10
    .line 11
    int-to-float p0, p0

    .line 12
    const/high16 v1, 0x40800000    # 4.0f

    .line 13
    .line 14
    mul-float/2addr p0, v1

    .line 15
    const/high16 v1, 0x41100000    # 9.0f

    .line 16
    .line 17
    div-float/2addr p0, v1

    .line 18
    float-to-int p0, p0

    .line 19
    invoke-static {v0, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q1q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final r(Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CoreData;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/p;->X:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    new-instance p0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    new-instance v1, Ll/h1q;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/h1q;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/jyb;->C(Ljava/util/List;Ll/qcj;)Ljava/util/HashMap;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    .line 29
    .line 30
    new-instance v2, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v3, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v4, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    const/4 v6, 0x0

    .line 50
    if-nez v5, :cond_5

    .line 51
    .line 52
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    if-eqz v5, :cond_2

    .line 61
    .line 62
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    check-cast v5, Lcom/p1/mobile/putong/core/data/Literatures;

    .line 67
    .line 68
    new-instance v7, Ll/i1q;

    .line 69
    .line 70
    invoke-direct {v7, v5}, Ll/i1q;-><init>(Lcom/p1/mobile/putong/core/data/Literatures;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v7}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    check-cast v5, Lcom/p1/mobile/putong/core/data/Literatures;

    .line 78
    .line 79
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    if-eqz v7, :cond_1

    .line 84
    .line 85
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_4

    .line 94
    .line 95
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/core/data/Literatures;

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 102
    .line 103
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->j:Ljava/lang/String;

    .line 104
    .line 105
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_6

    .line 114
    .line 115
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Lcom/p1/mobile/putong/core/data/Literatures;

    .line 120
    .line 121
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 122
    .line 123
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->j:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v5, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    if-eqz v5, :cond_3

    .line 130
    .line 131
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    new-instance v5, Ll/j1q;

    .line 135
    .line 136
    invoke-direct {v5, v2}, Ll/j1q;-><init>(Lcom/p1/mobile/putong/core/data/Literatures;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v0, v5}, Ll/jyb;->e0(Ljava/util/List;Ll/qcj;)Z

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_4
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->s(Ljava/util/HashMap;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->j:Ljava/lang/String;

    .line 148
    .line 149
    goto :goto_2

    .line 150
    :cond_5
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->s(Ljava/util/HashMap;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->j:Ljava/lang/String;

    .line 155
    .line 156
    :cond_6
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->j:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    check-cast p0, Ljava/util/List;

    .line 163
    .line 164
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-nez p1, :cond_8

    .line 169
    .line 170
    invoke-static {p0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 171
    .line 172
    .line 173
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-eqz p1, :cond_7

    .line 178
    .line 179
    move-object v3, p0

    .line 180
    goto :goto_3

    .line 181
    :cond_7
    invoke-interface {v3, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 182
    .line 183
    .line 184
    goto :goto_3

    .line 185
    :cond_8
    move-object v3, v4

    .line 186
    :goto_3
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    const/16 p1, 0xf

    .line 191
    .line 192
    if-le p0, p1, :cond_9

    .line 193
    .line 194
    goto :goto_4

    .line 195
    :cond_9
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 196
    .line 197
    .line 198
    move-result p1

    .line 199
    :goto_4
    invoke-interface {v3, v6, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    const/4 p1, 0x3

    .line 204
    invoke-static {p0, p1}, Lcom/google/common/collect/Lists;->p(Ljava/util/List;I)Ljava/util/List;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    return-object p0
.end method

.method public final s(Ljava/util/HashMap;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ljava/lang/String;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, [Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    array-length p1, p0

    .line 19
    int-to-double v2, p1

    .line 20
    mul-double/2addr v0, v2

    .line 21
    double-to-int p1, v0

    .line 22
    aget-object p0, p0, p1

    .line 23
    .line 24
    return-object p0
.end method

.method public final synthetic t(Ll/pf60;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->g:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "local_send_artwork_text"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/g;->dh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->r(Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic v(Ll/n100;Ljava/lang/String;Ljava/util/List;)V
    .locals 3

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->k:Z

    .line 14
    .line 15
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$a;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->d:Lv/VPager;

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->e:Lv/VPagerCircleIndicator;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->d:Lv/VPager;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lv/VPagerCircleIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->e:Lv/VPagerCircleIndicator;

    .line 33
    .line 34
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-eq p3, v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 v0, 0x0

    .line 42
    :goto_0
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->y()V

    .line 46
    .line 47
    .line 48
    const-string p3, "add_artwork_mv_key"

    .line 49
    .line 50
    invoke-virtual {p1, p3}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1, p3}, Ll/n100;->b(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-string p1, "e_chat_close_artwork"

    .line 60
    .line 61
    const-string p3, "p_chat_view"

    .line 62
    .line 63
    invoke-static {p1, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->j:Ljava/lang/String;

    .line 67
    .line 68
    const-string v0, "teleplay"

    .line 69
    .line 70
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    const-string p1, "tv_show"

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->j:Ljava/lang/String;

    .line 80
    .line 81
    :goto_1
    const-string v0, "artwork_type"

    .line 82
    .line 83
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    filled-new-array {p1}, [Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const-string v0, "e_chat_send_artwork"

    .line 92
    .line 93
    invoke-static {v0, p3, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->c:Lv/VImage;

    .line 97
    .line 98
    new-instance p1, Ll/k1q;

    .line 99
    .line 100
    invoke-direct {p1, p2}, Ll/k1q;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    :cond_3
    return-void
.end method

.method public final w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    iput-object p2, v2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 6
    .line 7
    const-string p2, "literature"

    .line 8
    .line 9
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageReference;->new_()Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 20
    .line 21
    iput-object p3, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->f:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    const/4 v5, 0x0

    .line 33
    const/4 v3, 0x0

    .line 34
    move-object v1, p1

    .line 35
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->Fn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;ZZ)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v0, Ll/l1q;

    .line 40
    .line 41
    invoke-direct {v0, p3, p4}, Ll/l1q;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance p2, Ll/m1q;

    .line 53
    .line 54
    invoke-direct {p2, p0}, Ll/m1q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)V

    .line 55
    .line 56
    .line 57
    new-instance p0, Ll/n1q;

    .line 58
    .line 59
    invoke-direct {p0}, Ll/n1q;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public x(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/n100;Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->g:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->h:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->k:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ll/dkb;->i7(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    new-instance v0, Ll/d1q;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/d1q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance p2, Ll/f1q;

    .line 36
    .line 37
    invoke-direct {p2, p0, p3, p4}, Ll/f1q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;Ll/n100;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    new-instance p0, Ll/g1q;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/g1q;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final y()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch v1, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_0
    const-string v1, "movie"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v2, 0x2

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string v1, "book"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v2, 0x1

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string v1, "teleplay"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v2, 0x0

    .line 47
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 48
    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    goto :goto_1

    .line 52
    :pswitch_0
    const-string v0, "\u9009\u62e9\u559c\u6b22\u7684\u7535\u5f71\uff0c\u53d1\u7ed9%s\u804a\u804a\u5427"

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :pswitch_1
    const-string v0, "\u9009\u62e9\u559c\u6b22\u7684\u4e66\uff0c\u53d1\u7ed9%s\u804a\u804a\u5427"

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :pswitch_2
    const-string v0, "\u9009\u62e9\u5728\u8ffd\u7684\u5267\uff0c\u53d1\u7ed9%s\u804a\u804a\u5427"

    .line 59
    .line 60
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->b:Lv/VText;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->h:Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_3

    .line 69
    .line 70
    const-string p0, "\u5979"

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_3
    const-string p0, "\u4ed6"

    .line 74
    .line 75
    :goto_2
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :sswitch_data_0
    .sparse-switch
        -0x51131622 -> :sswitch_2
        0x2e3ae9 -> :sswitch_1
        0x6343f30 -> :sswitch_0
    .end sparse-switch

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
