.class public Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/x6q;


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/view/View;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VButton;

.field public h:Landroid/widget/LinearLayout;

.field public i:Landroid/view/View;

.field public j:Lcom/p1/mobile/putong/core/data/Message;


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
    return-void
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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->h(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->j(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->g(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->i(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final e(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final f(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    :try_start_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/VoiceCallInvitationStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/data/VoiceCallInvitationStatus;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VoiceCallInvitationStatus;->status:Ljava/lang/String;

    .line 22
    .line 23
    const-string p1, "accepted"

    .line 24
    .line 25
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :catch_0
    move-exception p0

    .line 34
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "voice_call_reminder_character"

    .line 2
    .line 3
    const-string v0, "applicant"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "e_voice_call_received_message"

    .line 14
    .line 15
    const-string v1, "p_chat_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->n(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "voice_call_reminder_character"

    .line 2
    .line 3
    const-string v0, "receiver"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "e_voice_call_received_message"

    .line 14
    .line 15
    const-string v1, "p_chat_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->n(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "moments_user_id"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "voice_call_receiver_user_id"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {p2, v0}, [Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string v0, "e_voice_call_application_receiver_pop_ups_reject"

    .line 28
    .line 29
    const-string v1, "p_chat_view"

    .line 30
    .line 31
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 32
    .line 33
    .line 34
    const/4 p2, 0x1

    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->m(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "moments_user_id"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "voice_call_receiver_user_id"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {p2, v0}, [Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string v0, "e_voice_call_application_receiver_approve"

    .line 28
    .line 29
    const-string v1, "p_chat_view"

    .line 30
    .line 31
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 32
    .line 33
    .line 34
    const/4 p2, 0x0

    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->m(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 13

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->j:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 16
    .line 17
    const-wide/16 v1, 0x0

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 22
    .line 23
    if-eqz v3, :cond_2

    .line 24
    .line 25
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->rejectedTime:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    :try_start_0
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->rejectedTime:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 36
    .line 37
    .line 38
    move-result-wide v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    goto :goto_0

    .line 40
    :catch_0
    move-exception v0

    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    move-wide v4, v1

    .line 45
    :goto_0
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->acceptedTime:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    :try_start_1
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->acceptedTime:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 56
    .line 57
    .line 58
    move-result-wide v1
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 59
    :cond_1
    :goto_1
    move-wide v9, v1

    .line 60
    move-wide v7, v4

    .line 61
    goto :goto_2

    .line 62
    :catch_1
    move-exception v0

    .line 63
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    move-wide v7, v1

    .line 68
    move-wide v9, v7

    .line 69
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 70
    .line 71
    .line 72
    move-result v11

    .line 73
    move-object v6, p0

    .line 74
    move-object v12, p1

    .line 75
    invoke-virtual/range {v6 .. v12}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->l(JJZLcom/p1/mobile/putong/core/data/Message;)V

    .line 76
    .line 77
    .line 78
    :cond_3
    return-void
.end method

.method public l(JJZLcom/p1/mobile/putong/core/data/Message;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->c:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->f:Landroid/widget/TextView;

    .line 13
    .line 14
    const/4 v2, 0x3

    .line 15
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const/4 v4, 0x1

    .line 20
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->g:Lv/VButton;

    .line 24
    .line 25
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 33
    .line 34
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->c:Landroid/widget/TextView;

    .line 42
    .line 43
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v0, v2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->c:Landroid/widget/TextView;

    .line 57
    .line 58
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->h:Landroid/widget/LinearLayout;

    .line 62
    .line 63
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 68
    .line 69
    sget v2, Ll/qa00;->m:I

    .line 70
    .line 71
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 72
    .line 73
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->h:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    const/4 v2, 0x2

    .line 79
    const-wide/16 v5, 0x0

    .line 80
    .line 81
    if-eqz p5, :cond_b

    .line 82
    .line 83
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->i:Landroid/view/View;

    .line 84
    .line 85
    invoke-static {p5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p6}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->f(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 89
    .line 90
    .line 91
    move-result p5

    .line 92
    if-nez p5, :cond_9

    .line 93
    .line 94
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e(I)Z

    .line 95
    .line 96
    .line 97
    move-result p5

    .line 98
    if-eqz p5, :cond_0

    .line 99
    .line 100
    goto/16 :goto_4

    .line 101
    .line 102
    :cond_0
    cmp-long p5, p1, v5

    .line 103
    .line 104
    if-lez p5, :cond_1

    .line 105
    .line 106
    iget-wide p5, p6, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 107
    .line 108
    long-to-double p1, p1

    .line 109
    cmpg-double p1, p5, p1

    .line 110
    .line 111
    if-lez p1, :cond_2

    .line 112
    .line 113
    :cond_1
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e(I)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-eqz p1, :cond_4

    .line 118
    .line 119
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->g:Lv/VButton;

    .line 120
    .line 121
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->f:Landroid/widget/TextView;

    .line 125
    .line 126
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->Q1:I

    .line 127
    .line 128
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e:Landroid/widget/ImageView;

    .line 132
    .line 133
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    if-eqz p2, :cond_3

    .line 146
    .line 147
    sget p2, Ll/ibc0;->m5:I

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_3
    sget p2, Ll/ibc0;->l5:I

    .line 151
    .line 152
    :goto_0
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->a:Landroid/widget/TextView;

    .line 156
    .line 157
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->X1:I

    .line 158
    .line 159
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_4
    cmp-long p1, p3, v5

    .line 164
    .line 165
    if-gtz p1, :cond_7

    .line 166
    .line 167
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e(I)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_5

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->g:Lv/VButton;

    .line 175
    .line 176
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e:Landroid/widget/ImageView;

    .line 180
    .line 181
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 190
    .line 191
    .line 192
    move-result p2

    .line 193
    if-eqz p2, :cond_6

    .line 194
    .line 195
    sget p2, Ll/ibc0;->S6:I

    .line 196
    .line 197
    goto :goto_1

    .line 198
    :cond_6
    sget p2, Ll/ibc0;->R6:I

    .line 199
    .line 200
    :goto_1
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 201
    .line 202
    .line 203
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->f:Landroid/widget/TextView;

    .line 204
    .line 205
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->P1:I

    .line 206
    .line 207
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 208
    .line 209
    .line 210
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->a:Landroid/widget/TextView;

    .line 211
    .line 212
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->X1:I

    .line 213
    .line 214
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :cond_7
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e:Landroid/widget/ImageView;

    .line 219
    .line 220
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 221
    .line 222
    .line 223
    move-result-object p2

    .line 224
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 229
    .line 230
    .line 231
    move-result p2

    .line 232
    if-eqz p2, :cond_8

    .line 233
    .line 234
    sget p2, Ll/ibc0;->S6:I

    .line 235
    .line 236
    goto :goto_3

    .line 237
    :cond_8
    sget p2, Ll/ibc0;->R6:I

    .line 238
    .line 239
    :goto_3
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->f:Landroid/widget/TextView;

    .line 243
    .line 244
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->O1:I

    .line 245
    .line 246
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 247
    .line 248
    .line 249
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->g:Lv/VButton;

    .line 250
    .line 251
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 252
    .line 253
    .line 254
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->a:Landroid/widget/TextView;

    .line 255
    .line 256
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->X1:I

    .line 257
    .line 258
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :cond_9
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e:Landroid/widget/ImageView;

    .line 263
    .line 264
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 265
    .line 266
    .line 267
    move-result-object p2

    .line 268
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 269
    .line 270
    .line 271
    move-result-object p2

    .line 272
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 273
    .line 274
    .line 275
    move-result p2

    .line 276
    if-eqz p2, :cond_a

    .line 277
    .line 278
    sget p2, Ll/ibc0;->S6:I

    .line 279
    .line 280
    goto :goto_5

    .line 281
    :cond_a
    sget p2, Ll/ibc0;->R6:I

    .line 282
    .line 283
    :goto_5
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 284
    .line 285
    .line 286
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->f:Landroid/widget/TextView;

    .line 287
    .line 288
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->O1:I

    .line 289
    .line 290
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 291
    .line 292
    .line 293
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->a:Landroid/widget/TextView;

    .line 294
    .line 295
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->N1:I

    .line 296
    .line 297
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 298
    .line 299
    .line 300
    sget p1, Ll/qa00;->j:I

    .line 301
    .line 302
    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 303
    .line 304
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->h:Landroid/widget/LinearLayout;

    .line 305
    .line 306
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 307
    .line 308
    .line 309
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->g:Lv/VButton;

    .line 310
    .line 311
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 312
    .line 313
    .line 314
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->g:Lv/VButton;

    .line 315
    .line 316
    new-instance p2, Ll/ujq;

    .line 317
    .line 318
    invoke-direct {p2, p0, p6}, Ll/ujq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 319
    .line 320
    .line 321
    invoke-static {p1, p2}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 322
    .line 323
    .line 324
    return-void

    .line 325
    :cond_b
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->f:Landroid/widget/TextView;

    .line 326
    .line 327
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->W1:I

    .line 328
    .line 329
    invoke-virtual {p5, v0}, Landroid/widget/TextView;->setText(I)V

    .line 330
    .line 331
    .line 332
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->i:Landroid/view/View;

    .line 333
    .line 334
    invoke-static {p5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 335
    .line 336
    .line 337
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->g:Lv/VButton;

    .line 338
    .line 339
    invoke-static {p5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {p0, p6}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->f(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 343
    .line 344
    .line 345
    move-result p5

    .line 346
    if-nez p5, :cond_17

    .line 347
    .line 348
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e(I)Z

    .line 349
    .line 350
    .line 351
    move-result p5

    .line 352
    if-eqz p5, :cond_c

    .line 353
    .line 354
    goto/16 :goto_c

    .line 355
    .line 356
    :cond_c
    cmp-long p5, p1, v5

    .line 357
    .line 358
    if-lez p5, :cond_d

    .line 359
    .line 360
    iget-wide v0, p6, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 361
    .line 362
    long-to-double p1, p1

    .line 363
    cmpg-double p1, v0, p1

    .line 364
    .line 365
    if-lez p1, :cond_e

    .line 366
    .line 367
    :cond_d
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e(I)Z

    .line 368
    .line 369
    .line 370
    move-result p1

    .line 371
    if-eqz p1, :cond_11

    .line 372
    .line 373
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e:Landroid/widget/ImageView;

    .line 374
    .line 375
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 376
    .line 377
    .line 378
    move-result-object p2

    .line 379
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 380
    .line 381
    .line 382
    move-result-object p2

    .line 383
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 384
    .line 385
    .line 386
    move-result p2

    .line 387
    if-eqz p2, :cond_f

    .line 388
    .line 389
    sget p2, Ll/ibc0;->m5:I

    .line 390
    .line 391
    goto :goto_6

    .line 392
    :cond_f
    sget p2, Ll/ibc0;->l5:I

    .line 393
    .line 394
    :goto_6
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 395
    .line 396
    .line 397
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->c:Landroid/widget/TextView;

    .line 398
    .line 399
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 400
    .line 401
    .line 402
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->a:Landroid/widget/TextView;

    .line 403
    .line 404
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->U1:I

    .line 405
    .line 406
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 407
    .line 408
    .line 409
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->c:Landroid/widget/TextView;

    .line 410
    .line 411
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->Y1:I

    .line 412
    .line 413
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 414
    .line 415
    .line 416
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->c:Landroid/widget/TextView;

    .line 417
    .line 418
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 419
    .line 420
    .line 421
    move-result-object p0

    .line 422
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 423
    .line 424
    .line 425
    move-result-object p2

    .line 426
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 427
    .line 428
    .line 429
    move-result-object p2

    .line 430
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 431
    .line 432
    .line 433
    move-result p2

    .line 434
    if-eqz p2, :cond_10

    .line 435
    .line 436
    sget p2, Ll/g9c0;->i:I

    .line 437
    .line 438
    goto :goto_7

    .line 439
    :cond_10
    sget p2, Ll/g9c0;->c:I

    .line 440
    .line 441
    :goto_7
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 442
    .line 443
    .line 444
    move-result p0

    .line 445
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 446
    .line 447
    .line 448
    return-void

    .line 449
    :cond_11
    cmp-long p1, p3, v5

    .line 450
    .line 451
    if-gtz p1, :cond_14

    .line 452
    .line 453
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e(I)Z

    .line 454
    .line 455
    .line 456
    move-result p1

    .line 457
    if-eqz p1, :cond_12

    .line 458
    .line 459
    goto :goto_9

    .line 460
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e:Landroid/widget/ImageView;

    .line 461
    .line 462
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 463
    .line 464
    .line 465
    move-result-object p2

    .line 466
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 467
    .line 468
    .line 469
    move-result-object p2

    .line 470
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 471
    .line 472
    .line 473
    move-result p2

    .line 474
    if-eqz p2, :cond_13

    .line 475
    .line 476
    sget p2, Ll/ibc0;->S6:I

    .line 477
    .line 478
    goto :goto_8

    .line 479
    :cond_13
    sget p2, Ll/ibc0;->R6:I

    .line 480
    .line 481
    :goto_8
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 482
    .line 483
    .line 484
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->a:Landroid/widget/TextView;

    .line 485
    .line 486
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->U1:I

    .line 487
    .line 488
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 489
    .line 490
    .line 491
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 492
    .line 493
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->V1:I

    .line 494
    .line 495
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 496
    .line 497
    .line 498
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->c:Landroid/widget/TextView;

    .line 499
    .line 500
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->S1:I

    .line 501
    .line 502
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 503
    .line 504
    .line 505
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 506
    .line 507
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 508
    .line 509
    .line 510
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->c:Landroid/widget/TextView;

    .line 511
    .line 512
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 513
    .line 514
    .line 515
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 516
    .line 517
    new-instance p2, Ll/wjq;

    .line 518
    .line 519
    invoke-direct {p2, p0, p6}, Ll/wjq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 520
    .line 521
    .line 522
    invoke-static {p1, p2}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 523
    .line 524
    .line 525
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->c:Landroid/widget/TextView;

    .line 526
    .line 527
    new-instance p2, Ll/xjq;

    .line 528
    .line 529
    invoke-direct {p2, p0, p6}, Ll/xjq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 530
    .line 531
    .line 532
    invoke-static {p1, p2}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 533
    .line 534
    .line 535
    return-void

    .line 536
    :cond_14
    :goto_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e:Landroid/widget/ImageView;

    .line 537
    .line 538
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 539
    .line 540
    .line 541
    move-result-object p2

    .line 542
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 543
    .line 544
    .line 545
    move-result-object p2

    .line 546
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 547
    .line 548
    .line 549
    move-result p2

    .line 550
    if-eqz p2, :cond_15

    .line 551
    .line 552
    sget p2, Ll/ibc0;->S6:I

    .line 553
    .line 554
    goto :goto_a

    .line 555
    :cond_15
    sget p2, Ll/ibc0;->R6:I

    .line 556
    .line 557
    :goto_a
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 558
    .line 559
    .line 560
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->a:Landroid/widget/TextView;

    .line 561
    .line 562
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->U1:I

    .line 563
    .line 564
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 565
    .line 566
    .line 567
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 568
    .line 569
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 570
    .line 571
    .line 572
    move-result-object p2

    .line 573
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 574
    .line 575
    .line 576
    move-result-object p3

    .line 577
    invoke-virtual {p3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 578
    .line 579
    .line 580
    move-result-object p3

    .line 581
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 582
    .line 583
    .line 584
    move-result p3

    .line 585
    if-eqz p3, :cond_16

    .line 586
    .line 587
    sget p3, Ll/g9c0;->i:I

    .line 588
    .line 589
    goto :goto_b

    .line 590
    :cond_16
    sget p3, Ll/g9c0;->l:I

    .line 591
    .line 592
    :goto_b
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 593
    .line 594
    .line 595
    move-result p2

    .line 596
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 597
    .line 598
    .line 599
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 600
    .line 601
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->M1:I

    .line 602
    .line 603
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 604
    .line 605
    .line 606
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 607
    .line 608
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 609
    .line 610
    .line 611
    return-void

    .line 612
    :cond_17
    :goto_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e:Landroid/widget/ImageView;

    .line 613
    .line 614
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 615
    .line 616
    .line 617
    move-result-object p2

    .line 618
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 619
    .line 620
    .line 621
    move-result-object p2

    .line 622
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 623
    .line 624
    .line 625
    move-result p2

    .line 626
    if-eqz p2, :cond_18

    .line 627
    .line 628
    sget p2, Ll/ibc0;->S6:I

    .line 629
    .line 630
    goto :goto_d

    .line 631
    :cond_18
    sget p2, Ll/ibc0;->R6:I

    .line 632
    .line 633
    :goto_d
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 634
    .line 635
    .line 636
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->a:Landroid/widget/TextView;

    .line 637
    .line 638
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->T1:I

    .line 639
    .line 640
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 641
    .line 642
    .line 643
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 644
    .line 645
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->R1:I

    .line 646
    .line 647
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 648
    .line 649
    .line 650
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 651
    .line 652
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 653
    .line 654
    .line 655
    move-result-object p2

    .line 656
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 657
    .line 658
    .line 659
    move-result-object p3

    .line 660
    invoke-virtual {p3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 661
    .line 662
    .line 663
    move-result-object p3

    .line 664
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 665
    .line 666
    .line 667
    move-result p3

    .line 668
    if-eqz p3, :cond_19

    .line 669
    .line 670
    sget p3, Ll/g9c0;->j:I

    .line 671
    .line 672
    goto :goto_e

    .line 673
    :cond_19
    sget p3, Ll/g9c0;->o:I

    .line 674
    .line 675
    :goto_e
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 676
    .line 677
    .line 678
    move-result p2

    .line 679
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 680
    .line 681
    .line 682
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 683
    .line 684
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 685
    .line 686
    .line 687
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 688
    .line 689
    new-instance p2, Ll/vjq;

    .line 690
    .line 691
    invoke-direct {p2, p0, p6}, Ll/vjq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 692
    .line 693
    .line 694
    invoke-static {p1, p2}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 695
    .line 696
    .line 697
    return-void
.end method

.method public final m(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/avm0;->f(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public message()Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->j:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "voice_entry_request_item"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/qzm0;->o(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v1, ""

    .line 19
    .line 20
    invoke-virtual {v0, p0, p1, v1}, Ll/xzm0;->h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->B1:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/TextView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->a:Landroid/widget/TextView;

    .line 13
    .line 14
    sget v0, Ll/edc0;->Z0:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 23
    .line 24
    sget v0, Ll/edc0;->J3:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/TextView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->c:Landroid/widget/TextView;

    .line 33
    .line 34
    sget v0, Ll/edc0;->y5:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->d:Landroid/view/View;

    .line 41
    .line 42
    sget v0, Ll/edc0;->J2:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->i:Landroid/view/View;

    .line 49
    .line 50
    sget v0, Ll/edc0;->k1:I

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Landroid/widget/ImageView;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->e:Landroid/widget/ImageView;

    .line 59
    .line 60
    sget v0, Ll/edc0;->P4:I

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Landroid/widget/TextView;

    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->f:Landroid/widget/TextView;

    .line 69
    .line 70
    sget v0, Ll/edc0;->e2:I

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lv/VButton;

    .line 77
    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->g:Lv/VButton;

    .line 79
    .line 80
    sget v0, Ll/edc0;->Y:I

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Landroid/widget/LinearLayout;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->h:Landroid/widget/LinearLayout;

    .line 89
    .line 90
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_0

    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->f:Landroid/widget/TextView;

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    sget v2, Ll/g9c0;->g:I

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->a:Landroid/widget/TextView;

    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    sget v2, Ll/g9c0;->i:I

    .line 126
    .line 127
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->g:Lv/VButton;

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    sget v2, Ll/g9c0;->j:I

    .line 141
    .line 142
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->b:Landroid/widget/TextView;

    .line 150
    .line 151
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    sget v2, Ll/g9c0;->i:I

    .line 156
    .line 157
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemVoiceCallInvitation;->c:Landroid/widget/TextView;

    .line 165
    .line 166
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    sget v1, Ll/g9c0;->j:I

    .line 171
    .line 172
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 177
    .line 178
    .line 179
    :cond_0
    return-void
.end method
