.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VImage;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/core/data/Conversation;

.field public m:Lcom/p1/mobile/putong/data/User;

.field public n:Landroid/os/Parcelable;

.field public o:Ll/w30;

.field public p:Ljava/lang/Long;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->p:Ljava/lang/Long;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 p1, 0x0

    .line 14
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->p:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, 0x0

    .line 16
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->p:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const-wide/16 p1, 0x0

    .line 18
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->p:Ljava/lang/Long;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->j(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->g(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->i(Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method private getSubContentText()Ljava/lang/String;
    .locals 5

    const-string v0, ""

    return-object v0

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_6

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 22
    .line 23
    iget v1, v1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    const/16 v0, 0x1388

    .line 28
    .line 29
    if-ge v1, v0, :cond_1

    .line 30
    .line 31
    const/16 v0, 0x64

    .line 32
    .line 33
    if-lt v1, v0, :cond_1

    .line 34
    .line 35
    const/16 p0, 0x3e8

    .line 36
    .line 37
    if-ge v1, p0, :cond_0

    .line 38
    .line 39
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v0, "\u79bb\u4f60%sm"

    .line 48
    .line 49
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_0
    int-to-float p0, v1

    .line 55
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 56
    .line 57
    div-float/2addr p0, v0

    .line 58
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v0, "\u79bb\u4f60%skm"

    .line 67
    .line 68
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 74
    .line 75
    .line 76
    move-result-wide v0

    .line 77
    long-to-double v0, v0

    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 81
    .line 82
    iget-wide v3, v3, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 83
    .line 84
    sub-double/2addr v0, v3

    .line 85
    double-to-long v0, v0

    .line 86
    const-wide/32 v3, 0xea60

    .line 87
    .line 88
    .line 89
    div-long/2addr v0, v3

    .line 90
    const-wide/16 v3, 0xb4

    .line 91
    .line 92
    cmp-long v3, v0, v3

    .line 93
    .line 94
    if-gtz v3, :cond_4

    .line 95
    .line 96
    const-wide/16 v2, 0x5

    .line 97
    .line 98
    cmp-long p0, v0, v2

    .line 99
    .line 100
    if-gtz p0, :cond_2

    .line 101
    .line 102
    const-string p0, "\u5f53\u524d\u5728\u7ebf"

    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_2
    const-wide/16 v2, 0x3c

    .line 106
    .line 107
    cmp-long p0, v0, v2

    .line 108
    .line 109
    if-gtz p0, :cond_3

    .line 110
    .line 111
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    const-string v0, "%s\u5206\u949f\u524d\u6d3b\u8dc3"

    .line 120
    .line 121
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    return-object p0

    .line 126
    :cond_3
    div-long/2addr v0, v2

    .line 127
    long-to-int p0, v0

    .line 128
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    const-string v0, "%s\u5c0f\u65f6\u524d\u6d3b\u8dc3"

    .line 137
    .line 138
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    return-object p0

    .line 143
    :cond_4
    sget-object v0, Ll/f760;->Companion:Ll/f760$a;

    .line 144
    .line 145
    iget-object v1, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Ll/f760$a;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    if-nez v2, :cond_5

    .line 156
    .line 157
    return-object v1

    .line 158
    :cond_5
    new-instance v1, Ljava/util/ArrayList;

    .line 159
    .line 160
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 161
    .line 162
    .line 163
    const-string v2, "\u559c\u6b22\u4f60\u4e86\u2764\ufe0f"

    .line 164
    .line 165
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    const-string v2, "\u7b49\u4f60\u56de\u5e94"

    .line 169
    .line 170
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    const-string v2, "\u5411\u4f60\u8868\u767d\u5566"

    .line 174
    .line 175
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    new-instance v2, Ljava/util/Random;

    .line 179
    .line 180
    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 181
    .line 182
    .line 183
    const/4 v3, 0x3

    .line 184
    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    if-ge v2, v3, :cond_6

    .line 193
    .line 194
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    check-cast v3, Ljava/lang/String;

    .line 199
    .line 200
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

    .line 201
    .line 202
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v0, v3, p0}, Ll/f760$a;->p(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    check-cast p0, Ljava/lang/String;

    .line 212
    .line 213
    return-object p0

    .line 214
    :cond_6
    const-string p0, ""

    .line 215
    .line 216
    return-object p0
.end method

.method private setClickListener(Ll/pol;)V
    .locals 0

    .line 1
    new-instance p1, Ll/ib6;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/ib6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ll/jb6;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ll/jb6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mb6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic g(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->d:Lv/VImage;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->e:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->k:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Ll/f760;->Companion:Ll/f760$a;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p1, v0}, Ll/f760$a;->o(Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->l:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Qr()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    const-string v3, "p_message,locked_match"

    .line 45
    .line 46
    invoke-virtual {p1, v0, v1, v3, v2}, Ll/f760$a;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    const-string p1, "other_user_id"

    .line 62
    .line 63
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    sget-object p1, Ll/for;->INSTANCE:Ll/for;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/for;->b()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_0

    .line 74
    .line 75
    const-string p1, "seetrial"

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    const-string p1, "showhelike"

    .line 79
    .line 80
    :goto_0
    const-string v0, "cell_type"

    .line 81
    .line 82
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string p1, "e_locked_match"

    .line 91
    .line 92
    const-string v0, "p_messages_view"

    .line 93
    .line 94
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->o:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    sget-object p1, Ll/f760;->Companion:Ll/f760$a;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->l:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Ll/f760$a;->b(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->T1:Ll/hva;

    .line 13
    .line 14
    const-string p2, ""

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Ll/hva;->H3(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->o:Ll/w30;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->s(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/w30$b;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {p1, v0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

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
    const-string v1, "\u5220\u9664"

    .line 23
    .line 24
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    sget v2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p1, v1}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v1, Ll/kb6;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/kb6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v1}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance v0, Ll/lb6;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/lb6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Ll/w30$b;->F()Ll/w30;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->o:Ll/w30;

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 74
    .line 75
    .line 76
    const/4 p0, 0x0

    .line 77
    return p0
.end method

.method public k(Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    return-void

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->l:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v0, p2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->q()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->setClickListener(Ll/pol;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->r()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final l()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->h:Lv/VText;

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->h:Lv/VText;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final m()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->b:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->p0(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final n()V
    .locals 7

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-double v0, v0

    .line 6
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->l:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 7
    .line 8
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 9
    .line 10
    sub-double/2addr v0, v2

    .line 11
    const-wide v2, 0x40ed4c0000000000L    # 60000.0

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    div-double/2addr v0, v2

    .line 17
    double-to-long v0, v0

    .line 18
    const-wide/16 v2, 0x1

    .line 19
    .line 20
    cmp-long v2, v0, v2

    .line 21
    .line 22
    if-gtz v2, :cond_0

    .line 23
    .line 24
    const-string v0, "\u521a\u521a"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-wide/16 v2, 0x3c

    .line 28
    .line 29
    cmp-long v4, v0, v2

    .line 30
    .line 31
    if-gtz v4, :cond_1

    .line 32
    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v0, "\u5206\u949f\u524d"

    .line 42
    .line 43
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const-wide/16 v4, 0x168

    .line 52
    .line 53
    cmp-long v4, v0, v4

    .line 54
    .line 55
    if-gtz v4, :cond_2

    .line 56
    .line 57
    new-instance v4, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    div-long/2addr v0, v2

    .line 63
    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v0, "\u5c0f\u65f6\u524d"

    .line 67
    .line 68
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    goto :goto_0

    .line 76
    :cond_2
    const-wide/16 v4, 0xb40

    .line 77
    .line 78
    cmp-long v4, v0, v4

    .line 79
    .line 80
    if-gtz v4, :cond_3

    .line 81
    .line 82
    const-string v0, "\u6700\u8fd1"

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    const-wide/16 v4, 0x2760

    .line 86
    .line 87
    cmp-long v4, v0, v4

    .line 88
    .line 89
    if-gez v4, :cond_4

    .line 90
    .line 91
    new-instance v4, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    const-wide/16 v5, 0x18

    .line 97
    .line 98
    div-long/2addr v0, v5

    .line 99
    div-long/2addr v0, v2

    .line 100
    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v0, "\u5929\u524d"

    .line 104
    .line 105
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    goto :goto_0

    .line 113
    :cond_4
    const/4 v0, 0x0

    .line 114
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->j:Landroid/widget/TextView;

    .line 115
    .line 116
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public final o()V
    .locals 5

    return-void

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->T1:Ll/hva;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/hva;->z3()Ll/wyd0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/String;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->getSubContentText()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "%s \u00b7 %s"

    .line 24
    .line 25
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 30
    .line 31
    invoke-direct {v2, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget v3, Ll/c9c0;->I:I

    .line 43
    .line 44
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-static {}, Ll/gra;->z()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_0

    .line 53
    .line 54
    const-string v1, "#FF700A"

    .line 55
    .line 56
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    :cond_0
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    .line 61
    .line 62
    invoke-direct {v3, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-static {}, Ll/gra;->z()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    const/4 v4, 0x0

    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    move v1, v4

    .line 77
    goto :goto_0

    .line 78
    :cond_1
    const/4 v1, 0x2

    .line 79
    :goto_0
    add-int/2addr v0, v1

    .line 80
    const/16 v1, 0x21

    .line 81
    .line 82
    invoke-virtual {v2, v3, v4, v0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->i:Lv/VText;

    .line 86
    .line 87
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public onFinishInflate()V
    .locals 7

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget v0, Ll/sj6;->R:I

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    sget v0, Ll/sj6;->Q:I

    .line 19
    .line 20
    sget v1, Ll/qa00;->j:I

    .line 21
    .line 22
    mul-int/lit8 v2, v1, 0x2

    .line 23
    .line 24
    add-int/2addr v2, v0

    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->a:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    const/4 v4, 0x1

    .line 28
    new-array v5, v4, [Landroid/view/View;

    .line 29
    .line 30
    const/4 v6, 0x0

    .line 31
    aput-object v3, v5, v6

    .line 32
    .line 33
    invoke-static {v2, v5}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->a:Landroid/widget/FrameLayout;

    .line 37
    .line 38
    add-int/2addr v1, v0

    .line 39
    invoke-static {v2, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 40
    .line 41
    .line 42
    const/high16 v1, 0x41300000    # 11.0f

    .line 43
    .line 44
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    add-int/2addr v1, v0

    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->b:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 50
    .line 51
    new-array v3, v4, [Landroid/view/View;

    .line 52
    .line 53
    aput-object v2, v3, v6

    .line 54
    .line 55
    invoke-static {v1, v3}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->b:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->d:Lv/VDraweeView;

    .line 61
    .line 62
    new-array v2, v4, [Landroid/view/View;

    .line 63
    .line 64
    aput-object v1, v2, v6

    .line 65
    .line 66
    invoke-static {v0, v2}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->h:Lv/VText;

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->j:Landroid/widget/TextView;

    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/ue6;->k0(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->i:Lv/VText;

    .line 77
    .line 78
    invoke-static {p0}, Ll/ue6;->e0(Landroid/widget/TextView;)V

    .line 79
    .line 80
    .line 81
    :cond_0
    return-void
.end method

.method public final p()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->d:Lv/VImage;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->e:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->k:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/rs9;->g()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->e:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    sget-object v0, Ll/f760;->Companion:Ll/f760$a;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/f760$a;->e()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v1, v2

    .line 37
    :goto_0
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->d:Lv/VImage;

    .line 42
    .line 43
    sget-object v0, Ll/f760;->Companion:Ll/f760$a;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/f760$a;->e()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    move v1, v2

    .line 53
    :goto_1
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->p()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->l()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->o()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->n()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final r()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->p:Ljava/lang/Long;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    sub-long/2addr v0, v2

    .line 12
    const-wide/16 v2, 0x12c

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->p:Ljava/lang/Long;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->m:Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    const-string v0, "other_user_id"

    .line 42
    .line 43
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    filled-new-array {p0}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v0, "e_locked_match"

    .line 52
    .line 53
    const-string v1, "p_messages_view"

    .line 54
    .line 55
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    :goto_0
    return-void
.end method

.method public final s(Landroid/content/Context;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-string v0, "vibrator"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/os/Vibrator;

    .line 11
    .line 12
    if-eqz p1, :cond_3

    .line 13
    .line 14
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 15
    .line 16
    const/16 v1, 0x1a

    .line 17
    .line 18
    const-wide/16 v2, 0x1e

    .line 19
    .line 20
    if-lt v0, v1, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->n:Landroid/os/Parcelable;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    const/16 v0, 0x96

    .line 27
    .line 28
    invoke-static {v2, v3, v0}, Ll/cm3;->a(JI)Landroid/os/VibrationEffect;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->n:Landroid/os/Parcelable;

    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->n:Landroid/os/Parcelable;

    .line 35
    .line 36
    invoke-static {v0}, Ll/qa6;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;->n:Landroid/os/Parcelable;

    .line 43
    .line 44
    invoke-static {p0}, Ll/ra6;->a(Ljava/lang/Object;)Landroid/os/VibrationEffect;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p1, p0}, Ll/dm3;->a(Landroid/os/Vibrator;Landroid/os/VibrationEffect;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-virtual {p1, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 53
    .line 54
    .line 55
    :cond_3
    :goto_0
    return-void
.end method
