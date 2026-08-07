.class public Ll/t05$b;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/t05;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/ChatPartnerText;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatPartnerText;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic d:Ll/t05;


# direct methods
.method public constructor <init>(Ll/t05;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatPartnerText;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/t05$b;->d:Ll/t05;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/t05$b;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic E(Ll/t05$b;Lcom/p1/mobile/putong/core/data/ChatPartnerText;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t05$b;->H(Lcom/p1/mobile/putong/core/data/ChatPartnerText;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/t05$b;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/ChatPartnerText;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t05$b;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/t05$b;->d:Ll/t05;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/kec0;->m1:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/ChatPartnerText;II)V
    .locals 1

    .line 1
    move-object p3, p1

    .line 2
    check-cast p3, Lv/VText;

    .line 3
    .line 4
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    iget-object p4, p0, Ll/t05$b;->d:Ll/t05;

    .line 10
    .line 11
    invoke-static {p4}, Ll/t05;->D(Ll/t05;)Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p4

    .line 19
    if-eqz p4, :cond_0

    .line 20
    .line 21
    iget-object p4, p0, Ll/t05$b;->d:Ll/t05;

    .line 22
    .line 23
    invoke-static {p4}, Ll/t05;->D(Ll/t05;)Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p4

    .line 35
    if-eqz p4, :cond_0

    .line 36
    .line 37
    sget p4, Ll/dbc0;->l5:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    sget p4, Ll/dbc0;->k5:I

    .line 41
    .line 42
    :goto_0
    invoke-virtual {p3, p4}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 43
    .line 44
    .line 45
    new-instance p3, Ll/u05;

    .line 46
    .line 47
    invoke-direct {p3, p0, p2}, Ll/u05;-><init>(Ll/t05$b;Lcom/p1/mobile/putong/core/data/ChatPartnerText;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/core/data/ChatPartnerText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t05$b;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/core/data/ChatPartnerText;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/t05$b;->d:Ll/t05;

    .line 2
    .line 3
    iget-object p2, p2, Ll/t05;->n:Lv/VText;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Ll/t05$b;->d:Ll/t05;

    .line 11
    .line 12
    invoke-static {p2, p1}, Ll/t05;->E(Ll/t05;Lcom/p1/mobile/putong/core/data/ChatPartnerText;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/t05$b;->d:Ll/t05;

    .line 19
    .line 20
    invoke-static {p1}, Ll/t05;->D(Ll/t05;)Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 25
    .line 26
    const-string p2, "word_content"

    .line 27
    .line 28
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    filled-new-array {p1}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string v0, "e_preset_word"

    .line 37
    .line 38
    const-string v1, "p_chatting_partner_signal_pop"

    .line 39
    .line 40
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/t05$b;->d:Ll/t05;

    .line 44
    .line 45
    invoke-static {p0}, Ll/t05;->D(Ll/t05;)Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    filled-new-array {p0}, [Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t05$b;->G(I)Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
