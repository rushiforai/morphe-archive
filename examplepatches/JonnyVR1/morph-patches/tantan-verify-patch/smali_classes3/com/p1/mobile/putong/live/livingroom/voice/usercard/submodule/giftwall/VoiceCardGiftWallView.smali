.class public Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/TextView;

.field public d:Landroidx/recyclerview/widget/RecyclerView;

.field public e:Lv/VImage;

.field public f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/tantanapp/media/ttmediautils/download/Action1;Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWallGift;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWallGift;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/Action1;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static g(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    if-ge v2, v1, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    add-int/lit8 v3, v1, -0x1

    .line 30
    .line 31
    if-ge v2, v3, :cond_1

    .line 32
    .line 33
    const-string v3, "\n"

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    :cond_3
    :goto_1
    return-object p0
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e4n0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v0, v0, [Ll/d3q;

    .line 11
    .line 12
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 27
    .line 28
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 38
    .line 39
    new-instance v2, Ll/guf0;

    .line 40
    .line 41
    const/high16 v3, 0x41400000    # 12.0f

    .line 42
    .line 43
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-direct {v2, v3, v1, v1}, Ll/guf0;-><init>(III)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 51
    .line 52
    .line 53
    const/high16 v0, 0x41200000    # 10.0f

    .line 54
    .line 55
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-static {p0, v0}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/x20;Lcom/tantanapp/media/ttmediautils/download/Action1;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;",
            ">;",
            "Ll/x20;",
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->e:Lv/VImage;

    .line 8
    .line 9
    new-instance v2, Ll/b4n0;

    .line 10
    .line 11
    invoke-direct {v2, p3}, Ll/b4n0;-><init>(Ll/x20;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    filled-new-array {p2}, [Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    :cond_0
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->a:Lv/VDraweeView;

    .line 47
    .line 48
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;->bgImage:Ljava/lang/String;

    .line 49
    .line 50
    const-string v4, "context_livingAct"

    .line 51
    .line 52
    invoke-static {v4, v2, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->b:Lv/VDraweeView;

    .line 56
    .line 57
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;->titleBgImage:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v4, v2, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Ll/wft;->c()Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->c:Landroid/widget/TextView;

    .line 67
    .line 68
    if-eqz v2, :cond_1

    .line 69
    .line 70
    const/high16 v2, 0x42b40000    # 90.0f

    .line 71
    .line 72
    invoke-virtual {v3, v2}, Landroid/view/View;->setRotation(F)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->c:Landroid/widget/TextView;

    .line 76
    .line 77
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;->title:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;->title:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v2}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->c:Landroid/widget/TextView;

    .line 93
    .line 94
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;->titleColor:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v3}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 101
    .line 102
    .line 103
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;->gifts:Ljava/util/List;

    .line 104
    .line 105
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-eqz v2, :cond_2

    .line 110
    .line 111
    new-instance v2, Ljava/util/ArrayList;

    .line 112
    .line 113
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;->gifts:Ljava/util/List;

    .line 117
    .line 118
    :cond_2
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;->gifts:Ljava/util/List;

    .line 119
    .line 120
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-ge v1, v2, :cond_4

    .line 125
    .line 126
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWallGift;

    .line 131
    .line 132
    new-instance v3, Ll/a4n0;

    .line 133
    .line 134
    invoke-direct {v3, v2, p1}, Ll/a4n0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWallGift;Lcom/p1/mobile/android/app/Act;)V

    .line 135
    .line 136
    .line 137
    iget-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWallGift;->id:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    if-eqz v4, :cond_3

    .line 144
    .line 145
    new-instance v2, Ll/c4n0;

    .line 146
    .line 147
    invoke-direct {v2, p3}, Ll/c4n0;-><init>(Ll/x20;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3, v2}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_3
    new-instance v4, Ll/d4n0;

    .line 155
    .line 156
    invoke-direct {v4, p4, v2}, Ll/d4n0;-><init>(Lcom/tantanapp/media/ttmediautils/download/Action1;Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWallGift;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v3, v4}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 160
    .line 161
    .line 162
    :goto_2
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    add-int/lit8 v1, v1, 0x1

    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 169
    .line 170
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->f()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
