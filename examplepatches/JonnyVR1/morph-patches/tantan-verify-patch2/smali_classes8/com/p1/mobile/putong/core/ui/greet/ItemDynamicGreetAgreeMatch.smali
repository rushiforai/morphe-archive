.class public Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch$a;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static getDefaultMsg()Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "\u62db\u547c\u6536\u5230\u4e86\uff0c\u6211\u4eec\u53ef\u4ee5\u5f00\u59cb\u804a\u5929\u4e86"

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "like_relation_fuction"

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    new-instance v2, Lorg/json/JSONObject;

    .line 20
    .line 21
    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v1, "greet_consent_auto_msg"

    .line 25
    .line 26
    invoke-virtual {v2, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    :catch_0
    :cond_0
    return-object v0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;->w(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;->b:Lv/VText;

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;->a:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;->v(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch$a;->a(Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e2()Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->R0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p2, "moments_user_id"

    .line 16
    .line 17
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {p0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p2, "e_greet_consent"

    .line 26
    .line 27
    const-string v0, "p_kankan_chat_popup"

    .line 28
    .line 29
    invoke-static {p2, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g2()Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;->getDefaultMsg()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->R0(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-string v0, "\u5979"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string v0, "\u4ed6"

    .line 27
    .line 28
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;->a:Landroid/widget/TextView;

    .line 29
    .line 30
    const-string v2, "\u611f\u89c9%s\u8fd8\u4e0d\u9519\uff0c\u540c\u610f%s\u8ddf\u6211\u7ee7\u7eed\u804a\u5929\uff1f"

    .line 31
    .line 32
    filled-new-array {v0, v0}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 44
    .line 45
    const-string v0, "local_dynamic_greeting_agree_match"

    .line 46
    .line 47
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    if-eqz p3, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e2()Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->R0()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string p3, "moments_user_id"

    .line 70
    .line 71
    invoke-static {p3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    filled-new-array {p1}, [Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string p3, "e_greet_consent"

    .line 80
    .line 81
    const-string v0, "p_kankan_chat_popup"

    .line 82
    .line 83
    invoke-static {p3, v0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;->b:Lv/VText;

    .line 87
    .line 88
    new-instance p3, Ll/u4q;

    .line 89
    .line 90
    invoke-direct {p3, p0, p2}, Ll/u4q;-><init>(Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;)V

    .line 91
    .line 92
    .line 93
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method
