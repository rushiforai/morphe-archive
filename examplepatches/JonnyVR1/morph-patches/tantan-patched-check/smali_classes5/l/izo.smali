.class public Ll/izo;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/szo;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/szo;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/putong/app/PutongFrag;

.field public final e:Ll/t5m;

.field public final f:Ll/gzo;

.field public g:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongFrag;Ll/t5m;Ll/gzo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/izo;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 5
    .line 6
    iput-object p2, p0, Ll/izo;->e:Ll/t5m;

    .line 7
    .line 8
    iput-object p3, p0, Ll/izo;->f:Ll/gzo;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/szo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/izo;->E(Landroid/view/View;Ll/szo;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/izo;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    packed-switch p2, :pswitch_data_0

    .line 3
    .line 4
    .line 5
    new-instance p1, Landroid/view/View;

    .line 6
    .line 7
    iget-object p0, p0, Ll/izo;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-object p1

    .line 17
    :pswitch_0
    iget-object p0, p0, Ll/izo;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget p2, Ll/kec0;->A5:I

    .line 24
    .line 25
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :pswitch_1
    iget-object p0, p0, Ll/izo;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget p2, Ll/kec0;->y5:I

    .line 37
    .line 38
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :pswitch_2
    iget-object p2, p0, Ll/izo;->g:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;

    .line 44
    .line 45
    if-eqz p2, :cond_0

    .line 46
    .line 47
    return-object p2

    .line 48
    :cond_0
    iget-object p2, p0, Ll/izo;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 49
    .line 50
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    sget v1, Ll/kec0;->z5:I

    .line 55
    .line 56
    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;

    .line 61
    .line 62
    iput-object p1, p0, Ll/izo;->g:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;

    .line 63
    .line 64
    iget-object p2, p0, Ll/izo;->e:Ll/t5m;

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;->setUpShowcaseComponent(Ll/t5m;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/izo;->g:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;

    .line 70
    .line 71
    return-object p0

    .line 72
    :pswitch_3
    iget-object p0, p0, Ll/izo;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    sget p2, Ll/kec0;->v5:I

    .line 79
    .line 80
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0

    .line 85
    :pswitch_4
    iget-object p0, p0, Ll/izo;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    sget p2, Ll/kec0;->t5:I

    .line 92
    .line 93
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0

    .line 98
    :pswitch_5
    iget-object p0, p0, Ll/izo;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    sget p2, Ll/kec0;->u5:I

    .line 105
    .line 106
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0

    .line 111
    :pswitch_6
    iget-object p0, p0, Ll/izo;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    sget p2, Ll/kec0;->w5:I

    .line 118
    .line 119
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    return-object p0

    .line 124
    nop

    .line 125
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public E(Landroid/view/View;Ll/szo;II)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    if-ne p3, p2, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;

    .line 5
    .line 6
    invoke-virtual {p0, p4}, Ll/izo;->F(I)Ll/szo;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;

    .line 11
    .line 12
    iget-object p3, p0, Ll/izo;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 13
    .line 14
    invoke-virtual {p1, p2, p0, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->h(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    if-nez p3, :cond_1

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;

    .line 21
    .line 22
    invoke-virtual {p0, p4}, Ll/izo;->F(I)Ll/szo;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->d(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const/4 p2, 0x2

    .line 33
    if-ne p3, p2, :cond_2

    .line 34
    .line 35
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem;

    .line 36
    .line 37
    invoke-virtual {p0, p4}, Ll/izo;->F(I)Ll/szo;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem$a;

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem;->b(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem$a;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    const/4 p2, 0x4

    .line 48
    if-ne p3, p2, :cond_3

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    const/4 p3, -0x2

    .line 55
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p4}, Ll/izo;->F(I)Ll/szo;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Ll/q3p;

    .line 65
    .line 66
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/q3p;->e(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_3
    const/4 p2, 0x5

    .line 73
    if-ne p3, p2, :cond_4

    .line 74
    .line 75
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem;

    .line 76
    .line 77
    invoke-virtual {p0, p4}, Ll/izo;->F(I)Ll/szo;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    check-cast p2, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem$a;

    .line 82
    .line 83
    iget-object p0, p0, Ll/izo;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 84
    .line 85
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem;->Q(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem$a;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    const/4 p2, 0x3

    .line 90
    if-ne p3, p2, :cond_5

    .line 91
    .line 92
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem;

    .line 93
    .line 94
    invoke-virtual {p0, p4}, Ll/izo;->F(I)Ll/szo;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;

    .line 99
    .line 100
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem;->c(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_5
    const/4 p2, 0x6

    .line 105
    if-ne p3, p2, :cond_6

    .line 106
    .line 107
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeSubscriptionItem;

    .line 108
    .line 109
    invoke-virtual {p0, p4}, Ll/izo;->F(I)Ll/szo;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    check-cast p2, Ll/mcg0;

    .line 114
    .line 115
    iget-object p0, p0, Ll/izo;->d:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 116
    .line 117
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeSubscriptionItem;->q(Ll/mcg0;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 118
    .line 119
    .line 120
    :cond_6
    return-void
.end method

.method public F(I)Ll/szo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/izo;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/szo;

    .line 8
    .line 9
    return-object p0
.end method

.method public G(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/szo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/izo;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/izo;->F(I)Ll/szo;

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
    invoke-virtual {p0, p1}, Ll/izo;->F(I)Ll/szo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/szo;->getItemType()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
