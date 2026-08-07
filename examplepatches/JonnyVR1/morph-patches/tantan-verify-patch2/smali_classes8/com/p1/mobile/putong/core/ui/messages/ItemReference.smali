.class public Lcom/p1/mobile/putong/core/ui/messages/ItemReference;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemReference;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Ll/kcg0;

.field public h:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->h:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 12
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->h:Lrx/subjects/b;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 14
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->h:Lrx/subjects/b;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemReference;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->i()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemReference;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->n(Ll/pf60;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemReference;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->l(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/messages/ItemReference;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->j(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/messages/ItemReference;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->k(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ll/r97;->l()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    return-object v0
.end method

.method private setReferenceShow(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->f:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->b:Lv/VText;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/high16 p1, 0x41600000    # 14.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->setReferenceShow(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->g:Ll/kcg0;

    .line 22
    .line 23
    invoke-static {v3}, Ll/psd0;->z(Ll/kcg0;)V

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->i:Ll/kcg0;

    .line 27
    .line 28
    invoke-static {v3}, Ll/psd0;->z(Ll/kcg0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v3}, Ll/clz;->t7()Ll/qzz;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, Ll/qzz;->j0()Ll/g900;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->h:Lrx/subjects/b;

    .line 44
    .line 45
    invoke-virtual {v3, v2, v4}, Ll/l900;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    new-instance v4, Ll/qfq;

    .line 50
    .line 51
    invoke-direct {v4, p0}, Ll/qfq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemReference;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {v3, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->i:Ll/kcg0;

    .line 63
    .line 64
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v3}, Ll/clz;->t7()Ll/qzz;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {v3}, Ll/qzz;->j0()Ll/g900;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 79
    .line 80
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v4, v5, v1}, Lcom/p1/mobile/putong/core/api/g;->Zo(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    new-instance v4, Ll/rfq;

    .line 87
    .line 88
    invoke-direct {v4, p0}, Ll/rfq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemReference;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v1, Ll/sfq;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/sfq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemReference;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v3, v2, v0}, Ll/l900;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v1, Ll/tfq;

    .line 113
    .line 114
    invoke-direct {v1, p0}, Ll/tfq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemReference;)V

    .line 115
    .line 116
    .line 117
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->g:Ll/kcg0;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_0
    const/4 v0, 0x0

    .line 129
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->setReferenceShow(Z)V

    .line 130
    .line 131
    .line 132
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 133
    .line 134
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 135
    .line 136
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 137
    .line 138
    .line 139
    sget p1, Ll/tye;->c:I

    .line 140
    .line 141
    invoke-static {v0, p1}, Ll/tye;->e(Landroid/text/SpannableStringBuilder;I)Landroid/text/SpannableStringBuilder;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->b:Lv/VText;

    .line 146
    .line 147
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 3
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
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->c:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/pfq;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/pfq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemReference;)V

    .line 14
    .line 15
    .line 16
    sget p0, Ll/ibc0;->x1:I

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-static {v0, v1, p0, v2}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p0}, [Ll/ovb0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public final synthetic i()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic j(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->setReferenceShow(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->h:Lrx/subjects/b;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->o(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/ufq;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ll/ufq;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic n(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->c:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->d:Lv/VText;

    .line 31
    .line 32
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->S4:I

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 39
    .line 40
    const-string v1, "deleted"

    .line 41
    .line 42
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->d:Lv/VText;

    .line 47
    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    const-string p1, "\u5f15\u7528\u5185\u5bb9\u5df2\u5220\u9664"

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p1}, Ll/jek;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ")",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance p1, Ll/hh7;

    .line 28
    .line 29
    invoke-direct {p1}, Ll/hh7;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance p1, Ll/vfq;

    .line 37
    .line 38
    invoke-direct {p1}, Ll/vfq;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 49
    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance v0, Ll/wfq;

    .line 57
    .line 58
    invoke-direct {v0, p1}, Ll/wfq;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p1, Ll/hh7;

    .line 66
    .line 67
    invoke-direct {p1}, Ll/hh7;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    new-instance p1, Ll/vfq;

    .line 75
    .line 76
    invoke-direct {p1}, Ll/vfq;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    new-instance p1, Ll/xfq;

    .line 95
    .line 96
    invoke-direct {p1}, Ll/xfq;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->Z:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemReference;

    .line 13
    .line 14
    sget v0, Ll/edc0;->O3:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->c:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/edc0;->P3:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VText;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->d:Lv/VText;

    .line 33
    .line 34
    sget v0, Ll/edc0;->g:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VText;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->b:Lv/VText;

    .line 43
    .line 44
    sget v0, Ll/edc0;->M3:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->e:Landroid/view/View;

    .line 51
    .line 52
    sget v0, Ll/edc0;->N3:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->f:Landroid/view/View;

    .line 59
    .line 60
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_0

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->b:Lv/VText;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    sget v1, Ll/g9c0;->j:I

    .line 81
    .line 82
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 87
    .line 88
    .line 89
    :cond_0
    return-void
.end method
