.class public Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Ll/g900;Ll/n100;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/g900;

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/g900;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->d:Ll/g900;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/dkb;->Aa(Lcom/p1/mobile/putong/data/User;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string p0, "\u5bf9\u65b9\u5df2\u4e0e\u4f60\u89e3\u9664\u914d\u5bf9"

    .line 14
    .line 15
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->b:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "userid"

    .line 24
    .line 25
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "moments_user_id"

    .line 34
    .line 35
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "invite_to_verify_button_status"

    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->c:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    filled-new-array {p1, v0, v1}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v0, "e_ask_to_invite_other_verify"

    .line 52
    .line 53
    const-string v1, "p_chat_view"

    .line 54
    .line 55
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->InviationForAuthenticationTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->getLong(Ljava/lang/String;)J

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    const-wide/16 v2, 0x0

    .line 69
    .line 70
    cmp-long p1, v0, v2

    .line 71
    .line 72
    if-lez p1, :cond_1

    .line 73
    .line 74
    invoke-static {}, Ll/pzi0;->o()J

    .line 75
    .line 76
    .line 77
    move-result-wide v2

    .line 78
    sub-long/2addr v2, v0

    .line 79
    const-wide/32 v0, 0xf731400

    .line 80
    .line 81
    .line 82
    cmp-long p1, v2, v0

    .line 83
    .line 84
    if-gez p1, :cond_1

    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->g:Lv/VText;

    .line 89
    .line 90
    const-string v0, "#33000000"

    .line 91
    .line 92
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->g:Lv/VText;

    .line 102
    .line 103
    const-string p1, "\u9080\u8bf7\u5df2\u53d1\u9001"

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->d:Ll/g900;

    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->b()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 120
    .line 121
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 122
    .line 123
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->th(Ljava/lang/String;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {p1, v0, v1}, Ll/l900;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a$a;

    .line 134
    .line 135
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;)V

    .line 136
    .line 137
    .line 138
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a$b;

    .line 139
    .line 140
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 148
    .line 149
    .line 150
    return-void
.end method
