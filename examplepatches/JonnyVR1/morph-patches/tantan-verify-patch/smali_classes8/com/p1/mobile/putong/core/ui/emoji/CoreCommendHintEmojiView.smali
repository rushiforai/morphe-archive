.class public Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;,
        Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Landroid/view/View;

.field public c:Landroidx/recyclerview/widget/RecyclerView;

.field public d:Landroid/widget/RelativeLayout;

.field public e:Lv/VDraweeView;

.field public f:Lv/VImage;

.field public g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

.field public h:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;

.field public i:Landroid/widget/EditText;

.field public j:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z

.field public l:Ljava/lang/String;

.field public m:Z

.field public n:Z

.field public o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public p:Lcom/p1/mobile/putong/data/StickerInfo;

.field public q:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "p_user_moment_interactions_details_view"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->l:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->n:Z

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    const-string p1, "p_user_moment_interactions_details_view"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->l:Ljava/lang/String;

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m:Z

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->n:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    const-string p1, "p_user_moment_interactions_details_view"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->l:Ljava/lang/String;

    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m:Z

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->n:Z

    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->v(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;ZLjava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->x(ZLjava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->u(Lcom/p1/mobile/putong/core/data/Sticker;)V

    return-void
.end method

.method public static synthetic h(Ll/clz;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/clz;->R6(Lcom/p1/mobile/putong/core/data/Sticker;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->w(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m:Z

    return p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->l:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;ZI)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->p(ZI)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;Ljava/util/List;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->B(Ljava/util/List;Z)V

    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->p:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 3
    .line 4
    return-void
.end method

.method public final B(Ljava/util/List;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->n:Z

    .line 6
    .line 7
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_4

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->i:Landroid/widget/EditText;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m:Z

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v2, 0x4

    .line 48
    if-gt v0, v2, :cond_1

    .line 49
    .line 50
    if-eqz p2, :cond_2

    .line 51
    .line 52
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Ljava/lang/CharSequence;

    .line 57
    .line 58
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->q()V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    const/16 v1, 0xa

    .line 79
    .line 80
    if-le v0, v1, :cond_3

    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 90
    .line 91
    invoke-virtual {v1, p1, p2}, Lcom/p1/mobile/putong/core/api/z;->n3(Ljava/util/List;Z)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v1, Ll/po7;

    .line 100
    .line 101
    invoke-direct {v1, p0, p2, p1}, Ll/po7;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;ZLjava/util/List;)V

    .line 102
    .line 103
    .line 104
    new-instance p0, Ll/qo7;

    .line 105
    .line 106
    invoke-direct {p0}, Ll/qo7;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    .line 118
    .line 119
    new-instance p2, Ljava/util/ArrayList;

    .line 120
    .line 121
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->M(Ljava/util/List;)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 128
    .line 129
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->q()V

    .line 133
    .line 134
    .line 135
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->E(Ljava/lang/Boolean;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final C(Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->i:Landroid/widget/EditText;

    .line 20
    .line 21
    const-string v2, ""

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->q()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Sticker;->cloneSticker()Lcom/p1/mobile/putong/data/StickerInfo;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 42
    .line 43
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/z$c;->Q(Lcom/p1/mobile/putong/data/StickerInfo;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v1, Ll/vo7;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/vo7;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const/4 v1, 0x1

    .line 57
    invoke-virtual {p1, v1}, Lrx/c;->take(I)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p1, Ll/wo7;

    .line 66
    .line 67
    invoke-direct {p1, v0}, Ll/wo7;-><init>(Ll/clz;)V

    .line 68
    .line 69
    .line 70
    new-instance v0, Ll/xo7;

    .line 71
    .line 72
    invoke-direct {v0}, Ll/xo7;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    :cond_0
    return-void
.end method

.method public D(Landroid/widget/EditText;ZLl/y20;Z)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/EditText;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->i:Landroid/widget/EditText;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->j:Ll/y20;

    .line 4
    .line 5
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->k:Z

    .line 6
    .line 7
    const/4 p3, 0x1

    .line 8
    const/4 v0, 0x0

    .line 9
    if-eqz p4, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/h39;->Q()Z

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    if-eqz p4, :cond_0

    .line 16
    .line 17
    move p4, p3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move p4, v0

    .line 20
    :goto_0
    iput-boolean p4, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m:Z

    .line 21
    .line 22
    new-instance v1, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    .line 29
    .line 30
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->d:Landroid/widget/RelativeLayout;

    .line 31
    .line 32
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 33
    .line 34
    move-object v2, p0

    .line 35
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;Landroid/widget/RelativeLayout;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 36
    .line 37
    .line 38
    iput-object v1, v2, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->h:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;

    .line 39
    .line 40
    iget-object p0, v2, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->i:Landroid/widget/EditText;

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 43
    .line 44
    .line 45
    iget-boolean p0, v2, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m:Z

    .line 46
    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-eqz p2, :cond_1

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eqz p2, :cond_1

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-nez p2, :cond_1

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-static {p1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {v2, p1, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->B(Ljava/util/List;Z)V

    .line 102
    .line 103
    .line 104
    iput-boolean p3, p0, Ll/clz;->U:Z

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_1
    iget-boolean p1, p0, Ll/clz;->U:Z

    .line 108
    .line 109
    if-nez p1, :cond_2

    .line 110
    .line 111
    invoke-static {}, Ll/h39;->Y()Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->hint_emoji_array:Ljava/util/List;

    .line 116
    .line 117
    const/4 p2, 0x5

    .line 118
    invoke-static {p1, p2}, Ll/g96;->b(Ljava/util/List;I)Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, v2, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o:Ljava/util/List;

    .line 123
    .line 124
    invoke-virtual {v2, p1, v0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->B(Ljava/util/List;Z)V

    .line 125
    .line 126
    .line 127
    iput-boolean p3, p0, Ll/clz;->U:Z

    .line 128
    .line 129
    :cond_2
    :goto_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    iput-object p0, v2, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->l:Ljava/lang/String;

    .line 138
    .line 139
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 140
    .line 141
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->E(Ljava/lang/Boolean;)V

    .line 142
    .line 143
    .line 144
    iget-object p0, v2, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 145
    .line 146
    sget p1, Ll/qa00;->j:I

    .line 147
    .line 148
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 149
    .line 150
    .line 151
    iget-object p0, v2, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 152
    .line 153
    const/high16 p1, 0x41800000    # 16.0f

    .line 154
    .line 155
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    invoke-virtual {p0, p1, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_3
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->E(Ljava/lang/Boolean;)V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public final E(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->b:Landroid/view/View;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x41400000    # 12.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    mul-int/lit8 v0, v0, 0x5

    .line 12
    .line 13
    sub-int/2addr p0, v0

    .line 14
    div-int/lit8 p0, p0, 0x4

    .line 15
    .line 16
    const-string v0, ".png"

    .line 17
    .line 18
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/data/Picture;->aboutWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getSelectStickerInfoOrMedia()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->p:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->p:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->q:Lcom/p1/mobile/putong/data/Media;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->q:Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public final n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bp7;->a(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o()Lcom/p1/mobile/android/app/Act;
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

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->h:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->i:Landroid/widget/EditText;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->i:Landroid/widget/EditText;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->h:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$b;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ResourceAsColor"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->n(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->t(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->f:Lv/VImage;

    .line 15
    .line 16
    new-instance v1, Ll/oo7;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/oo7;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->d:Landroid/widget/RelativeLayout;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->f:Lv/VImage;

    .line 31
    .line 32
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->In(Landroid/widget/RelativeLayout;Lv/VImage;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->e:Lv/VDraweeView;

    .line 40
    .line 41
    const/high16 v1, 0x41200000    # 10.0f

    .line 42
    .line 43
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->R9(Landroid/view/View;F)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final p(ZI)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->i:Landroid/widget/EditText;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->i:Landroid/widget/EditText;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_0

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->i:Landroid/widget/EditText;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o:Ljava/util/List;

    .line 63
    .line 64
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-nez v2, :cond_3

    .line 69
    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    if-ltz p2, :cond_1

    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-le v2, p2, :cond_1

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    check-cast p0, Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_1
    const/4 p2, 0x0

    .line 95
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o:Ljava/util/List;

    .line 96
    .line 97
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-ge p2, v2, :cond_3

    .line 102
    .line 103
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Ljava/lang/String;

    .line 110
    .line 111
    if-nez p2, :cond_2

    .line 112
    .line 113
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_2
    const-string v3, ","

    .line 118
    .line 119
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    :goto_1
    add-int/lit8 p2, p2, 0x1

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_3
    :goto_2
    const-string p0, "topic_content"

    .line 129
    .line 130
    const-string p2, "other_uid"

    .line 131
    .line 132
    const-string v2, "p_chat_view"

    .line 133
    .line 134
    const-string v3, "e_sticker"

    .line 135
    .line 136
    if-eqz p1, :cond_4

    .line 137
    .line 138
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-static {v3, v2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_4
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-static {v3, v2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public final q()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/so7;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/so7;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {p0, v1, v0}, Ll/qzz;->Q1(ZLjava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 3
    .line 4
    .line 5
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->E(Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->d:Landroid/widget/RelativeLayout;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->z()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->A()V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->E(Ljava/lang/Boolean;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->d:Landroid/widget/RelativeLayout;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->j:Ll/y20;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->j:Ll/y20;

    .line 31
    .line 32
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public setHintStickers(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
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
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o:Ljava/util/List;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o:Ljava/util/List;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o:Ljava/util/List;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->B(Ljava/util/List;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final t(Landroid/content/Context;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ll/ro7;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/ro7;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    const/high16 v1, 0x41100000    # 9.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v2, 0x1

    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-virtual {v0, v1, v2, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 33
    .line 34
    invoke-direct {v1, p1, v3, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->C(Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->y(Ljava/lang/Object;Lcom/p1/mobile/putong/data/Media;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic v(Ljava/lang/String;Ljava/util/List;)V
    .locals 4

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->i:Landroid/widget/EditText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->l:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "search_word"

    .line 26
    .line 27
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "gif_recommend_scene"

    .line 32
    .line 33
    const-string v3, "comment"

    .line 34
    .line 35
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "e_gif_recommend"

    .line 44
    .line 45
    invoke-static {v2, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->N(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const/4 p1, -0x1

    .line 54
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->E(Ljava/lang/Boolean;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->a:Landroid/widget/RelativeLayout;

    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 72
    .line 73
    .line 74
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    const/16 v1, 0xa

    .line 79
    .line 80
    if-le p1, v1, :cond_0

    .line 81
    .line 82
    invoke-interface {p2, v0, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    .line 87
    .line 88
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->M(Ljava/util/List;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    return-void
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->s()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->j:Ll/y20;

    .line 5
    .line 6
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->i:Landroid/widget/EditText;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->o()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 34
    .line 35
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/z;->p3(Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/to7;

    .line 44
    .line 45
    invoke-direct {v1, p0, p1}, Ll/to7;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance p0, Ll/uo7;

    .line 49
    .line 50
    invoke-direct {p0}, Ll/uo7;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public final synthetic x(ZLjava/util/List;Ljava/util/List;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_5

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->i:Landroid/widget/EditText;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_3

    .line 29
    .line 30
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 v0, 0x1

    .line 35
    const/4 v1, 0x0

    .line 36
    if-ne p1, v0, :cond_1

    .line 37
    .line 38
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const-string p1, ""

    .line 46
    .line 47
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->l:Ljava/lang/String;

    .line 48
    .line 49
    const-string v2, "search_word"

    .line 50
    .line 51
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const-string v3, "gif_recommend_scene"

    .line 56
    .line 57
    const-string v4, "comment"

    .line 58
    .line 59
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    filled-new-array {v2, v3}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const-string v3, "e_gif_recommend"

    .line 68
    .line 69
    invoke-static {v3, p2, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 73
    .line 74
    .line 75
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    .line 76
    .line 77
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->N(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    const/4 p1, -0x1

    .line 81
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 85
    .line 86
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 90
    .line 91
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->E(Ljava/lang/Boolean;)V

    .line 92
    .line 93
    .line 94
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->a:Landroid/widget/RelativeLayout;

    .line 95
    .line 96
    invoke-virtual {p2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 97
    .line 98
    .line 99
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    const/16 v2, 0xa

    .line 104
    .line 105
    if-le p2, v2, :cond_2

    .line 106
    .line 107
    invoke-interface {p3, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    .line 112
    .line 113
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->M(Ljava/util/List;)V

    .line 114
    .line 115
    .line 116
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m:Z

    .line 117
    .line 118
    if-eqz p2, :cond_4

    .line 119
    .line 120
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->p(ZI)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_3
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->m:Z

    .line 125
    .line 126
    if-eqz p1, :cond_4

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->q()V

    .line 129
    .line 130
    .line 131
    :cond_4
    return-void

    .line 132
    :cond_5
    :goto_1
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 133
    .line 134
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->E(Ljava/lang/Boolean;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public y(Ljava/lang/Object;Lcom/p1/mobile/putong/data/Media;)V
    .locals 3

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/high16 v1, 0x42800000    # 64.0f

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->A()V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->j:Ll/y20;

    .line 22
    .line 23
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->a:Landroid/widget/RelativeLayout;

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 34
    .line 35
    .line 36
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->q:Lcom/p1/mobile/putong/data/Media;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->r()V

    .line 39
    .line 40
    .line 41
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->e:Lv/VDraweeView;

    .line 44
    .line 45
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {p1, p0, p2, v0, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    instance-of p2, p1, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 60
    .line 61
    if-eqz p2, :cond_2

    .line 62
    .line 63
    check-cast p1, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    const/4 p1, 0x0

    .line 67
    :goto_0
    if-nez p1, :cond_3

    .line 68
    .line 69
    :goto_1
    return-void

    .line 70
    :cond_3
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 71
    .line 72
    .line 73
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->j:Ll/y20;

    .line 74
    .line 75
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 76
    .line 77
    invoke-interface {p2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->a:Landroid/widget/RelativeLayout;

    .line 81
    .line 82
    invoke-virtual {p2, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->r()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->z()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Sticker;->cloneSticker()Lcom/p1/mobile/putong/data/StickerInfo;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->p:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 99
    .line 100
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 101
    .line 102
    const-string v0, "shanmeng"

    .line 103
    .line 104
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    if-eqz p2, :cond_4

    .line 109
    .line 110
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->e:Lv/VDraweeView;

    .line 113
    .line 114
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 115
    .line 116
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 121
    .line 122
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    invoke-virtual {p2, p0, p1, v0, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_4
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->e:Lv/VDraweeView;

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 141
    .line 142
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 147
    .line 148
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->F(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p2, v0, p0}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->q:Lcom/p1/mobile/putong/data/Media;

    .line 3
    .line 4
    return-void
.end method
