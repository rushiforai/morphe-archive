.class public Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VRecyclerView;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VText;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VEditText;

.field public m:Landroid/widget/TextView;

.field public n:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;

.field public o:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ll/kcg0;

.field public q:Ljava/lang/String;

.field public r:Lcom/p1/mobile/putong/data/User;

.field public s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LetterWrapper;",
            ">;"
        }
    .end annotation
.end field

.field public t:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LetterWrapper;",
            ">;"
        }
    .end annotation
.end field

.field public u:Z

.field public final v:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->s:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->t:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->v:Ll/z20;

    .line 24
    .line 25
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->s:Ljava/util/List;

    .line 35
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->t:Ljava/util/List;

    .line 36
    new-instance p2, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;

    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->v:Ll/z20;

    .line 37
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->s:Ljava/util/List;

    .line 40
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->t:Ljava/util/List;

    .line 41
    new-instance p2, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;

    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$d;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->v:Ll/z20;

    .line 42
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->x()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->y(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->t(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->v()V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->z()V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->s(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->o:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->n:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;

    return-object p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->q:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->r:Lcom/p1/mobile/putong/data/User;

    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->A()V

    return-void
.end method


# virtual methods
.method public final A()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Q2:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance v0, Ll/ldr;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/ldr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Ll/mdr;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/mdr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 35
    .line 36
    .line 37
    const-string v2, "spotlight_messages"

    .line 38
    .line 39
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->q:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_2

    .line 46
    .line 47
    const-string v0, "e_spotlight_msg_send_button"

    .line 48
    .line 49
    const-string v2, "p_spotlight_chat_popup"

    .line 50
    .line 51
    invoke-static {v0, v2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 57
    .line 58
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v0, v2}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Vi:I

    .line 87
    .line 88
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Ti:I

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Si:I

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Ui:I

    .line 105
    .line 106
    new-instance v2, Ll/bri0;

    .line 107
    .line 108
    invoke-direct {v2, v1}, Ll/bri0;-><init>(Ll/x20;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_1
    invoke-interface {v1}, Ll/x20;->call()V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_2
    const-string v1, "e_letter_send_button"

    .line 124
    .line 125
    const-string v2, "p_letter_sentmessage_page"

    .line 126
    .line 127
    invoke-static {v1, v2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-static {}, Ll/d79;->j0()Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-eqz v1, :cond_3

    .line 135
    .line 136
    invoke-interface {v0}, Ll/x20;->call()V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_3
    invoke-static {}, Ll/joa;->M3()Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-nez v1, :cond_5

    .line 145
    .line 146
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->u:Z

    .line 147
    .line 148
    const-string v1, "letter"

    .line 149
    .line 150
    if-eqz v0, :cond_4

    .line 151
    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 165
    .line 166
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 167
    .line 168
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 185
    .line 186
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 187
    .line 188
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    :cond_5
    invoke-interface {v0}, Ll/x20;->call()V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public final B()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->t:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x5

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->s:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lcom/p1/mobile/putong/data/LetterWrapper;

    .line 27
    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->t:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-nez v3, :cond_0

    .line 35
    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->t:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->t:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    new-instance v0, Ljava/util/Random;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 54
    .line 55
    .line 56
    new-instance v2, Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .line 60
    .line 61
    const/4 v3, 0x0

    .line 62
    move v4, v3

    .line 63
    :goto_1
    if-ge v4, v1, :cond_3

    .line 64
    .line 65
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->t:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    invoke-virtual {v0, v5}, Ljava/util/Random;->nextInt(I)I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->t:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    check-cast v5, Lcom/p1/mobile/putong/data/LetterWrapper;

    .line 82
    .line 83
    iput-boolean v3, v5, Lcom/p1/mobile/putong/data/LetterWrapper;->select:Z

    .line 84
    .line 85
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->t:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v6, v5}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    add-int/lit8 v4, v4, 0x1

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->n:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->q:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v0, v2, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->J(Ljava/util/List;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 4

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->u:Z

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->r:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const-string v0, " "

    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    new-instance p2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget v2, Lcom/p1/mobile/putong/core/R$string;->l3:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    sget v2, Lcom/p1/mobile/putong/core/R$string;->k3:I

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->g:Landroid/widget/TextView;

    .line 73
    .line 74
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->a:Lv/VDraweeView;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const/4 v2, 0x1

    .line 90
    invoke-virtual {p2, v0, v1, v2}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 91
    .line 92
    .line 93
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->b:Landroid/widget/TextView;

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->d:Lv/VText;

    .line 101
    .line 102
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 103
    .line 104
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    const/4 v3, 0x0

    .line 111
    invoke-static {p2, v0, v1, v3, p1}, Ll/rgk0;->d(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/Gender;IZLcom/p1/mobile/putong/data/User;)V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Ll/r43;->b()Z

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    const/high16 v0, 0x40800000    # 4.0f

    .line 119
    .line 120
    if-eqz p2, :cond_1

    .line 121
    .line 122
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 123
    .line 124
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 125
    .line 126
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 127
    .line 128
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 129
    .line 130
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    if-nez p2, :cond_2

    .line 135
    .line 136
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->e:Lv/VText;

    .line 137
    .line 138
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 139
    .line 140
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 141
    .line 142
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 143
    .line 144
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 145
    .line 146
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    check-cast v1, Lcom/p1/mobile/putong/data/BloodType;

    .line 151
    .line 152
    invoke-static {v1}, Ll/r43;->a(Lcom/p1/mobile/putong/data/BloodType;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    .line 158
    .line 159
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->e:Lv/VText;

    .line 160
    .line 161
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 162
    .line 163
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 164
    .line 165
    invoke-static {v1}, Ll/q8g0;->l0(Lcom/p1/mobile/putong/data/ProfileZodiac;)I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    int-to-float v0, v0

    .line 174
    invoke-static {v1, v0}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->e:Lv/VText;

    .line 183
    .line 184
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 185
    .line 186
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 187
    .line 188
    invoke-static {v1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->e:Lv/VText;

    .line 196
    .line 197
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 198
    .line 199
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 200
    .line 201
    invoke-static {v1}, Ll/q8g0;->l0(Lcom/p1/mobile/putong/data/ProfileZodiac;)I

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    int-to-float v0, v0

    .line 210
    invoke-static {v1, v0}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 215
    .line 216
    .line 217
    :cond_2
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 218
    .line 219
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 220
    .line 221
    const-string v1, "female"

    .line 222
    .line 223
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    if-eqz v0, :cond_3

    .line 228
    .line 229
    sget v0, Lcom/p1/mobile/putong/core/R$string;->R2:I

    .line 230
    .line 231
    goto :goto_2

    .line 232
    :cond_3
    sget v0, Lcom/p1/mobile/putong/core/R$string;->S2:I

    .line 233
    .line 234
    :goto_2
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setHint(I)V

    .line 235
    .line 236
    .line 237
    const-string p2, "spotlight_messages"

    .line 238
    .line 239
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->q:Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result p2

    .line 245
    if-eqz p2, :cond_5

    .line 246
    .line 247
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 248
    .line 249
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 250
    .line 251
    .line 252
    move-result p1

    .line 253
    if-eqz p1, :cond_4

    .line 254
    .line 255
    sget p1, Lcom/p1/mobile/putong/core/R$string;->zp:I

    .line 256
    .line 257
    goto :goto_3

    .line 258
    :cond_4
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ap:I

    .line 259
    .line 260
    :goto_3
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setHint(I)V

    .line 261
    .line 262
    .line 263
    const-string p1, "e_spotlight_msg_send_button"

    .line 264
    .line 265
    const-string p2, "p_spotlight_chat_popup"

    .line 266
    .line 267
    invoke-static {p1, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    :try_start_0
    const-class p1, Landroid/widget/TextView;

    .line 271
    .line 272
    const-string p2, "mCursorDrawableRes"

    .line 273
    .line 274
    invoke-virtual {p1, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    invoke-virtual {p1, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 279
    .line 280
    .line 281
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 282
    .line 283
    sget v0, Ll/dbc0;->eq:I

    .line 284
    .line 285
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 290
    .line 291
    .line 292
    :catch_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->f:Lv/VImage;

    .line 293
    .line 294
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 295
    .line 296
    .line 297
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->g:Landroid/widget/TextView;

    .line 298
    .line 299
    const-string p2, "#44C5FF"

    .line 300
    .line 301
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 302
    .line 303
    .line 304
    move-result p2

    .line 305
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 306
    .line 307
    .line 308
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->g:Landroid/widget/TextView;

    .line 309
    .line 310
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 311
    .line 312
    .line 313
    move-result-object p2

    .line 314
    sget v0, Ll/dbc0;->D8:I

    .line 315
    .line 316
    invoke-virtual {p2, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 317
    .line 318
    .line 319
    move-result-object p2

    .line 320
    const/4 v0, 0x0

    .line 321
    invoke-virtual {p1, p2, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 322
    .line 323
    .line 324
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->i:Landroid/widget/TextView;

    .line 325
    .line 326
    const-string p2, "#33000000"

    .line 327
    .line 328
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 329
    .line 330
    .line 331
    move-result p2

    .line 332
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 333
    .line 334
    .line 335
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->i:Landroid/widget/TextView;

    .line 336
    .line 337
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 338
    .line 339
    .line 340
    move-result-object p2

    .line 341
    sget v1, Ll/dbc0;->fq:I

    .line 342
    .line 343
    invoke-virtual {p2, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 344
    .line 345
    .line 346
    move-result-object p2

    .line 347
    invoke-virtual {p1, p2, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 348
    .line 349
    .line 350
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->m:Landroid/widget/TextView;

    .line 351
    .line 352
    sget p2, Ll/dbc0;->cq:I

    .line 353
    .line 354
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 355
    .line 356
    .line 357
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->m:Landroid/widget/TextView;

    .line 358
    .line 359
    sget p2, Lcom/p1/mobile/putong/core/R$string;->v:I

    .line 360
    .line 361
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 362
    .line 363
    .line 364
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->m:Landroid/widget/TextView;

    .line 365
    .line 366
    const/high16 p2, 0x42960000    # 75.0f

    .line 367
    .line 368
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 369
    .line 370
    .line 371
    move-result p2

    .line 372
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 373
    .line 374
    .line 375
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->m:Landroid/widget/TextView;

    .line 376
    .line 377
    const-string p2, "#66ffffff"

    .line 378
    .line 379
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 380
    .line 381
    .line 382
    move-result p2

    .line 383
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 384
    .line 385
    .line 386
    new-instance p1, Landroid/text/SpannableStringBuilder;

    .line 387
    .line 388
    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 389
    .line 390
    .line 391
    new-instance p2, Ljava/lang/StringBuilder;

    .line 392
    .line 393
    const-string v0, "* "

    .line 394
    .line 395
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Bp:I

    .line 403
    .line 404
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    .line 410
    .line 411
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object p2

    .line 415
    new-instance v0, Landroid/text/SpannableString;

    .line 416
    .line 417
    invoke-direct {v0, p2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 418
    .line 419
    .line 420
    new-instance p2, Landroid/text/style/ForegroundColorSpan;

    .line 421
    .line 422
    const-string v1, "#d34530"

    .line 423
    .line 424
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 425
    .line 426
    .line 427
    move-result v1

    .line 428
    invoke-direct {p2, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 429
    .line 430
    .line 431
    const/4 v1, 0x2

    .line 432
    const/16 v2, 0x21

    .line 433
    .line 434
    invoke-virtual {v0, p2, v3, v1, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 435
    .line 436
    .line 437
    invoke-virtual {p1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 438
    .line 439
    .line 440
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->k:Landroid/widget/TextView;

    .line 441
    .line 442
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 443
    .line 444
    .line 445
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->B()V

    .line 446
    .line 447
    .line 448
    invoke-static {}, Ll/d79;->j0()Z

    .line 449
    .line 450
    .line 451
    move-result p1

    .line 452
    if-eqz p1, :cond_6

    .line 453
    .line 454
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->D()V

    .line 455
    .line 456
    .line 457
    :cond_6
    return-void
.end method

.method public final D()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->j:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Na:I

    .line 8
    .line 9
    invoke-static {}, Ll/joa;->A4()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public getEditTextView()Lv/VEditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->r()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qdr;->b(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/vx6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final r()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->m:Landroid/widget/TextView;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->W2:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->n:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;

    .line 18
    .line 19
    new-instance v1, Ll/gdr;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/gdr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->K(Ll/y20;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->h:Lv/VRecyclerView;

    .line 28
    .line 29
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->h:Lv/VRecyclerView;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->n:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->m:Landroid/widget/TextView;

    .line 49
    .line 50
    new-instance v1, Ll/hdr;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/hdr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->k:Landroid/widget/TextView;

    .line 59
    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v2, "* "

    .line 63
    .line 64
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Bp:I

    .line 72
    .line 73
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const-string v2, "#d34530"

    .line 85
    .line 86
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    const-string v3, "\\*"

    .line 91
    .line 92
    const/4 v4, 0x0

    .line 93
    invoke-static {v1, v3, v2, v4}, Ll/e1b;->T0(Ljava/lang/String;Ljava/lang/String;ILl/qcj;)Landroid/text/SpannableStringBuilder;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 101
    .line 102
    const/4 v1, 0x0

    .line 103
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 107
    .line 108
    const/4 v2, 0x4

    .line 109
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 113
    .line 114
    new-instance v2, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$a;

    .line 115
    .line 116
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$a;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 123
    .line 124
    const/16 v2, 0x41

    .line 125
    .line 126
    invoke-virtual {v0, v2}, Lv/VEditText;->setMaxLength(I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 130
    .line 131
    new-instance v2, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$b;

    .line 132
    .line 133
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$b;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->i:Landroid/widget/TextView;

    .line 140
    .line 141
    sget v2, Lcom/p1/mobile/putong/core/R$string;->X2:I

    .line 142
    .line 143
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->i:Landroid/widget/TextView;

    .line 147
    .line 148
    new-instance v2, Ll/idr;

    .line 149
    .line 150
    invoke-direct {v2, p0}, Ll/idr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    invoke-static {}, Ll/d79;->j0()Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-eqz v0, :cond_1

    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->k:Landroid/widget/TextView;

    .line 163
    .line 164
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->f:Lv/VImage;

    .line 168
    .line 169
    const/4 v2, 0x1

    .line 170
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->g:Landroid/widget/TextView;

    .line 174
    .line 175
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    sget v5, Ll/dbc0;->Hp:I

    .line 180
    .line 181
    invoke-virtual {v3, v5}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    invoke-virtual {v0, v3, v4, v4, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->g:Landroid/widget/TextView;

    .line 189
    .line 190
    const-string v3, "#ff6f49"

    .line 191
    .line 192
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->i:Landroid/widget/TextView;

    .line 200
    .line 201
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    sget v5, Ll/dbc0;->Ip:I

    .line 206
    .line 207
    invoke-virtual {v3, v5}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-virtual {v0, v3, v4, v4, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->m:Landroid/widget/TextView;

    .line 215
    .line 216
    sget v3, Ll/dbc0;->Gp:I

    .line 217
    .line 218
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 219
    .line 220
    .line 221
    invoke-static {}, Ll/rbb0;->i()J

    .line 222
    .line 223
    .line 224
    move-result-wide v3

    .line 225
    const-wide/16 v5, 0x0

    .line 226
    .line 227
    cmp-long v0, v3, v5

    .line 228
    .line 229
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->j:Lv/VText;

    .line 230
    .line 231
    if-lez v0, :cond_0

    .line 232
    .line 233
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :cond_0
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 238
    .line 239
    .line 240
    :cond_1
    return-void
.end method

.method public final synthetic s(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/TextView;->length()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setCloseClick(Ll/x20;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->f:Lv/VImage;

    .line 2
    .line 3
    new-instance v0, Ll/fdr;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/fdr;-><init>(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLetterWrapperLibraries(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LetterWrapper;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->s:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->s:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setSendClickCallBack(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->o:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic t(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Ll/jdr;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/jdr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 p0, 0x64

    .line 9
    .line 10
    invoke-virtual {v0, v1, p0, p1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->A()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/TextView;->length()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->B()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 5
    .line 6
    new-instance v0, Ll/kdr;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/kdr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 9
    .line 10
    .line 11
    const-wide/16 v1, 0x64

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic x()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p:Ll/kcg0;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p:Ll/kcg0;

    .line 24
    .line 25
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->L0:Ll/se9;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ll/se9;->g3(Ljava/lang/String;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$c;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$c;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/psd0;->L(Ll/bb50;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p:Ll/kcg0;

    .line 61
    .line 62
    return-void
.end method

.method public final synthetic y(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->m:Landroid/widget/TextView;

    .line 2
    .line 3
    const-string v0, "#66ffffff"

    .line 4
    .line 5
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->o:Ll/y20;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->o:Ll/y20;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final synthetic z()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p:Ll/kcg0;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p:Ll/kcg0;

    .line 24
    .line 25
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->K0:Ll/cza;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->r:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->v:Ll/z20;

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2, v3}, Ll/cza;->v3(Ljava/lang/String;Ljava/lang/String;Ll/z20;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/ndr;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/ndr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 56
    .line 57
    .line 58
    new-instance v2, Ll/odr;

    .line 59
    .line 60
    invoke-direct {v2}, Ll/odr;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->p:Ll/kcg0;

    .line 72
    .line 73
    return-void
.end method
