.class public Ll/tnk$b;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tnk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
        ">;"
    }
.end annotation


# instance fields
.field public c:I

.field public final d:I

.field public final e:I

.field public f:Ll/w30;

.field public final synthetic g:Ll/tnk;


# direct methods
.method public constructor <init>(Ll/tnk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Ll/tnk$b;->c:I

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput p1, p0, Ll/tnk$b;->d:I

    .line 11
    .line 12
    const/4 p1, 0x2

    .line 13
    iput p1, p0, Ll/tnk$b;->e:I

    .line 14
    .line 15
    return-void
.end method

.method public synthetic constructor <init>(Ll/tnk;Ll/aok;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Ll/tnk$b;-><init>(Ll/tnk;)V

    return-void
.end method

.method public static synthetic E(Ll/tnk$b;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/tnk$b;->M(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/tnk$b;ILcom/p1/mobile/putong/core/data/ChatGroup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/tnk$b;->N(ILcom/p1/mobile/putong/core/data/ChatGroup;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/tnk$b;Lcom/p1/mobile/putong/core/data/ChatGroupMember;IZLv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/tnk$b;->P(Lcom/p1/mobile/putong/core/data/ChatGroupMember;IZLv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic H(ZLl/uxj0;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->U:I

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->e6:I

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic I(Ll/tnk$b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tnk$b;->O(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic J(Ll/tnk$b;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tnk$b;->R(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/tnk$b;->K(Landroid/view/View;Lcom/p1/mobile/putong/core/data/ChatGroupMember;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tnk;->c(Ll/tnk;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tnk;->b(Ll/tnk;)Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x2

    .line 12
    if-ne p2, v0, :cond_0

    .line 13
    .line 14
    sget p2, Ll/qec0;->o0:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget p2, Ll/qec0;->p0:I

    .line 18
    .line 19
    :goto_0
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public K(Landroid/view/View;Lcom/p1/mobile/putong/core/data/ChatGroupMember;II)V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p3, v0, :cond_2

    .line 3
    .line 4
    sget p3, Ll/edc0;->p:I

    .line 5
    .line 6
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    check-cast p3, Lv/VDraweeView;

    .line 11
    .line 12
    sget v0, Ll/edc0;->E2:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lv/VText;

    .line 19
    .line 20
    sget v1, Ll/edc0;->B:I

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lv/VText;

    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 31
    .line 32
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    invoke-static {v1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    sget v2, Ll/ibc0;->I0:I

    .line 51
    .line 52
    invoke-virtual {p3, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 53
    .line 54
    .line 55
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 56
    .line 57
    invoke-static {p2}, Ll/jek;->j(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v2, p3, v3}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-nez v2, :cond_1

    .line 72
    .line 73
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 74
    .line 75
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v2, p3, v3}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 82
    .line 83
    sget v3, Ll/ibc0;->I0:I

    .line 84
    .line 85
    invoke-virtual {v2, p3, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 86
    .line 87
    .line 88
    :goto_0
    new-instance v2, Ll/unk;

    .line 89
    .line 90
    invoke-direct {v2, p0, v1, p2}, Ll/unk;-><init>(Ll/tnk$b;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    .line 91
    .line 92
    .line 93
    invoke-static {p3, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    new-instance p2, Ll/vnk;

    .line 104
    .line 105
    invoke-direct {p2, p0, p4, v1}, Ll/vnk;-><init>(Ll/tnk$b;ILcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_2
    sget p0, Ll/edc0;->e1:I

    .line 113
    .line 114
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    check-cast p0, Lv/VText;

    .line 119
    .line 120
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public L(I)Lcom/p1/mobile/putong/core/data/ChatGroupMember;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tnk;->c(Ll/tnk;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 12
    .line 13
    return-object p0
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string p1, "chat_group_anonymity"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p1, "chat_group"

    .line 17
    .line 18
    :goto_0
    iget-object p3, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 19
    .line 20
    invoke-static {p3}, Ll/tnk;->b(Ll/tnk;)Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p3, p2, p1}, Ll/jek;->e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 31
    .line 32
    invoke-static {p0}, Ll/tnk;->b(Ll/tnk;)Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic N(ILcom/p1/mobile/putong/core/data/ChatGroup;Landroid/view/View;)V
    .locals 0

    .line 1
    iget p2, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/tnk$b;->Q(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tnk$b;->f:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/core/data/ChatGroupMember;IZLv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p4, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 2
    .line 3
    invoke-static {p4}, Ll/tnk;->e(Ll/tnk;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    if-nez p4, :cond_0

    .line 12
    .line 13
    iget-object p4, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 14
    .line 15
    invoke-static {p4}, Ll/tnk;->d(Ll/tnk;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result p4

    .line 23
    if-nez p4, :cond_0

    .line 24
    .line 25
    iget-object p4, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 26
    .line 27
    invoke-static {p4}, Ll/tnk;->e(Ll/tnk;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    invoke-interface {p4, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p4

    .line 35
    if-eqz p4, :cond_0

    .line 36
    .line 37
    iget-object p4, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 38
    .line 39
    invoke-static {p4}, Ll/tnk;->d(Ll/tnk;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p4

    .line 43
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result p4

    .line 47
    if-ne p4, p2, :cond_0

    .line 48
    .line 49
    const-string p1, "\u7ba1\u7406\u5458\u5df2\u8fbe\u4e0a\u9650"

    .line 50
    .line 51
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_0
    iget-object p2, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 56
    .line 57
    invoke-static {p2}, Ll/tnk;->b(Ll/tnk;)Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 64
    .line 65
    iget-object p5, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz p3, :cond_1

    .line 70
    .line 71
    const-string p6, "remove"

    .line 72
    .line 73
    :goto_0
    invoke-static {p6}, Lcom/p1/mobile/putong/core/data/Action;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Action;

    .line 74
    .line 75
    .line 76
    move-result-object p6

    .line 77
    goto :goto_1

    .line 78
    :cond_1
    const-string p6, "add"

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :goto_1
    invoke-virtual {p4, p5, p1, p6}, Lcom/p1/mobile/putong/core/api/e;->S6(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Action;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p2, p1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    new-instance p2, Ll/ynk;

    .line 90
    .line 91
    invoke-direct {p2}, Ll/ynk;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    new-instance p2, Ll/znk;

    .line 99
    .line 100
    invoke-direct {p2, p3}, Ll/znk;-><init>(Z)V

    .line 101
    .line 102
    .line 103
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 104
    .line 105
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 106
    .line 107
    .line 108
    move-result-object p3

    .line 109
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    new-instance p4, Ll/oik;

    .line 113
    .line 114
    invoke-direct {p4, p3}, Ll/oik;-><init>(Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;)V

    .line 115
    .line 116
    .line 117
    invoke-static {p2, p4}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 122
    .line 123
    .line 124
    :goto_2
    iget-object p0, p0, Ll/tnk$b;->f:Ll/w30;

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public final Q(II)V
    .locals 5

    .line 1
    invoke-virtual {p0, p1}, Ll/tnk$b;->L(I)Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/w30$b;

    .line 6
    .line 7
    iget-object v2, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 8
    .line 9
    invoke-static {v2}, Ll/tnk;->b(Ll/tnk;)Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 17
    .line 18
    invoke-static {v2}, Ll/tnk;->b(Ll/tnk;)Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->a:I

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1, v2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/wnk;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/wnk;-><init>(Ll/tnk$b;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 41
    .line 42
    .line 43
    new-instance v2, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    iget v3, p0, Ll/tnk$b;->c:I

    .line 49
    .line 50
    if-ge p1, v3, :cond_0

    .line 51
    .line 52
    const/4 p1, 0x1

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const/4 p1, 0x0

    .line 55
    :goto_0
    iget-object v3, p0, Ll/tnk$b;->g:Ll/tnk;

    .line 56
    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    invoke-interface {v3}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->T:I

    .line 64
    .line 65
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    invoke-interface {v3}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->V:I

    .line 75
    .line 76
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    :goto_1
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, v2}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 84
    .line 85
    .line 86
    new-instance v2, Ll/xnk;

    .line 87
    .line 88
    invoke-direct {v2, p0, v0, p2, p1}, Ll/xnk;-><init>(Ll/tnk$b;Lcom/p1/mobile/putong/core/data/ChatGroupMember;IZ)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iput-object p1, p0, Ll/tnk$b;->f:Ll/w30;

    .line 99
    .line 100
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final R(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/tnk$b;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tnk$b;->L(I)Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget p0, p0, Ll/tnk$b;->c:I

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x2

    .line 9
    return p0

    .line 10
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method
