.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->g:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->g:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->g:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p1, "scheme_message_no_handler_found"

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->failRemind:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->d(Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    goto/16 :goto_3

    .line 24
    .line 25
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->g:Z

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->g:Z

    .line 31
    .line 32
    const-string v0, "e_chat_game_done"

    .line 33
    .line 34
    const-string v2, "p_worldcup_chat"

    .line 35
    .line 36
    invoke-static {v0, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->d:Lv/VText;

    .line 40
    .line 41
    new-instance v2, Ll/wbq;

    .line 42
    .line 43
    invoke-direct {v2, p0, p1}, Ll/wbq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->view:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_6

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->view:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;->title:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->e:Lv/VText;

    .line 66
    .line 67
    const/4 v4, 0x0

    .line 68
    if-nez v2, :cond_3

    .line 69
    .line 70
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->e:Lv/VText;

    .line 74
    .line 75
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->view:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;->subTitle:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->f:Lv/VText;

    .line 91
    .line 92
    if-nez v2, :cond_4

    .line 93
    .line 94
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->f:Lv/VText;

    .line 98
    .line 99
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->view:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;->button:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->d:Lv/VText;

    .line 115
    .line 116
    if-nez v2, :cond_5

    .line 117
    .line 118
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->d:Lv/VText;

    .line 122
    .line 123
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_5
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    :goto_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->view:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;

    .line 131
    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;->image:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-nez v0, :cond_6

    .line 139
    .line 140
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 141
    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->c:Lv/VDraweeView;

    .line 143
    .line 144
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->view:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;

    .line 145
    .line 146
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;->image:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    :catch_0
    :cond_6
    :goto_3
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ybq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_chat_game_done"

    .line 2
    .line 3
    const-string v0, "p_worldcup_chat"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->d:Lv/VText;

    .line 9
    .line 10
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->schema:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    new-instance v0, Ll/xbq;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Ll/xbq;-><init>(Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p0, p2, v0}, Ll/nae0;->n(Landroid/app/Activity;Landroid/net/Uri;Ll/z20;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->e:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->e:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget v2, Ll/g9c0;->g:I

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->f:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    sget v2, Ll/g9c0;->i:I

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInviteAfter;->d:Lv/VText;

    .line 62
    .line 63
    sget v0, Ll/ibc0;->t:I

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 66
    .line 67
    .line 68
    :cond_0
    return-void
.end method
