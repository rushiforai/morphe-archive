.class public Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public d:Z

.field public e:Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 52
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 51
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->d:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget p3, Ll/kec0;->k1:I

    .line 16
    .line 17
    invoke-virtual {p2, p3, p0, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    sget p1, Ll/adc0;->O:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lv/VDraweeView;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->a:Lv/VDraweeView;

    .line 29
    .line 30
    sget p1, Ll/adc0;->f1:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lv/VDraweeView;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->b:Lv/VDraweeView;

    .line 39
    .line 40
    sget p1, Ll/adc0;->K8:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 49
    .line 50
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->s(Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;Landroid/view/View;)V

    return-void
.end method

.method private u()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->b:Lv/VDraweeView;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->d:Z

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget p0, Ll/dbc0;->m5:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget p0, Ll/dbc0;->n5:I

    .line 11
    .line 12
    :goto_0
    invoke-virtual {v0, p0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final synthetic s(Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->d:Z

    .line 2
    .line 3
    xor-int/lit8 p2, p2, 0x1

    .line 4
    .line 5
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->d:Z

    .line 6
    .line 7
    const-string p2, "other_uid"

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->d:Z

    .line 16
    .line 17
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    const-string v0, "choose_type"

    .line 22
    .line 23
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string p2, "e_avatar_choose"

    .line 32
    .line 33
    const-string v0, "p_chatting_partner_signal_result"

    .line 34
    .line 35
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->u()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 v0, 0x1

    .line 5
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->e:Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;

    .line 9
    .line 10
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->a:Lv/VDraweeView;

    .line 13
    .line 14
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;->avatarUrl:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;->u()V

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/d25;

    .line 30
    .line 31
    invoke-direct {v0, p0, p1}, Ll/d25;-><init>(Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerUserItem;Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
