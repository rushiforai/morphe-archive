.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/k3m;",
        ">",
        "Landroid/widget/LinearLayout;",
        "Ll/iam<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public a:Ll/k3m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;

.field public c:Lorg/apmem/tools/layouts/FlowLayout;

.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/LiveVoiceTopicInputView;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/widget/EditText;

.field public g:Landroid/widget/ImageView;

.field public h:Lv/VText;


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


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;->getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public f(Landroid/view/ViewGroup;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;->b:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Landroid/view/ViewGroup;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/view/ViewGroup;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lorg/apmem/tools/layouts/FlowLayout;

    .line 25
    .line 26
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;->c:Lorg/apmem/tools/layouts/FlowLayout;

    .line 27
    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    const-string v1, "_tag_flow_layout"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v1, 0x0

    .line 34
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Landroid/view/ViewGroup;

    .line 39
    .line 40
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Landroid/view/ViewGroup;

    .line 45
    .line 46
    const/4 v4, 0x2

    .line 47
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/LiveVoiceTopicInputView;

    .line 52
    .line 53
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/LiveVoiceTopicInputView;

    .line 54
    .line 55
    if-nez v3, :cond_1

    .line 56
    .line 57
    const-string v1, "_topic_input"

    .line 58
    .line 59
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Landroid/view/ViewGroup;

    .line 64
    .line 65
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Landroid/view/ViewGroup;

    .line 70
    .line 71
    const/4 v4, 0x4

    .line 72
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Landroid/widget/FrameLayout;

    .line 77
    .line 78
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;->e:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    if-nez v3, :cond_2

    .line 81
    .line 82
    const-string v1, "_edit_layout"

    .line 83
    .line 84
    :cond_2
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Landroid/view/ViewGroup;

    .line 89
    .line 90
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    check-cast v3, Landroid/view/ViewGroup;

    .line 95
    .line 96
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    check-cast v3, Landroid/view/ViewGroup;

    .line 101
    .line 102
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    check-cast v3, Landroid/widget/EditText;

    .line 107
    .line 108
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;->f:Landroid/widget/EditText;

    .line 109
    .line 110
    if-nez v3, :cond_3

    .line 111
    .line 112
    const-string v1, "_edit_topic"

    .line 113
    .line 114
    :cond_3
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    check-cast v3, Landroid/view/ViewGroup;

    .line 119
    .line 120
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Landroid/view/ViewGroup;

    .line 125
    .line 126
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Landroid/view/ViewGroup;

    .line 131
    .line 132
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Landroid/widget/ImageView;

    .line 137
    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;->g:Landroid/widget/ImageView;

    .line 139
    .line 140
    if-nez v0, :cond_4

    .line 141
    .line 142
    const-string v1, "_random_topic"

    .line 143
    .line 144
    :cond_4
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    check-cast p1, Lv/VText;

    .line 149
    .line 150
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;->h:Lv/VText;

    .line 151
    .line 152
    if-nez p1, :cond_5

    .line 153
    .line 154
    const-string v1, "_go"

    .line 155
    .line 156
    :cond_5
    if-nez v1, :cond_6

    .line 157
    .line 158
    return-void

    .line 159
    :cond_6
    const-string p0, "Missing required view with ID:"

    .line 160
    .line 161
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;->b:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/topic/TopicView;

    .line 2
    .line 3
    return-object p0
.end method

.method public i1(Ll/k3m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;->a:Ll/k3m;

    .line 2
    .line 3
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->l7:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    move-object p2, p1

    .line 9
    check-cast p2, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;->f(Landroid/view/ViewGroup;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceTopicDialogViewBindings;->f(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
