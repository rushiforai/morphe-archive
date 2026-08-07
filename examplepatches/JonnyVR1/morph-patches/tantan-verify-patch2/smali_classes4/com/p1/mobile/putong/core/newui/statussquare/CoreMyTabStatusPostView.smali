.class public Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;

.field public b:Lv/VFrame;

.field public c:Lv/VDraweeView;

.field public d:Lv/VFrame;

.field public e:Lv/VDraweeView;

.field public f:Lv/VFrame;

.field public g:Lv/VDraweeView;

.field public h:Lcom/p1/mobile/putong/core/data/StateQuestion;

.field public i:Ll/kcg0;

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/e3i;->c()Ll/e3i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/e3i;->h()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->i(Ll/uxj0;)V

    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/m3a;->a(Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g()Lcom/p1/mobile/android/app/Act;
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

.method public h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->j:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->j:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic i(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->q(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->h:Lcom/p1/mobile/putong/core/data/StateQuestion;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/data/StateOption;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->m(Lcom/p1/mobile/putong/core/data/StateOption;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->q(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->h:Lcom/p1/mobile/putong/core/data/StateQuestion;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/data/StateOption;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->m(Lcom/p1/mobile/putong/core/data/StateOption;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p1, 0x2

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->q(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->h:Lcom/p1/mobile/putong/core/data/StateQuestion;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/data/StateOption;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->m(Lcom/p1/mobile/putong/core/data/StateOption;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/core/data/StateOption;)V
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/StateOption;->defaultContent:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StateOption;->stateEmotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/16 v2, 0x3c

    .line 21
    .line 22
    if-le v1, v2, :cond_0

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :cond_0
    iput-object p0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 32
    .line 33
    new-instance p0, Lcom/p1/mobile/putong/data/TextTheme;

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/TextTheme;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 45
    .line 46
    iput-object p0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p1, "p_navigation_view"

    .line 53
    .line 54
    invoke-interface {p0, v0, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->U6(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public n()V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/StateQuestion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ti(Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/data/StateQuestion;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->h:Lcom/p1/mobile/putong/core/data/StateQuestion;

    .line 14
    .line 15
    if-eqz v0, :cond_7

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto/16 :goto_1

    .line 26
    .line 27
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->h:Lcom/p1/mobile/putong/core/data/StateQuestion;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lcom/p1/mobile/putong/core/data/StateOption;

    .line 51
    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/StateOption;->stateEmotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 55
    .line 56
    if-eqz v3, :cond_1

    .line 57
    .line 58
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_2

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_4

    .line 76
    .line 77
    goto/16 :goto_1

    .line 78
    .line 79
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->h:Lcom/p1/mobile/putong/core/data/StateQuestion;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StateQuestion;->question:Ljava/lang/String;

    .line 82
    .line 83
    const-string v2, "question"

    .line 84
    .line 85
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    filled-new-array {v1}, [Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const-string v2, "e_fast_state_post"

    .line 94
    .line 95
    const-string v3, "p_navigation_view"

    .line 96
    .line 97
    invoke-static {v2, v3, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->b:Lv/VFrame;

    .line 101
    .line 102
    const/4 v2, 0x0

    .line 103
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->d:Lv/VFrame;

    .line 107
    .line 108
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->f:Lv/VFrame;

    .line 112
    .line 113
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    const/4 v3, 0x1

    .line 121
    if-lt v1, v3, :cond_5

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->b:Lv/VFrame;

    .line 124
    .line 125
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 129
    .line 130
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->c:Lv/VDraweeView;

    .line 131
    .line 132
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    check-cast v2, Lcom/p1/mobile/putong/core/data/StateOption;

    .line 137
    .line 138
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StateOption;->stateEmotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 139
    .line 140
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 141
    .line 142
    sget v5, Ll/qa00;->q:I

    .line 143
    .line 144
    invoke-virtual {v1, v4, v2, v5, v5}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 145
    .line 146
    .line 147
    :cond_5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    const/4 v2, 0x2

    .line 152
    if-lt v1, v2, :cond_6

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->d:Lv/VFrame;

    .line 155
    .line 156
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 160
    .line 161
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->e:Lv/VDraweeView;

    .line 162
    .line 163
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    check-cast v5, Lcom/p1/mobile/putong/core/data/StateOption;

    .line 168
    .line 169
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/StateOption;->stateEmotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 170
    .line 171
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 172
    .line 173
    sget v6, Ll/qa00;->q:I

    .line 174
    .line 175
    invoke-virtual {v1, v4, v5, v6, v6}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 176
    .line 177
    .line 178
    :cond_6
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    const/4 v4, 0x3

    .line 183
    if-lt v1, v4, :cond_7

    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->f:Lv/VFrame;

    .line 186
    .line 187
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 188
    .line 189
    .line 190
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 191
    .line 192
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->g:Lv/VDraweeView;

    .line 193
    .line 194
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    check-cast v0, Lcom/p1/mobile/putong/core/data/StateOption;

    .line 199
    .line 200
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StateOption;->stateEmotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 201
    .line 202
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 203
    .line 204
    sget v2, Ll/qa00;->q:I

    .line 205
    .line 206
    invoke-virtual {v1, p0, v0, v2, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 207
    .line 208
    .line 209
    :cond_7
    :goto_1
    return-void
.end method

.method public o()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->b:Lv/VFrame;

    .line 2
    .line 3
    sget v1, Ll/dbc0;->kq:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->d:Lv/VFrame;

    .line 9
    .line 10
    sget v1, Ll/dbc0;->kq:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->f:Lv/VFrame;

    .line 16
    .line 17
    sget v0, Ll/dbc0;->kq:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->i:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->g()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->a6()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/h3a;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/h3a;-><init>(Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->i:Ll/kcg0;

    .line 47
    .line 48
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->i:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->b:Lv/VFrame;

    .line 8
    .line 9
    new-instance v1, Ll/i3a;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/i3a;-><init>(Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->d:Lv/VFrame;

    .line 18
    .line 19
    new-instance v1, Ll/j3a;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/j3a;-><init>(Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->f:Lv/VFrame;

    .line 28
    .line 29
    new-instance v1, Ll/k3a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/k3a;-><init>(Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public p()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->h:Lcom/p1/mobile/putong/core/data/StateQuestion;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StateQuestion;->question:Ljava/lang/String;

    .line 9
    .line 10
    :goto_0
    invoke-static {}, Ll/e3i;->c()Ll/e3i;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/e3i;->a()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_3

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_3

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->b:Lv/VFrame;

    .line 27
    .line 28
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    goto/16 :goto_2

    .line 35
    .line 36
    :cond_1
    new-instance v1, Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->g()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-direct {v1, v2}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    sget v3, Ll/bnl0;->e:I

    .line 48
    .line 49
    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    const/high16 v0, 0x41500000    # 13.0f

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 61
    .line 62
    .line 63
    const/high16 v0, 0x41200000    # 10.0f

    .line 64
    .line 65
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    const/high16 v3, 0x41400000    # 12.0f

    .line 70
    .line 71
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const/high16 v4, 0x41300000    # 11.0f

    .line 80
    .line 81
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    invoke-virtual {v1, v2, v3, v0, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 86
    .line 87
    .line 88
    const/4 v0, -0x1

    .line 89
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const/4 v2, 0x1

    .line 97
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 98
    .line 99
    .line 100
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->g()Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-direct {v0, v3}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->g()Lcom/p1/mobile/android/app/Act;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-static {}, Ll/gra;->L3()Z

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    if-eqz v3, :cond_2

    .line 130
    .line 131
    sget v3, Ll/c9c0;->A:I

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_2
    sget v3, Ll/c9c0;->I:I

    .line 135
    .line 136
    :goto_1
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    filled-new-array {v1}, [I

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    const-wide/16 v3, 0x1388

    .line 149
    .line 150
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    new-instance v1, Ll/l3a;

    .line 165
    .line 166
    invoke-direct {v1}, Ll/l3a;-><init>()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->N(Lcom/p1/mobile/android/ui/bubble/a$d;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    const/high16 v1, 0x40e00000    # 7.0f

    .line 174
    .line 175
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    neg-int v1, v1

    .line 180
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->b:Lv/VFrame;

    .line 189
    .line 190
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->j:Ljava/lang/String;

    .line 195
    .line 196
    :cond_3
    :goto_2
    return-void
.end method

.method public final q(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->h:Lcom/p1/mobile/putong/core/data/StateQuestion;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StateQuestion;->question:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "question"

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->h:Lcom/p1/mobile/putong/core/data/StateQuestion;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/core/data/StateOption;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StateOption;->stateEmotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 24
    .line 25
    const-string p1, "state_id"

    .line 26
    .line 27
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "e_set_my_state_post"

    .line 36
    .line 37
    const-string v0, "p_navigation_view"

    .line 38
    .line 39
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
