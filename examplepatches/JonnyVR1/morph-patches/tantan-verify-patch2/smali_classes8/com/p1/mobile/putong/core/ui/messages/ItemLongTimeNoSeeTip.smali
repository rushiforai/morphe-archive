.class public Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;

.field public b:Landroid/widget/LinearLayout;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/LinearLayout;

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


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/v7q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/n100;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ll/n100;->b(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/data/Conversation;->hasReSwipeConvIceBreak()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const-string p1, "break_ice"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p1, "unbreak_ice"

    .line 24
    .line 25
    :goto_0
    const-string p2, "pairing_type"

    .line 26
    .line 27
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    filled-new-array {p1}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string p2, "e_longtimenosee_notice"

    .line 36
    .line 37
    const-string v0, "p_chat_view"

    .line 38
    .line 39
    invoke-static {p2, v0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object p1, p4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 45
    .line 46
    const/16 p2, 0x8

    .line 47
    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;->e:Lv/VText;

    .line 51
    .line 52
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    new-instance p1, Ljava/util/Date;

    .line 57
    .line 58
    iget-object v0, p4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 61
    .line 62
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->swipedTime:D

    .line 63
    .line 64
    double-to-long v0, v0

    .line 65
    invoke-direct {p1, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 66
    .line 67
    .line 68
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->d(Ljava/util/Date;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;->e:Lv/VText;

    .line 73
    .line 74
    const/4 v1, 0x0

    .line 75
    if-nez p1, :cond_3

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;->e:Lv/VText;

    .line 81
    .line 82
    iget-object p2, p4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 83
    .line 84
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 85
    .line 86
    iget-wide v2, p2, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->swipedTime:D

    .line 87
    .line 88
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b(D)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    invoke-virtual {v0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 97
    .line 98
    .line 99
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;->f:Lv/VText;

    .line 100
    .line 101
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;->f:Lv/VText;

    .line 105
    .line 106
    sget-object p2, Ll/pzi0;->h:Ljava/text/SimpleDateFormat;

    .line 107
    .line 108
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 109
    .line 110
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 111
    .line 112
    iget-wide v2, p4, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->swipedTime:D

    .line 113
    .line 114
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 115
    .line 116
    .line 117
    move-result-object p4

    .line 118
    invoke-virtual {p2, p4}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;->d:Landroid/widget/LinearLayout;

    .line 126
    .line 127
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;->c:Landroid/widget/LinearLayout;

    .line 131
    .line 132
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;->g:Lv/VText;

    .line 136
    .line 137
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_4

    .line 142
    .line 143
    const-string p1, "\u5979"

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_4
    const-string p1, "\u4ed6"

    .line 147
    .line 148
    :goto_2
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    const-string p2, "\u518d\u76f8\u9047\uff0c\u522b\u8ba9\u7f18\u5206\u6e9c\u8d70\uff0c\u548c%s\u804a\u804a\u5427"

    .line 153
    .line 154
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;->a(Landroid/view/View;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLongTimeNoSeeTip;->g:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget v1, Ll/g9c0;->i:I

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method
