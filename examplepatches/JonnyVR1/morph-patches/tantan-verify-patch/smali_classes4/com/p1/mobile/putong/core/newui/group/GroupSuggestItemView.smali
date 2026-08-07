.class public Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;

.field public b:Lv/VLinear;

.field public c:Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;

.field public d:Lv/VLinear;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/core/newui/group/ChatGroupTags;

.field public h:Lv/VButton;

.field public i:Lcom/p1/mobile/putong/core/data/ChatGroup;


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

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->i(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->h(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->g(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lpk;->a(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Lcom/p1/mobile/android/app/Act;
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

.method public final f(Ljava/util/List;IZ)Landroid/text/SpannableStringBuilder;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupTag;",
            ">;IZ)",
            "Landroid/text/SpannableStringBuilder;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v2, Ljava/util/ArrayList;

    .line 9
    .line 10
    move-object/from16 v3, p1

    .line 11
    .line 12
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 13
    .line 14
    .line 15
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->i:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 16
    .line 17
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 18
    .line 19
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->name:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    const/4 v4, 0x0

    .line 26
    if-nez v3, :cond_0

    .line 27
    .line 28
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->i:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 29
    .line 30
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 31
    .line 32
    iget-boolean v3, v3, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->hidden:Z

    .line 33
    .line 34
    if-nez v3, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupTag;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->i:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->name:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v0, v3, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->name:Ljava/lang/String;

    .line 47
    .line 48
    invoke-interface {v2, v4, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_2

    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatGroupTag;

    .line 66
    .line 67
    if-eqz p3, :cond_1

    .line 68
    .line 69
    const-string v3, "1"

    .line 70
    .line 71
    invoke-virtual {v1, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 72
    .line 73
    .line 74
    new-instance v5, Ll/zu4;

    .line 75
    .line 76
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 77
    .line 78
    iget-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->name:Ljava/lang/String;

    .line 79
    .line 80
    const-string v2, "#66000000"

    .line 81
    .line 82
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    const-string v2, "#08000000"

    .line 87
    .line 88
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v10

    .line 92
    sget v13, Ll/qa00;->g:I

    .line 93
    .line 94
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 95
    .line 96
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    sget v3, Ll/eac0;->a:I

    .line 101
    .line 102
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    int-to-float v2, v2

    .line 107
    const/16 v19, 0x0

    .line 108
    .line 109
    const/16 v9, 0xa

    .line 110
    .line 111
    const/4 v12, 0x5

    .line 112
    const/4 v14, 0x0

    .line 113
    const/high16 v15, 0x40c00000    # 6.0f

    .line 114
    .line 115
    const/high16 v16, 0x40400000    # 3.0f

    .line 116
    .line 117
    const/16 v17, 0x0

    .line 118
    .line 119
    move/from16 v11, p2

    .line 120
    .line 121
    move/from16 v18, v2

    .line 122
    .line 123
    invoke-direct/range {v5 .. v19}, Ll/zu4;-><init>(Landroid/content/Context;Ljava/lang/String;IIIIIIFFFIFZ)V

    .line 124
    .line 125
    .line 126
    add-int/lit8 v2, v4, 0x1

    .line 127
    .line 128
    const/16 v3, 0x21

    .line 129
    .line 130
    invoke-virtual {v1, v5, v4, v2, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 131
    .line 132
    .line 133
    move v4, v2

    .line 134
    goto :goto_0

    .line 135
    :cond_1
    const-string v2, " "

    .line 136
    .line 137
    invoke-virtual {v1, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 138
    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_2
    return-object v1
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->e()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->e()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {p0, p1, v1, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;ZLandroid/view/View;)V
    .locals 5

    .line 1
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 2
    .line 3
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 4
    .line 5
    const-string v0, "default"

    .line 6
    .line 7
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    if-eqz p4, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 15
    .line 16
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 17
    .line 18
    const-string v0, "approved"

    .line 19
    .line 20
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p4

    .line 24
    const/4 v0, 0x1

    .line 25
    if-eqz p4, :cond_2

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->H0:I

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->e()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/api/g;->Dg(Ljava/lang/String;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance p2, Ll/sb8;

    .line 66
    .line 67
    invoke-direct {p2}, Ll/sb8;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance p2, Ll/kpk;

    .line 79
    .line 80
    invoke-direct {p2, p0}, Ll/kpk;-><init>(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;)V

    .line 81
    .line 82
    .line 83
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 92
    .line 93
    .line 94
    move-result-object p4

    .line 95
    invoke-interface {p4}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    .line 98
    move-result-object p4

    .line 99
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 100
    .line 101
    .line 102
    move-result p4

    .line 103
    if-eqz p4, :cond_3

    .line 104
    .line 105
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->H0:I

    .line 106
    .line 107
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_3
    const-string p4, "p_search_result"

    .line 112
    .line 113
    invoke-static {p2, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result p4

    .line 117
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 118
    .line 119
    const-string v2, "is_anonymou_group"

    .line 120
    .line 121
    const-string v3, "groupchat_id"

    .line 122
    .line 123
    const-string v4, "e_enter_group_chat"

    .line 124
    .line 125
    if-eqz p4, :cond_5

    .line 126
    .line 127
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 128
    .line 129
    .line 130
    move-result-object p4

    .line 131
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-static {v2, v1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    if-eqz p3, :cond_4

    .line 140
    .line 141
    const-string p3, "search_empty"

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_4
    const-string p3, "search_no_empty"

    .line 145
    .line 146
    :goto_0
    const-string v2, "which_page"

    .line 147
    .line 148
    invoke-static {v2, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 149
    .line 150
    .line 151
    move-result-object p3

    .line 152
    filled-new-array {p4, v1, p3}, [Ll/sfj0$a;

    .line 153
    .line 154
    .line 155
    move-result-object p3

    .line 156
    invoke-static {v4, p2, p3}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_5
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 161
    .line 162
    .line 163
    move-result-object p3

    .line 164
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 165
    .line 166
    .line 167
    move-result p4

    .line 168
    invoke-static {v2, p4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 169
    .line 170
    .line 171
    move-result-object p4

    .line 172
    filled-new-array {p3, p4}, [Ll/sfj0$a;

    .line 173
    .line 174
    .line 175
    move-result-object p3

    .line 176
    invoke-static {v4, p2, p3}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 177
    .line 178
    .line 179
    const/4 v0, 0x0

    .line 180
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->e()Lcom/p1/mobile/android/app/Act;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 185
    .line 186
    if-eqz v0, :cond_6

    .line 187
    .line 188
    const-string p2, "search"

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_6
    const-string p2, "suggest"

    .line 192
    .line 193
    :goto_2
    const-string p3, ""

    .line 194
    .line 195
    invoke-static {p0, p1, p3, p2}, Ll/jek;->t(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->f(Ljava/util/List;IZ)Landroid/text/SpannableStringBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public j(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Z)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->i:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->i:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v0, v2

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    move v0, v1

    .line 29
    :goto_1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->i:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 30
    .line 31
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 32
    .line 33
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 34
    .line 35
    const-string v4, "default"

    .line 36
    .line 37
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_2

    .line 42
    .line 43
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->h:Lv/VButton;

    .line 44
    .line 45
    const-string v4, "#d0d0d0"

    .line 46
    .line 47
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 52
    .line 53
    .line 54
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->h:Lv/VButton;

    .line 55
    .line 56
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->y:I

    .line 57
    .line 58
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 59
    .line 60
    .line 61
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->h:Lv/VButton;

    .line 62
    .line 63
    invoke-virtual {v3, v1}, Landroid/view/View;->setSelected(Z)V

    .line 64
    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_2
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 68
    .line 69
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 70
    .line 71
    const-string v4, "approved"

    .line 72
    .line 73
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->h:Lv/VButton;

    .line 78
    .line 79
    const-string v5, "#ffffffff"

    .line 80
    .line 81
    if-eqz v3, :cond_3

    .line 82
    .line 83
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 88
    .line 89
    .line 90
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->h:Lv/VButton;

    .line 91
    .line 92
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->Q:I

    .line 93
    .line 94
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 95
    .line 96
    .line 97
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->h:Lv/VButton;

    .line 98
    .line 99
    invoke-virtual {v3, v2}, Landroid/view/View;->setSelected(Z)V

    .line 100
    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_3
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 108
    .line 109
    .line 110
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->h:Lv/VButton;

    .line 111
    .line 112
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->D:I

    .line 113
    .line 114
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 115
    .line 116
    .line 117
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->h:Lv/VButton;

    .line 118
    .line 119
    invoke-virtual {v3, v2}, Landroid/view/View;->setSelected(Z)V

    .line 120
    .line 121
    .line 122
    :goto_2
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->h:Lv/VButton;

    .line 123
    .line 124
    new-instance v4, Ll/ipk;

    .line 125
    .line 126
    invoke-direct {v4, p0, p2, p1, p3}, Ll/ipk;-><init>(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;Z)V

    .line 127
    .line 128
    .line 129
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->c:Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;

    .line 133
    .line 134
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 135
    .line 136
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->d(Ljava/util/List;)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->e:Lv/VText;

    .line 140
    .line 141
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->e:Lv/VText;

    .line 145
    .line 146
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 152
    .line 153
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->g:Lcom/p1/mobile/putong/core/newui/group/ChatGroupTags;

    .line 158
    .line 159
    if-eqz p1, :cond_4

    .line 160
    .line 161
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 162
    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_4
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->g:Lcom/p1/mobile/putong/core/newui/group/ChatGroupTags;

    .line 169
    .line 170
    new-instance p3, Ll/jpk;

    .line 171
    .line 172
    invoke-direct {p3, p0, p2}, Ll/jpk;-><init>(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/newui/group/ChatGroupTags;->setTags(Ll/rcj;)V

    .line 176
    .line 177
    .line 178
    :goto_3
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 179
    .line 180
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->f:Lv/VText;

    .line 185
    .line 186
    if-nez p1, :cond_5

    .line 187
    .line 188
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 189
    .line 190
    .line 191
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->f:Lv/VText;

    .line 192
    .line 193
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 194
    .line 195
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    .line 197
    .line 198
    return v0

    .line 199
    :cond_5
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 200
    .line 201
    .line 202
    return v0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->g:Lcom/p1/mobile/putong/core/newui/group/ChatGroupTags;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->e:Lv/VText;

    .line 14
    .line 15
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
