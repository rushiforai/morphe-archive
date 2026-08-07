.class public Ll/upe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/upe0$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ope0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VEditText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VEditText;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Ll/ope0;

.field public s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

.field public t:Z

.field public u:Ljava/text/DecimalFormat;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/upe0;->t:Z

    .line 6
    .line 7
    new-instance v0, Ljava/text/DecimalFormat;

    .line 8
    .line 9
    const-string v1, "0.00"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/upe0;->u:Ljava/text/DecimalFormat;

    .line 15
    .line 16
    iput-object p1, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/upe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/upe0;->u()V

    return-void
.end method

.method public static synthetic b(Ll/upe0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/upe0;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/upe0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/upe0;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/upe0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/upe0;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/upe0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/upe0;->p(Landroid/view/View;)V

    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/upe0;->x(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/upe0;->x(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 5

    .line 1
    iget-boolean p1, p0, Ll/upe0;->t:Z

    .line 2
    .line 3
    iget-object v0, p0, Ll/upe0;->g:Lv/VEditText;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {v0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    iget-object p1, p0, Ll/upe0;->k:Lv/VEditText;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    int-to-double v2, p1

    .line 43
    mul-double/2addr v0, v2

    .line 44
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    :goto_0
    iget-object v0, p0, Ll/upe0;->r:Ll/ope0;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/ope0;->q0()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "groupchat_id"

    .line 55
    .line 56
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-boolean v1, p0, Ll/upe0;->t:Z

    .line 61
    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    const-string v1, "luck_red_packet"

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    const-string v1, "normal_red_packet"

    .line 68
    .line 69
    :goto_1
    const-string v2, "red_packet_type"

    .line 70
    .line 71
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    const-string v2, "red_packet_amount"

    .line 76
    .line 77
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    iget-object v3, p0, Ll/upe0;->k:Lv/VEditText;

    .line 82
    .line 83
    invoke-virtual {v3}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    const-string v4, "red_packet_quantity"

    .line 92
    .line 93
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    filled-new-array {v0, v1, v2, v3}, [Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const-string v1, "e_pay_red_packet"

    .line 102
    .line 103
    const-string v2, "p_red_packet"

    .line 104
    .line 105
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 114
    .line 115
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const/4 v2, 0x1

    .line 122
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/upe0;->r:Ll/ope0;

    .line 126
    .line 127
    iget-boolean v1, p0, Ll/upe0;->t:Z

    .line 128
    .line 129
    iget-object p0, p0, Ll/upe0;->k:Lv/VEditText;

    .line 130
    .line 131
    invoke-virtual {p0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {v0, v1, p1, p0}, Ll/ope0;->D0(ZLjava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vpe0;->b(Ll/upe0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/upe0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 13
    .line 14
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 15
    .line 16
    const v0, 0xa3b1

    .line 17
    .line 18
    .line 19
    if-ne p1, v0, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->n7:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const v0, 0xa3b2

    .line 28
    .line 29
    .line 30
    if-ne p1, v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 33
    .line 34
    invoke-static {p0}, Ll/tcz;->I(Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m7:I

    .line 39
    .line 40
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m7:I

    .line 45
    .line 46
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ope0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/upe0;->k(Ll/ope0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/upe0;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/pf60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/upe0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/16 v1, 0x2328

    .line 17
    .line 18
    if-ne v1, v0, :cond_0

    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->o7:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string v0, "41905"

    .line 27
    .line 28
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->n7:I

    .line 37
    .line 38
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const-string v0, "41906"

    .line 43
    .line 44
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    iget-object p0, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 53
    .line 54
    invoke-static {p0}, Ll/tcz;->I(Lcom/p1/mobile/android/app/Act;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m7:I

    .line 59
    .line 60
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public k(Ll/ope0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/upe0;->r:Ll/ope0;

    .line 2
    .line 3
    return-void
.end method

.method public l(ZZ)V
    .locals 2

    .line 1
    const-string v0, "#212121"

    .line 2
    .line 3
    const-string v1, "#f15645"

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Ll/upe0;->e:Lv/VText;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/upe0;->g:Lv/VEditText;

    .line 19
    .line 20
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/upe0;->h:Lv/VText;

    .line 28
    .line 29
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/upe0;->g:Lv/VEditText;

    .line 45
    .line 46
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/upe0;->h:Lv/VText;

    .line 54
    .line 55
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object p1, p0, Ll/upe0;->i:Lv/VText;

    .line 64
    .line 65
    if-eqz p2, :cond_2

    .line 66
    .line 67
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/upe0;->k:Lv/VEditText;

    .line 75
    .line 76
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Ll/upe0;->l:Lv/VText;

    .line 84
    .line 85
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_2
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/upe0;->k:Lv/VEditText;

    .line 101
    .line 102
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Ll/upe0;->l:Lv/VText;

    .line 110
    .line 111
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public m(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-wide v3, v1

    .line 15
    :goto_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    const/4 p1, -0x1

    .line 27
    :goto_1
    const/4 p2, 0x1

    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, p2, v0}, Ll/upe0;->l(ZZ)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0, v0}, Ll/upe0;->l(ZZ)V

    .line 33
    .line 34
    .line 35
    iget-object v5, p0, Ll/upe0;->d:Lv/VText;

    .line 36
    .line 37
    invoke-static {v5, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v5, p0, Ll/upe0;->p:Lv/VText;

    .line 41
    .line 42
    cmpl-double v1, v3, v1

    .line 43
    .line 44
    if-lez v1, :cond_2

    .line 45
    .line 46
    if-lez p1, :cond_2

    .line 47
    .line 48
    move v2, p2

    .line 49
    goto :goto_2

    .line 50
    :cond_2
    move v2, v0

    .line 51
    :goto_2
    invoke-virtual {v5, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 52
    .line 53
    .line 54
    iget-boolean v2, p0, Ll/upe0;->t:Z

    .line 55
    .line 56
    const-string v5, "200"

    .line 57
    .line 58
    const-wide/high16 v6, 0x4069000000000000L    # 200.0

    .line 59
    .line 60
    if-eqz v2, :cond_5

    .line 61
    .line 62
    if-lez v1, :cond_3

    .line 63
    .line 64
    if-lez p1, :cond_3

    .line 65
    .line 66
    int-to-double v8, p1

    .line 67
    div-double v8, v3, v8

    .line 68
    .line 69
    cmpl-double v2, v8, v6

    .line 70
    .line 71
    if-lez v2, :cond_3

    .line 72
    .line 73
    iget-object v1, p0, Ll/upe0;->d:Lv/VText;

    .line 74
    .line 75
    invoke-static {v1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Ll/upe0;->p:Lv/VText;

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Ll/upe0;->d:Lv/VText;

    .line 84
    .line 85
    iget-object v2, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 86
    .line 87
    sget v6, Lcom/p1/mobile/putong/core/message/R$string;->D0:I

    .line 88
    .line 89
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    invoke-virtual {v2, v6, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, v0, p2}, Ll/upe0;->l(ZZ)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, p2, p2}, Ll/upe0;->l(ZZ)V

    .line 104
    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_3
    if-lez v1, :cond_4

    .line 108
    .line 109
    if-lez p1, :cond_4

    .line 110
    .line 111
    int-to-double v1, p1

    .line 112
    div-double v1, v3, v1

    .line 113
    .line 114
    const-wide v5, 0x3f847ae147ae147bL    # 0.01

    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    cmpg-double v1, v1, v5

    .line 120
    .line 121
    if-gez v1, :cond_4

    .line 122
    .line 123
    iget-object v1, p0, Ll/upe0;->d:Lv/VText;

    .line 124
    .line 125
    invoke-static {v1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Ll/upe0;->p:Lv/VText;

    .line 129
    .line 130
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Ll/upe0;->d:Lv/VText;

    .line 134
    .line 135
    const-string v2, "\u5355\u4e2a\u7ea2\u5305\u4e0d\u53ef\u4f4e\u4e8e0.01\u5143"

    .line 136
    .line 137
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, v0, p2}, Ll/upe0;->l(ZZ)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0, p2, p2}, Ll/upe0;->l(ZZ)V

    .line 144
    .line 145
    .line 146
    :cond_4
    :goto_3
    const-wide v1, 0x40d3880000000000L    # 20000.0

    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    cmpl-double v1, v3, v1

    .line 152
    .line 153
    if-lez v1, :cond_6

    .line 154
    .line 155
    iget-object v1, p0, Ll/upe0;->d:Lv/VText;

    .line 156
    .line 157
    invoke-static {v1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Ll/upe0;->p:Lv/VText;

    .line 161
    .line 162
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Ll/upe0;->d:Lv/VText;

    .line 166
    .line 167
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->C0:I

    .line 168
    .line 169
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0, p2, p2}, Ll/upe0;->l(ZZ)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0, v0, v0}, Ll/upe0;->l(ZZ)V

    .line 176
    .line 177
    .line 178
    goto :goto_4

    .line 179
    :cond_5
    cmpl-double v1, v3, v6

    .line 180
    .line 181
    if-lez v1, :cond_6

    .line 182
    .line 183
    iget-object v1, p0, Ll/upe0;->d:Lv/VText;

    .line 184
    .line 185
    invoke-static {v1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 186
    .line 187
    .line 188
    iget-object v1, p0, Ll/upe0;->p:Lv/VText;

    .line 189
    .line 190
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 191
    .line 192
    .line 193
    iget-object v1, p0, Ll/upe0;->d:Lv/VText;

    .line 194
    .line 195
    iget-object v2, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 196
    .line 197
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->D0:I

    .line 198
    .line 199
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v4

    .line 203
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p0, p2, p2}, Ll/upe0;->l(ZZ)V

    .line 211
    .line 212
    .line 213
    :cond_6
    :goto_4
    if-nez p1, :cond_7

    .line 214
    .line 215
    iget-object p1, p0, Ll/upe0;->d:Lv/VText;

    .line 216
    .line 217
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 218
    .line 219
    .line 220
    iget-object p1, p0, Ll/upe0;->p:Lv/VText;

    .line 221
    .line 222
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 223
    .line 224
    .line 225
    iget-object p1, p0, Ll/upe0;->d:Lv/VText;

    .line 226
    .line 227
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->C:I

    .line 228
    .line 229
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0, v0, p2}, Ll/upe0;->l(ZZ)V

    .line 233
    .line 234
    .line 235
    return-void

    .line 236
    :cond_7
    const/16 v1, 0x64

    .line 237
    .line 238
    if-le p1, v1, :cond_8

    .line 239
    .line 240
    iget-object p1, p0, Ll/upe0;->d:Lv/VText;

    .line 241
    .line 242
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 243
    .line 244
    .line 245
    iget-object p1, p0, Ll/upe0;->p:Lv/VText;

    .line 246
    .line 247
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 248
    .line 249
    .line 250
    iget-object p1, p0, Ll/upe0;->d:Lv/VText;

    .line 251
    .line 252
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->p0:I

    .line 253
    .line 254
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0, v0, p2}, Ll/upe0;->l(ZZ)V

    .line 258
    .line 259
    .line 260
    :cond_8
    return-void

    .line 261
    :catch_0
    move-exception p0

    .line 262
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 263
    .line 264
    .line 265
    return-void
.end method

.method public r()V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/upe0;->x(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Ll/upe0;->a:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    new-instance v2, Ll/ppe0;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/ppe0;-><init>(Ll/upe0;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/upe0;->q:Lv/VText;

    .line 16
    .line 17
    iget-object v2, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 18
    .line 19
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->u0:I

    .line 20
    .line 21
    const-string v4, "48"

    .line 22
    .line 23
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/upe0;->h:Lv/VText;

    .line 35
    .line 36
    iget-object v2, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 37
    .line 38
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->J0:I

    .line 39
    .line 40
    const-string v4, ""

    .line 41
    .line 42
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v2, v3, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/upe0;->l:Lv/VText;

    .line 54
    .line 55
    iget-object v2, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 56
    .line 57
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->s0:I

    .line 58
    .line 59
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Ll/upe0;->b:Lv/VText;

    .line 71
    .line 72
    new-instance v2, Ll/qpe0;

    .line 73
    .line 74
    invoke-direct {v2, p0}, Ll/qpe0;-><init>(Ll/upe0;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Ll/upe0;->c:Lv/VText;

    .line 81
    .line 82
    new-instance v2, Ll/rpe0;

    .line 83
    .line 84
    invoke-direct {v2, p0}, Ll/rpe0;-><init>(Ll/upe0;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Ll/upe0;->p:Lv/VText;

    .line 91
    .line 92
    const/4 v2, 0x0

    .line 93
    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 94
    .line 95
    .line 96
    new-instance v1, Ll/upe0$c;

    .line 97
    .line 98
    invoke-direct {v1}, Ll/upe0$c;-><init>()V

    .line 99
    .line 100
    .line 101
    new-array v0, v0, [Landroid/text/InputFilter;

    .line 102
    .line 103
    aput-object v1, v0, v2

    .line 104
    .line 105
    iget-object v1, p0, Ll/upe0;->g:Lv/VEditText;

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/upe0;->g:Lv/VEditText;

    .line 111
    .line 112
    new-instance v1, Ll/upe0$a;

    .line 113
    .line 114
    invoke-direct {v1, p0}, Ll/upe0$a;-><init>(Ll/upe0;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ll/upe0;->k:Lv/VEditText;

    .line 121
    .line 122
    new-instance v1, Ll/upe0$b;

    .line 123
    .line 124
    invoke-direct {v1, p0}, Ll/upe0$b;-><init>(Ll/upe0;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/upe0;->p:Lv/VText;

    .line 131
    .line 132
    new-instance v1, Ll/spe0;

    .line 133
    .line 134
    invoke-direct {v1, p0}, Ll/spe0;-><init>(Ll/upe0;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final synthetic u()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/upe0;->r:Ll/ope0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ope0;->p0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "0.00"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/upe0;->o:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-boolean v0, p0, Ll/upe0;->t:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    move-object p1, v1

    .line 27
    goto :goto_0

    .line 28
    :cond_2
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    int-to-double p1, p1

    .line 37
    mul-double/2addr v0, p1

    .line 38
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    :goto_0
    iget-object p2, p0, Ll/upe0;->o:Lv/VText;

    .line 43
    .line 44
    iget-object p0, p0, Ll/upe0;->u:Ljava/text/DecimalFormat;

    .line 45
    .line 46
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    invoke-virtual {p0, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public w(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/upe0;->m:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/upe0;->m:Lv/VText;

    .line 8
    .line 9
    iget-object p0, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 10
    .line 11
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->G0:I

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

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

.method public x(Z)V
    .locals 6

    .line 1
    iput-boolean p1, p0, Ll/upe0;->t:Z

    .line 2
    .line 3
    iget-object v0, p0, Ll/upe0;->g:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/upe0;->k:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p0, v0, v1}, Ll/upe0;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/upe0;->g:Lv/VEditText;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Ll/upe0;->k:Lv/VEditText;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p0, v0, v1}, Ll/upe0;->m(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/upe0;->b:Lv/VText;

    .line 50
    .line 51
    const-string v1, "#212121"

    .line 52
    .line 53
    const/4 v2, -0x1

    .line 54
    const-string v3, "#f15645"

    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    iget-object p1, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 60
    .line 61
    sget v5, Ll/ibc0;->k6:I

    .line 62
    .line 63
    invoke-virtual {p1, v5}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/upe0;->b:Lv/VText;

    .line 71
    .line 72
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/upe0;->c:Lv/VText;

    .line 80
    .line 81
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/upe0;->c:Lv/VText;

    .line 85
    .line 86
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/upe0;->e:Lv/VText;

    .line 94
    .line 95
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->F0:I

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/upe0;->e:Lv/VText;

    .line 101
    .line 102
    iget-object p0, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 103
    .line 104
    sget v0, Ll/ibc0;->Z5:I

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p1, p0, v4, v4, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/upe0;->b:Lv/VText;

    .line 118
    .line 119
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Ll/upe0;->c:Lv/VText;

    .line 127
    .line 128
    iget-object v0, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 129
    .line 130
    sget v1, Ll/ibc0;->k6:I

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Ll/upe0;->c:Lv/VText;

    .line 140
    .line 141
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Ll/upe0;->e:Lv/VText;

    .line 149
    .line 150
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->B0:I

    .line 151
    .line 152
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Ll/upe0;->e:Lv/VText;

    .line 156
    .line 157
    invoke-virtual {p0, v4, v4, v4, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/upe0;->s:Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;

    .line 2
    .line 3
    new-instance v1, Ll/tpe0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/tpe0;-><init>(Ll/upe0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/tcz;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
