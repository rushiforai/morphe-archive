.class public Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;

.field public d:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

.field public e:Lv/VLinear;

.field public f:Lv/VLinear;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->W(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->X(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x3

    .line 15
    new-array v3, v2, [Ljava/lang/CharSequence;

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    aput-object v0, v3, v4

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    const-string v5, "_"

    .line 22
    .line 23
    aput-object v5, v3, v0

    .line 24
    .line 25
    const/4 v6, 0x2

    .line 26
    aput-object v1, v3, v6

    .line 27
    .line 28
    invoke-static {v3}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->g:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    new-array v2, v2, [Ljava/lang/CharSequence;

    .line 47
    .line 48
    aput-object v1, v2, v4

    .line 49
    .line 50
    aput-object v5, v2, v0

    .line 51
    .line 52
    aput-object v3, v2, v6

    .line 53
    .line 54
    invoke-static {v2}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->h:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;)Ljava/util/HashSet;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_1

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->g:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_0

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->h:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-eqz v1, :cond_1

    .line 101
    .line 102
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->g:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->h:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->Y(Lcom/p1/mobile/putong/core/data/Message;ZZ)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    invoke-virtual {p0, p1, v4, v4}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->Y(Lcom/p1/mobile/putong/core/data/Message;ZZ)V

    .line 119
    .line 120
    .line 121
    :goto_0
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {p0}, Ll/k900;->e(Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-nez p0, :cond_2

    .line 128
    .line 129
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {p0}, Ll/k900;->b(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    const-string p0, "chat_feedback_answers"

    .line 135
    .line 136
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 137
    .line 138
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    const-string v0, "message_id"

    .line 143
    .line 144
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    const-string v0, "message_send_status"

    .line 151
    .line 152
    const-string v1, "1"

    .line 153
    .line 154
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    filled-new-array {p0, p1, v0}, [Ll/pf60;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    const-string p1, "e_chat_feedback"

    .line 163
    .line 164
    const-string v0, "p_chat_view"

    .line 165
    .line 166
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 167
    .line 168
    .line 169
    :cond_2
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

.method public final T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xgq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final V(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->g:Ljava/lang/String;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->h:Ljava/lang/String;

    .line 7
    .line 8
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "good"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->Z(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x0

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->Y(Lcom/p1/mobile/putong/core/data/Message;ZZ)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->V(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->D3:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0, v0, v0}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "bad"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->Z(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->Y(Lcom/p1/mobile/putong/core/data/Message;ZZ)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->V(Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p1, p0}, Ll/r97;->E1(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final Y(Lcom/p1/mobile/putong/core/data/Message;ZZ)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_1

    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move v1, v0

    .line 8
    goto :goto_1

    .line 9
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 10
    :goto_1
    move v2, v0

    .line 11
    :goto_2
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->f:Lv/VLinear;

    .line 12
    .line 13
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-ge v2, v3, :cond_2

    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->f:Lv/VLinear;

    .line 20
    .line 21
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    xor-int/lit8 v4, v1, 0x1

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3, p2}, Landroid/view/View;->setSelected(Z)V

    .line 31
    .line 32
    .line 33
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_2
    :goto_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->e:Lv/VLinear;

    .line 37
    .line 38
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-ge v0, p2, :cond_3

    .line 43
    .line 44
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->e:Lv/VLinear;

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    xor-int/lit8 v2, v1, 0x1

    .line 51
    .line 52
    invoke-virtual {p2, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2, p3}, Landroid/view/View;->setSelected(Z)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 v0, v0, 0x1

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->f:Lv/VLinear;

    .line 62
    .line 63
    if-nez v1, :cond_4

    .line 64
    .line 65
    new-instance p3, Ll/tgq;

    .line 66
    .line 67
    invoke-direct {p3, p0, p1}, Ll/tgq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->e:Lv/VLinear;

    .line 74
    .line 75
    new-instance p3, Ll/ugq;

    .line 76
    .line 77
    invoke-direct {p3, p0, p1}, Ll/ugq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    new-instance p1, Ll/vgq;

    .line 85
    .line 86
    invoke-direct {p1}, Ll/vgq;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-static {p2, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->e:Lv/VLinear;

    .line 93
    .line 94
    new-instance p1, Ll/wgq;

    .line 95
    .line 96
    invoke-direct {p1}, Ll/wgq;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final Z(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "chat_feedback_answers"

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "chat_feedback_operate"

    .line 10
    .line 11
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const-string v0, "message_id"

    .line 16
    .line 17
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "message_send_status"

    .line 24
    .line 25
    const-string v1, "1"

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    filled-new-array {p0, p2, p1, v0}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "e_chat_feedback_operate"

    .line 36
    .line 37
    const-string p2, "p_chat_view"

    .line 38
    .line 39
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;->T(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
