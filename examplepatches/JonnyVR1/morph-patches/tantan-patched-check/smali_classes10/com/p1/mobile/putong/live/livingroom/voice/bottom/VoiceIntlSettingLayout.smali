.class public Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;
.super Lcom/p1/mobile/putong/live/base/view/MaximumScroll;
.source "SourceFile"


# instance fields
.field public g:Lv/VLinear;

.field public h:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/ic3<",
            "*>;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/view/MaximumScroll;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->h:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/view/MaximumScroll;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->h:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/view/MaximumScroll;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->h:Ljava/util/Map;

    return-void
.end method

.method public static synthetic e(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->id:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ll/ic3;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ic3;->I()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->category:I

    .line 15
    .line 16
    if-ne p1, p0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    :cond_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bon0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(Ljava/util/List;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->h:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/String;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->h:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ljava/util/List;

    .line 30
    .line 31
    new-instance v3, Lv/VText;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-direct {v3, v4}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    const/4 v4, 0x2

    .line 41
    const/high16 v5, 0x41700000    # 15.0f

    .line 42
    .line 43
    invoke-virtual {v3, v4, v5}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    sget v5, Ll/n9c0;->m1:I

    .line 51
    .line 52
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const/4 v4, 0x1

    .line 67
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 68
    .line 69
    .line 70
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 71
    .line 72
    const/4 v4, -0x2

    .line 73
    invoke-direct {v1, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 74
    .line 75
    .line 76
    sget v4, Ll/qa00;->h:I

    .line 77
    .line 78
    iput v4, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 79
    .line 80
    const/high16 v4, 0x41900000    # 18.0f

    .line 81
    .line 82
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    iput v4, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 87
    .line 88
    new-instance v4, Lv/VRecyclerView;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    invoke-direct {v4, v5}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 95
    .line 96
    .line 97
    new-instance v5, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 98
    .line 99
    invoke-direct {v5}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 100
    .line 101
    .line 102
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 103
    .line 104
    const/4 v7, -0x1

    .line 105
    sget v8, Ll/bnl0;->f:I

    .line 106
    .line 107
    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 108
    .line 109
    .line 110
    new-instance v7, Ll/aon0;

    .line 111
    .line 112
    invoke-direct {v7, v2}, Ll/aon0;-><init>(Ljava/util/List;)V

    .line 113
    .line 114
    .line 115
    invoke-static {p1, v7}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v7

    .line 119
    check-cast v7, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;

    .line 120
    .line 121
    iget v7, v7, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->viewType:I

    .line 122
    .line 123
    if-nez v7, :cond_0

    .line 124
    .line 125
    const/high16 v7, 0x40c00000    # 6.0f

    .line 126
    .line 127
    invoke-static {v7}, Ll/bnl0;->w(F)I

    .line 128
    .line 129
    .line 130
    move-result v7

    .line 131
    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 132
    .line 133
    new-instance v8, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout$a;

    .line 134
    .line 135
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 136
    .line 137
    .line 138
    move-result-object v10

    .line 139
    const/4 v12, 0x1

    .line 140
    const/4 v13, 0x0

    .line 141
    const/4 v11, 0x4

    .line 142
    move-object v9, p0

    .line 143
    invoke-direct/range {v8 .. v13}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;Landroid/content/Context;IIZ)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v4, v8}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 147
    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_0
    move-object v9, p0

    .line 151
    const/high16 p0, 0x41400000    # 12.0f

    .line 152
    .line 153
    invoke-static {p0}, Ll/bnl0;->w(F)I

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    iput p0, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 158
    .line 159
    new-instance p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 160
    .line 161
    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 162
    .line 163
    .line 164
    move-result-object v7

    .line 165
    const/4 v8, 0x0

    .line 166
    invoke-direct {p0, v7, v8, v8}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v4, p0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 170
    .line 171
    .line 172
    :goto_1
    iget-object p0, v9, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->g:Lv/VLinear;

    .line 173
    .line 174
    invoke-virtual {p0, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    .line 176
    .line 177
    iget-object p0, v9, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->g:Lv/VLinear;

    .line 178
    .line 179
    invoke-virtual {p0, v4, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v5, v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 186
    .line 187
    .line 188
    move-object p0, v9

    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :cond_1
    return-void
.end method

.method public h(Ljava/util/Map;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/ic3<",
            "*>;>;>;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->h:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->g:Lv/VLinear;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ljava/lang/String;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->h:Ljava/util/Map;

    .line 43
    .line 44
    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->h:Ljava/util/Map;

    .line 51
    .line 52
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Ljava/util/Collection;

    .line 63
    .line 64
    invoke-interface {v2, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    check-cast v3, Ljava/util/Collection;

    .line 78
    .line 79
    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 80
    .line 81
    .line 82
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->h:Ljava/util/Map;

    .line 83
    .line 84
    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->h:Ljava/util/Map;

    .line 89
    .line 90
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_3

    .line 95
    .line 96
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->g(Ljava/util/List;)V

    .line 97
    .line 98
    .line 99
    :cond_3
    :goto_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
