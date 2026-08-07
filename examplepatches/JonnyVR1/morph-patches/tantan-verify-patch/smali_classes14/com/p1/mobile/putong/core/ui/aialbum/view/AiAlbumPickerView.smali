.class public Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VRecyclerView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Ll/zf0;

.field public i:Ll/ye0;

.field public j:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->R(Landroid/view/View;)V

    return-void
.end method

.method private synthetic R(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->j:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->action:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "upload"

    .line 6
    .line 7
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->i:Ll/ye0;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/ye0;->i0()V

    .line 16
    .line 17
    .line 18
    const-string p0, "e_intl_ai_photo_generate_btn"

    .line 19
    .line 20
    const-string p1, "p_intl_ai_photo_self_photo"

    .line 21
    .line 22
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->j:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ll/ye0;->b0(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    new-instance v0, Ll/zf0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zf0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->h:Ll/zf0;

    .line 7
    .line 8
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x4

    .line 15
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->e:Lv/VRecyclerView;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->e:Lv/VRecyclerView;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->h:Ll/zf0;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->g:Lv/VText;

    .line 31
    .line 32
    new-instance v1, Ll/bg0;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/bg0;-><init>(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cg0;->a(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;",
            "Ljava/util/List<",
            "Ll/ff0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->j:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->action:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x1

    .line 14
    const/4 v4, -0x1

    .line 15
    sparse-switch v1, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :sswitch_0
    const-string v1, "wait"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v4, 0x2

    .line 29
    goto :goto_0

    .line 30
    :sswitch_1
    const-string v1, "add"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v4, v3

    .line 40
    goto :goto_0

    .line 41
    :sswitch_2
    const-string v1, "upload"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    move v4, v2

    .line 51
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :pswitch_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->g:Lv/VText;

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->g:Lv/VText;

    .line 61
    .line 62
    sget v1, Lcom/p1/mobile/putong/core/R$string;->i9:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :pswitch_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->g:Lv/VText;

    .line 69
    .line 70
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->g:Lv/VText;

    .line 74
    .line 75
    sget v1, Lcom/p1/mobile/putong/core/R$string;->e9:I

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :pswitch_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->g:Lv/VText;

    .line 82
    .line 83
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->g:Lv/VText;

    .line 87
    .line 88
    sget v1, Lcom/p1/mobile/putong/core/R$string;->d9:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 91
    .line 92
    .line 93
    const-string v0, "e_intl_ai_photo_generate_btn"

    .line 94
    .line 95
    const-string v1, "p_intl_ai_photo_self_photo"

    .line 96
    .line 97
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->h:Ll/zf0;

    .line 101
    .line 102
    invoke-virtual {v0, p2}, Ll/zf0;->G(Ljava/util/List;)V

    .line 103
    .line 104
    .line 105
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->f:Lv/VText;

    .line 106
    .line 107
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->bad:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-lez p2, :cond_3

    .line 117
    .line 118
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->f:Lv/VText;

    .line 119
    .line 120
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->f:Lv/VText;

    .line 124
    .line 125
    sget p2, Lcom/p1/mobile/putong/core/R$string;->h9:I

    .line 126
    .line 127
    invoke-static {p2}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->bad:Ljava/util/List;

    .line 132
    .line 133
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    :cond_3
    return-void

    .line 153
    :sswitch_data_0
    .sparse-switch
        -0x31fbf1ff -> :sswitch_2
        0x178a1 -> :sswitch_1
        0x379175 -> :sswitch_0
    .end sparse-switch

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public T(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ff0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->h:Ll/zf0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/zf0;->G(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->g:Lv/VText;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->g:Lv/VText;

    .line 13
    .line 14
    sget p1, Lcom/p1/mobile/putong/core/R$string;->l9:I

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setPresenter(Ll/ye0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->i:Ll/ye0;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->r()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
