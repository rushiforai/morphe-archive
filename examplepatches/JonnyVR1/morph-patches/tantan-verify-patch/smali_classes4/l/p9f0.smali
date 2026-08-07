.class public Ll/p9f0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;",
            ">;"
        }
    .end annotation
.end field

.field public f:I

.field public g:I

.field public h:Z

.field public i:Ll/kaf0;


# direct methods
.method public constructor <init>(Ll/kaf0;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/p9f0;->f:I

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iput v0, p0, Ll/p9f0;->g:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ll/p9f0;->h:Z

    .line 12
    .line 13
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/p9f0;->c:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    iput-object p1, p0, Ll/p9f0;->i:Ll/kaf0;

    .line 20
    .line 21
    iput-boolean p2, p0, Ll/p9f0;->h:Z

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic E(Ll/p9f0;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p9f0;->N(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/p9f0;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p9f0;->M(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemView;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->i:Lv/VText;

    .line 2
    .line 3
    invoke-static {p0}, Ll/j7b;->r3(Lv/VText;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic H(Ll/p9f0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p9f0;->O()V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "fake_risk_audit_default_"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic J(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 4
    .line 5
    iget-object p0, p0, Ll/j7b;->R:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    cmp-long p0, v0, v2

    .line 22
    .line 23
    if-gez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/p9f0;->K(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p9f0;->d:Ljava/util/List;

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
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/p9f0;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget v0, p0, Ll/p9f0;->f:I

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    sget p2, Ll/kec0;->Y7:I

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->X2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    sget p2, Ll/kec0;->Z7:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget p2, Ll/kec0;->X7:I

    .line 17
    .line 18
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/p9f0;->c:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public K(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;II)V
    .locals 2

    .line 1
    iget v0, p0, Ll/p9f0;->f:I

    .line 2
    .line 3
    if-ne p3, v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/gra;->X2()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;

    .line 12
    .line 13
    iget-object p2, p0, Ll/p9f0;->c:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->V(Lcom/p1/mobile/android/app/Act;Ll/pol;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemView;

    .line 20
    .line 21
    iget-object p2, p0, Ll/p9f0;->c:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 26
    .line 27
    invoke-virtual {p3}, Ll/dkb;->o9()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    new-instance p4, Ll/j9f0;

    .line 32
    .line 33
    invoke-direct {p4}, Ll/j9f0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p3, p4}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    invoke-virtual {p0, p2, p3}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    new-instance p3, Ll/k9f0;

    .line 45
    .line 46
    invoke-direct {p3, p0, p1}, Ll/k9f0;-><init>(Ll/p9f0;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemView;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    move-object p3, p1

    .line 58
    check-cast p3, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;

    .line 59
    .line 60
    iget-boolean v0, p0, Ll/p9f0;->h:Z

    .line 61
    .line 62
    iget-object v1, p0, Ll/p9f0;->d:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 69
    .line 70
    invoke-virtual {p3, v0, v1, p4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;->Q(ZLcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;I)V

    .line 71
    .line 72
    .line 73
    new-instance p4, Ll/l9f0;

    .line 74
    .line 75
    invoke-direct {p4, p0, p2}, Ll/l9f0;-><init>(Ll/p9f0;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    invoke-static {}, Ll/gra;->M2()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_2

    .line 86
    .line 87
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->getTitle()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const-string p2, "\u60ca\u559c\u793c\u76d2"

    .line 92
    .line 93
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_2

    .line 98
    .line 99
    iget-object p1, p0, Ll/p9f0;->c:Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    const-wide/16 v0, 0x1

    .line 102
    .line 103
    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 104
    .line 105
    invoke-static {v0, v1, p2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p2}, Lrx/c;->onBackpressureDrop()Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 114
    .line 115
    .line 116
    move-result-object p4

    .line 117
    invoke-virtual {p2, p4}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p0, p1, p2}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    new-instance p2, Ll/m9f0;

    .line 126
    .line 127
    invoke-direct {p2}, Ll/m9f0;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1, p2}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    new-instance p2, Ll/n9f0;

    .line 135
    .line 136
    invoke-direct {p2, p0}, Ll/n9f0;-><init>(Ll/p9f0;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1, p2}, Lrx/c;->doOnCompleted(Ll/x20;)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    new-instance p1, Ll/o9f0;

    .line 144
    .line 145
    invoke-direct {p1, p3}, Ll/o9f0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipItemView;)V

    .line 146
    .line 147
    .line 148
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 153
    .line 154
    .line 155
    :cond_2
    return-void
.end method

.method public L(I)Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p9f0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p9f0;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemView;->W(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p9f0;->e:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic O()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p9f0;->i:Ll/kaf0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/kaf0;->k()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Ll/p9f0;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Q(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/p9f0;->e:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p9f0;->L(I)Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

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
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p0, Ll/p9f0;->h:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ll/p9f0;->f:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget p0, p0, Ll/p9f0;->g:I

    .line 11
    .line 12
    return p0
.end method
