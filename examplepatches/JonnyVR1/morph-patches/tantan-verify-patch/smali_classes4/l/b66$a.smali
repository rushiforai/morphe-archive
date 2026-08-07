.class public Ll/b66$a;
.super Ll/mi2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b66;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mi2;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Ll/b66$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b66$a;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P(Ll/b66$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b66$a;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Ll/b66$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b66$a;->U(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Ll/b66$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b66$a;->X(Landroid/view/View;)V

    return-void
.end method

.method private synthetic U(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mi2;->N()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b66$a;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
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
    iget-boolean v3, p0, Ll/mi2;->p:Z

    .line 14
    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    const/high16 v3, 0x43700000    # 240.0f

    .line 18
    .line 19
    :goto_0
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    const/high16 v3, 0x43480000    # 200.0f

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :goto_1
    iget-object v4, p0, Ll/mi2;->m:Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    invoke-static {v4}, Ll/bnl0;->J(Landroid/content/Context;)Landroid/graphics/Point;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 34
    .line 35
    sub-int/2addr v4, v3

    .line 36
    div-int/2addr v4, v0

    .line 37
    const/4 v0, 0x1

    .line 38
    aget v1, v1, v0

    .line 39
    .line 40
    sub-int/2addr v4, v1

    .line 41
    iput v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 42
    .line 43
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ll/mi2;->d:Lv/VText;

    .line 47
    .line 48
    const-string v2, "\u6682\u65f6\u6ca1\u6709\u89e3\u9664\u7684\u914d\u5bf9"

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/mi2;->c:Lv/VImage;

    .line 54
    .line 55
    sget v2, Ll/dbc0;->k0:I

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 58
    .line 59
    .line 60
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/mi2;->f:Lv/VLinear;

    .line 64
    .line 65
    iget-boolean v0, p0, Ll/mi2;->p:Z

    .line 66
    .line 67
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-boolean p1, p0, Ll/mi2;->p:Z

    .line 71
    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    const-string p1, "e_abnormal"

    .line 75
    .line 76
    const-string v0, "p_contacts_unmatch_list"

    .line 77
    .line 78
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/mi2;->f:Lv/VLinear;

    .line 82
    .line 83
    new-instance v0, Ll/a66;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Ll/a66;-><init>(Ll/b66$a;)V

    .line 86
    .line 87
    .line 88
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    iget-object p0, p0, Ll/mi2;->e:Lv/VText;

    .line 92
    .line 93
    const/4 p1, 0x0

    .line 94
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/b66$a;->S(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V

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
    sget p2, Ll/kec0;->t:I

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
    invoke-static {p0, p1}, Ll/ue6;->a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    const/4 v0, 0x3

    .line 29
    if-ne p2, v0, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Ll/mi2;->m:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget p2, Ll/kec0;->f6:I

    .line 38
    .line 39
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_2
    invoke-super {p0, p1, p2}, Ll/mi2;->D(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public S(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V
    .locals 8

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ne p3, v0, :cond_0

    .line 4
    .line 5
    move-object v2, p1

    .line 6
    check-cast v2, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    .line 7
    .line 8
    add-int/lit8 v6, p4, -0x1

    .line 9
    .line 10
    const/4 v7, 0x0

    .line 11
    const/4 v5, 0x0

    .line 12
    move-object v3, p0

    .line 13
    move-object v4, p2

    .line 14
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->u4(Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const p0, 0x3f547ae1    # 0.83f

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->setPicPercent(F)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    move-object v3, p0

    .line 25
    if-ne p3, v1, :cond_1

    .line 26
    .line 27
    new-instance p0, Ll/x56;

    .line 28
    .line 29
    invoke-direct {p0, v3}, Ll/x56;-><init>(Ll/b66$a;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    if-nez p3, :cond_2

    .line 37
    .line 38
    new-instance p0, Ll/y56;

    .line 39
    .line 40
    invoke-direct {p0, v3, p1}, Ll/y56;-><init>(Ll/b66$a;Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    const/4 p0, 0x3

    .line 48
    if-ne p3, p0, :cond_3

    .line 49
    .line 50
    const-string p0, "e_abnormal"

    .line 51
    .line 52
    const-string p2, "p_contacts_unmatch_list"

    .line 53
    .line 54
    invoke-static {p0, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    new-instance p0, Ll/z56;

    .line 58
    .line 59
    invoke-direct {p0, v3}, Ll/z56;-><init>(Ll/b66$a;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    return-void
.end method

.method public T()V
    .locals 9

    .line 1
    const-string v0, "e_abnormal"

    .line 2
    .line 3
    const-string v1, "p_contacts_unmatch_list"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Ll/mi2;->m:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    sget-object v4, Ll/b66;->c:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v7, 0x0

    .line 13
    const/4 v8, 0x0

    .line 14
    const-string v3, ""

    .line 15
    .line 16
    const/4 v5, 0x1

    .line 17
    const/4 v6, 0x1

    .line 18
    invoke-static/range {v2 .. v8}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->e2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b66$a;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
