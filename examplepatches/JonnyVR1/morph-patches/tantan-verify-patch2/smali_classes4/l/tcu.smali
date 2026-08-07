.class public Ll/tcu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z6m;


# static fields
.field public static final b:Ll/z6m;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/tcu;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/tcu;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/tcu;->b:Ll/z6m;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d()Ll/z6m;
    .locals 1

    .line 1
    sget-object v0, Ll/tcu;->b:Ll/z6m;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/ue6;->c0(Ll/sj6;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/ue6;->U0(Ll/sj6;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-interface {p0, p1, p2}, Ll/ue6;->H(Ll/sj6;Z)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 22
    .line 23
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    invoke-interface {p0, p1}, Ll/ue6;->n(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public b(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 5

    .line 1
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/gra;->a2()Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    const/4 v0, 0x1

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    iget-object p2, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 15
    .line 16
    iget-boolean v2, p1, Ll/sj6;->e:Z

    .line 17
    .line 18
    invoke-interface {p2, v2}, Ll/ue6;->V0(Z)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-interface {p2, p1, v2}, Ll/ue6;->a0(Ll/sj6;Z)Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-static {}, Ll/vq8;->b()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    invoke-static {}, Ll/gra;->a2()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 41
    .line 42
    const-string v3, "default"

    .line 43
    .line 44
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    if-eqz p2, :cond_0

    .line 51
    .line 52
    iget-object v2, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 53
    .line 54
    invoke-interface {v2, p1, p2}, Ll/ue6;->P0(Ll/sj6;Lcom/p1/mobile/putong/data/UserLiveLabel;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string v2, "onVoice"

    .line 59
    .line 60
    iget-object p2, p2, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-eqz p2, :cond_2

    .line 67
    .line 68
    move p2, v0

    .line 69
    goto :goto_1

    .line 70
    :cond_0
    const-string p1, ""

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    iget-object p2, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 74
    .line 75
    iget-boolean v2, p1, Ll/sj6;->e:Z

    .line 76
    .line 77
    invoke-interface {p2, p1, v1, v2}, Ll/ue6;->O0(Ll/sj6;ZZ)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    :cond_2
    :goto_0
    move p2, v1

    .line 82
    :goto_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-nez v2, :cond_4

    .line 87
    .line 88
    const-string v2, "#ff5eea"

    .line 89
    .line 90
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-eqz p2, :cond_3

    .line 95
    .line 96
    const-string p2, "#32C3BB"

    .line 97
    .line 98
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    :cond_3
    new-instance p2, Landroid/text/SpannableString;

    .line 103
    .line 104
    invoke-direct {p2, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    .line 108
    .line 109
    invoke-direct {v3, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    const/16 v4, 0x21

    .line 117
    .line 118
    invoke-virtual {p2, v3, v1, v2, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 119
    .line 120
    .line 121
    new-instance v2, Landroid/text/style/StyleSpan;

    .line 122
    .line 123
    invoke-direct {v2, v0}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    invoke-virtual {p2, v2, v1, p1, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 134
    .line 135
    .line 136
    :cond_4
    return-object p0
.end method
