.class public Ll/g56;
.super Ll/mi2;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mi2;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Ll/g56;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g56;->Q(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/g56;->P(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/mi2;->m:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/kec0;->s:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 v0, 0x2

    .line 19
    if-ne p2, v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/mi2;->m:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget p2, Ll/kec0;->F:I

    .line 28
    .line 29
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_1
    invoke-super {p0, p1, p2}, Ll/mi2;->D(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public P(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ne p3, v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/cj0;

    .line 6
    .line 7
    invoke-interface {p1, p0, p2, p4, v1}, Ll/cj0;->a(Ll/jic0;Lcom/p1/mobile/putong/core/data/Conversation;IZ)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    if-ne p3, v1, :cond_1

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchHeadLayout;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchHeadLayout;->i(Ll/g56;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    if-nez p3, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/g56;->R(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_2
    return-void
.end method

.method public final synthetic Q(Landroid/view/View;)V
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 12
    .line 13
    iget-object v3, p0, Ll/mi2;->m:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-static {v3}, Ll/bnl0;->J(Landroid/content/Context;)Landroid/graphics/Point;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    aget v1, v1, v4

    .line 23
    .line 24
    sub-int/2addr v3, v1

    .line 25
    const/high16 v1, 0x43500000    # 208.0f

    .line 26
    .line 27
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sub-int/2addr v3, v1

    .line 32
    div-int/2addr v3, v0

    .line 33
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/mi2;->d:Lv/VText;

    .line 39
    .line 40
    const-string v1, "\u6682\u65f6\u6ca1\u6709\u65b0\u914d\u5bf9"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/mi2;->c:Lv/VImage;

    .line 46
    .line 47
    sget v1, Ll/dbc0;->k0:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 50
    .line 51
    .line 52
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/mi2;->e:Lv/VText;

    .line 56
    .line 57
    const/4 p1, 0x0

    .line 58
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final R(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/f56;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/f56;-><init>(Ll/g56;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method
