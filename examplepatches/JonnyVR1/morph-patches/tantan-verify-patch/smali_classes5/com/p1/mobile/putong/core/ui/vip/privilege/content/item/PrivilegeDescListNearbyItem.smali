.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$b;,
        Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VIcon;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VIcon;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroidx/recyclerview/widget/RecyclerView;

.field public h:Landroid/view/View;

.field public i:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$b;

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->j:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->j:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->j:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->j:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->f(Ll/pf60;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->g(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a$a;->a(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a$a;->a(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/p390;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f(Ll/pf60;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->j:Z

    .line 17
    .line 18
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p1, Ll/vg60;

    .line 21
    .line 22
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->i(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->i(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->i(Ljava/util/List;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public h(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jic0<",
            "Ll/h390;",
            ">;",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->nearby_people:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 10
    .line 11
    invoke-interface {v0, p4, v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Hm(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->c:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {p4}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->d:Lv/VText;

    .line 25
    .line 26
    invoke-virtual {p4}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->i:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$b;

    .line 34
    .line 35
    if-nez p4, :cond_0

    .line 36
    .line 37
    new-instance p4, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-direct {p4, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p4, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$b;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Ll/j390;

    .line 57
    .line 58
    invoke-direct {v2, p3}, Ll/j390;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;)V

    .line 59
    .line 60
    .line 61
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$b;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$b$a;)V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->i:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$b;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 72
    .line 73
    invoke-virtual {v0, p4}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 74
    .line 75
    .line 76
    :cond_0
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->a:Landroid/widget/RelativeLayout;

    .line 77
    .line 78
    new-instance v0, Ll/k390;

    .line 79
    .line 80
    invoke-direct {v0, p3}, Ll/k390;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p4, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->j:Z

    .line 87
    .line 88
    if-nez p3, :cond_1

    .line 89
    .line 90
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 93
    .line 94
    const/16 p4, 0x14

    .line 95
    .line 96
    const/4 v0, 0x1

    .line 97
    const/4 v1, 0x0

    .line 98
    invoke-virtual {p3, v1, p4, v0}, Ll/f4a;->D3(Lcom/p1/mobile/putong/data/Links;IZ)Lrx/c;

    .line 99
    .line 100
    .line 101
    :cond_1
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 102
    .line 103
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 104
    .line 105
    const-string p4, "supremePartner"

    .line 106
    .line 107
    invoke-static {p4}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 108
    .line 109
    .line 110
    move-result-object p4

    .line 111
    invoke-virtual {p3, p4}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object p3

    .line 115
    invoke-virtual {p3}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object p3

    .line 119
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 120
    .line 121
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 122
    .line 123
    invoke-virtual {p4}, Ll/f4a;->J3()Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object p4

    .line 127
    new-instance v0, Ll/l390;

    .line 128
    .line 129
    invoke-direct {v0}, Ll/l390;-><init>()V

    .line 130
    .line 131
    .line 132
    invoke-static {p3, p4, v0}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object p3

    .line 136
    invoke-virtual {p1, p2, p3}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    new-instance p2, Ll/m390;

    .line 141
    .line 142
    invoke-direct {p2, p0}, Ll/m390;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;)V

    .line 143
    .line 144
    .line 145
    new-instance p3, Ll/n390;

    .line 146
    .line 147
    invoke-direct {p3, p0}, Ll/n390;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;)V

    .line 148
    .line 149
    .line 150
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public final i(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->f:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/16 v2, 0xa

    .line 24
    .line 25
    if-lt p1, v2, :cond_0

    .line 26
    .line 27
    move p1, v2

    .line 28
    :cond_0
    invoke-interface {v0, v1, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->i:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$b;

    .line 33
    .line 34
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$b;->F(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$b;Ljava/util/List;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->f:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/high16 v0, 0x60000

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->b:Lv/VIcon;

    .line 13
    .line 14
    sget v1, Ll/dbc0;->gl:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->c:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Ll/c9c0;->r0:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->d:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget v2, Ll/c9c0;->b0:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->h:Landroid/view/View;

    .line 50
    .line 51
    sget v1, Ll/c9c0;->U:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->e:Lv/VIcon;

    .line 57
    .line 58
    sget v0, Ll/dbc0;->Ol:I

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 61
    .line 62
    .line 63
    return-void
.end method
