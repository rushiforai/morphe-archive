.class public Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;

.field public b:Lv/VText;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;


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

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->d(Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
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

.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h3q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Wa()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->g2:Ll/tqb;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->view:Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->h5URL:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p2, p1}, Ll/tqb;->d3(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->view:Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->h5URL:Ljava/lang/String;

    .line 31
    .line 32
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-nez p2, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->c()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance p2, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v0, "tantan://webview?url="

    .line 45
    .line 46
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 61
    .line 62
    .line 63
    const-string p0, "e_chat_blindbox_receiver_h5"

    .line 64
    .line 65
    const-string p1, "p_chat_view"

    .line 66
    .line 67
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Ll/n100;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 6
    .line 7
    if-eqz p1, :cond_5

    .line 8
    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->isActor:Z

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->c:Landroid/widget/RelativeLayout;

    .line 16
    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    const/4 p2, 0x1

    .line 25
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->e:Lv/VText;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->view:Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->title:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->e:Lv/VText;

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, v1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->f:Lv/VText;

    .line 44
    .line 45
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->view:Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->subTitle:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->g:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {v0, v1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 55
    .line 56
    .line 57
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->g:Lv/VText;

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->view:Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->buttonTxt:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->view:Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 67
    .line 68
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->icon:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-eqz p2, :cond_3

    .line 75
    .line 76
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->d:Lv/VDraweeView;

    .line 77
    .line 78
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    sget v0, Ll/ibc0;->P1:I

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    sget v0, Ll/ibc0;->O1:I

    .line 96
    .line 97
    :goto_0
    invoke-virtual {p2, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->d:Lv/VDraweeView;

    .line 104
    .line 105
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->view:Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 106
    .line 107
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->icon:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->b:Lv/VText;

    .line 113
    .line 114
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->tip:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->g:Lv/VText;

    .line 120
    .line 121
    new-instance v0, Ll/g3q;

    .line 122
    .line 123
    invoke-direct {v0, p0, p1}, Ll/g3q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;)V

    .line 124
    .line 125
    .line 126
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    const-string p0, "GROWTH_BLINDBOX_GUIDE_MV_KEY"

    .line 130
    .line 131
    invoke-virtual {p3, p0}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result p2

    .line 135
    if-nez p2, :cond_5

    .line 136
    .line 137
    invoke-virtual {p3, p0}, Ll/n100;->b(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->isActor:Z

    .line 141
    .line 142
    const-string p1, "p_chat_view"

    .line 143
    .line 144
    if-eqz p0, :cond_4

    .line 145
    .line 146
    const-string p0, "e_chat_blindbox_initiator_tips"

    .line 147
    .line 148
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_4
    const-string p0, "e_chat_blindbox_receiver_tips"

    .line 153
    .line 154
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    const-string p0, "e_chat_blindbox_receiver_h5"

    .line 158
    .line 159
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    :cond_5
    :goto_2
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->d:Lv/VDraweeView;

    .line 22
    .line 23
    sget v1, Ll/ibc0;->P1:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->b:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Ll/g9c0;->i:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->e:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    sget v2, Ll/g9c0;->g:I

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->f:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    sget v2, Ll/g9c0;->i:I

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->g:Lv/VText;

    .line 74
    .line 75
    sget v0, Ll/ibc0;->U4:I

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 78
    .line 79
    .line 80
    :cond_0
    return-void
.end method
