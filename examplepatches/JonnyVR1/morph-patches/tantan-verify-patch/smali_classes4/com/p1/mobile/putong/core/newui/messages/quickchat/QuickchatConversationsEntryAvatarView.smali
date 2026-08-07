.class public Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/kcg0;

.field public final d:[F

.field public e:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 17
    .line 18
    const/4 p1, 0x3

    .line 19
    new-array p1, p1, [F

    .line 20
    .line 21
    fill-array-data p1, :array_0

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->d:[F

    .line 25
    .line 26
    return-void

    .line 27
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 27
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->a:Ljava/util/List;

    .line 29
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    const/4 p1, 0x3

    .line 30
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->d:[F

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->a:Ljava/util/List;

    .line 33
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    const/4 p1, 0x3

    .line 34
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->d:[F

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->c:Ll/kcg0;

    .line 6
    .line 7
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->e:Landroid/animation/Animator;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->e:Landroid/animation/Animator;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->e:Landroid/animation/Animator;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;

    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->d:[F

    .line 60
    .line 61
    aget v0, v2, v0

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 67
    .line 68
    const/4 v1, 0x1

    .line 69
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;

    .line 74
    .line 75
    sget v2, Ll/qa00;->j:I

    .line 76
    .line 77
    int-to-float v3, v2

    .line 78
    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;

    .line 88
    .line 89
    neg-int v2, v2

    .line 90
    int-to-float v2, v2

    .line 91
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;

    .line 101
    .line 102
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->d:[F

    .line 103
    .line 104
    aget v1, v2, v1

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 110
    .line 111
    const/4 v1, 0x2

    .line 112
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;

    .line 117
    .line 118
    sget v2, Ll/qa00;->m:I

    .line 119
    .line 120
    int-to-float v3, v2

    .line 121
    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 125
    .line 126
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;

    .line 131
    .line 132
    neg-int v2, v2

    .line 133
    int-to-float v2, v2

    .line 134
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 138
    .line 139
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;

    .line 144
    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->d:[F

    .line 146
    .line 147
    aget p0, p0, v1

    .line 148
    .line 149
    invoke-virtual {v0, p0}, Landroid/view/View;->setAlpha(F)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->c:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->e:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->e:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 10
    .line 11
    sget v1, Ll/adc0;->Z1:I

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 23
    .line 24
    sget v1, Ll/adc0;->a2:I

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;

    .line 31
    .line 32
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->b:Ljava/util/List;

    .line 36
    .line 37
    sget v1, Ll/adc0;->b2:I

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatEntryAvatarBorderView;

    .line 44
    .line 45
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/quickchat/QuickchatConversationsEntryAvatarView;->a()V

    .line 49
    .line 50
    .line 51
    return-void
.end method
