.class public Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->i:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->i:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->i:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->i(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v1, 0xa067

    .line 10
    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->C2:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic d(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->h(Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/Message;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    :catch_0
    :goto_0
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

.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q7q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h(Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    const-string p2, "schemaSearch"

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string v0, "chat-share-voice-live"

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    if-eqz v0, :cond_1

    .line 22
    .line 23
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->b:Lv/VDraweeView;

    .line 26
    .line 27
    sget v3, Ll/ibc0;->S2:I

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->b:Lv/VDraweeView;

    .line 36
    .line 37
    sget v3, Ll/ibc0;->T2:I

    .line 38
    .line 39
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 40
    .line 41
    .line 42
    :goto_1
    const-string v1, "title"

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-nez v2, :cond_2

    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->c:Lv/VText;

    .line 55
    .line 56
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    const-string v1, "desc"

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-nez v2, :cond_3

    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->d:Lv/VText;

    .line 72
    .line 73
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    :cond_3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-nez v1, :cond_4

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;

    .line 83
    .line 84
    new-instance v2, Ll/k7q;

    .line 85
    .line 86
    invoke-direct {v2, p0, p2}, Ll/k7q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    :cond_4
    const-string v1, "anchorId"

    .line 93
    .line 94
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->e:Ljava/lang/String;

    .line 99
    .line 100
    const-string v2, "liveID"

    .line 101
    .line 102
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->g:Ljava/lang/String;

    .line 107
    .line 108
    const-string v2, "topicId"

    .line 109
    .line 110
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->f:Ljava/lang/String;

    .line 115
    .line 116
    const-string v2, "topicName"

    .line 117
    .line 118
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->h:Ljava/lang/String;

    .line 123
    .line 124
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->i:Z

    .line 125
    .line 126
    if-nez p1, :cond_5

    .line 127
    .line 128
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-nez p1, :cond_5

    .line 133
    .line 134
    if-eqz v0, :cond_5

    .line 135
    .line 136
    const/4 p1, 0x1

    .line 137
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->i:Z

    .line 138
    .line 139
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->e:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    const-string p2, "liveId"

    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->g:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    const-string v0, "topic_id"

    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->f:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    const-string v1, "audio_room_label"

    .line 162
    .line 163
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->h:Ljava/lang/String;

    .line 164
    .line 165
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    const-string v1, "audio_card_type"

    .line 170
    .line 171
    const-string v2, "user_invite"

    .line 172
    .line 173
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    filled-new-array {p1, p2, v0, p0, v1}, [Ll/pf60;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    const-string p1, "e_live_audio_room_enter"

    .line 182
    .line 183
    const-string p2, "p_chat_view"

    .line 184
    .line 185
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 186
    .line 187
    .line 188
    :cond_5
    return-void
.end method

.method public final synthetic i(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->k(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 3

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-string v1, "OK"

    .line 12
    .line 13
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    .line 36
    .line 37
    if-eqz v1, :cond_5

    .line 38
    .line 39
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    goto/16 :goto_0

    .line 54
    .line 55
    :cond_1
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 60
    .line 61
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    check-cast p2, Lcom/p1/mobile/putong/core/data/LiveSchema;

    .line 69
    .line 70
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/LiveSchema;->schema:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/LiveSchema;->tip:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_2

    .line 85
    .line 86
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->C2:I

    .line 87
    .line 88
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/LiveSchema;->tip:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_4

    .line 103
    .line 104
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/LiveSchema;->tip:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_4
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/LiveSchema;->schema:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {p1, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/LiveSchema;->schema:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_5

    .line 125
    .line 126
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/LiveSchema;->schema:Ljava/lang/String;

    .line 127
    .line 128
    const-string p2, "enterVoiceRoom"

    .line 129
    .line 130
    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-eqz p1, :cond_5

    .line 135
    .line 136
    const-string p1, "anchorId"

    .line 137
    .line 138
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->e:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    const-string p2, "liveId"

    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->g:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    const-string v0, "topic_id"

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->f:Ljava/lang/String;

    .line 155
    .line 156
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    const-string v1, "audio_room_label"

    .line 161
    .line 162
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->h:Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    const-string v1, "audio_card_type"

    .line 169
    .line 170
    const-string v2, "user_invite"

    .line 171
    .line 172
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    filled-new-array {p1, p2, v0, p0, v1}, [Ll/pf60;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    const-string p1, "e_live_audio_room_enter"

    .line 181
    .line 182
    const-string p2, "p_chat_view"

    .line 183
    .line 184
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 185
    .line 186
    .line 187
    :cond_5
    :goto_0
    return-void
.end method

.method public final k(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    new-instance v1, Ll/l7q;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Ll/l7q;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v2, p1, v3}, Lcom/p1/mobile/putong/core/api/g;->wp(Ljava/lang/String;Z)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v2, Ll/m7q;

    .line 28
    .line 29
    invoke-direct {v2, v0, v1}, Ll/m7q;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v2}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v2, Ll/n7q;

    .line 37
    .line 38
    invoke-direct {v2, v1, v0}, Ll/n7q;-><init>(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v2}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v1, Ll/o7q;

    .line 46
    .line 47
    invoke-direct {v1, p0, v0}, Ll/o7q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;Lcom/p1/mobile/android/app/Act;)V

    .line 48
    .line 49
    .line 50
    new-instance p0, Ll/p7q;

    .line 51
    .line 52
    invoke-direct {p0}, Ll/p7q;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->g(Landroid/view/View;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->c:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->g:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLiveVirtualVoice;->d:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget v1, Ll/g9c0;->i:I

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
