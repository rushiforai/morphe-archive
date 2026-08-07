.class public final Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->G1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001J\u000f\u0010\u0004\u001a\u00020\u0003H\u0016\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\u0007\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u0003H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u001f\u0010\u000c\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0003H\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u001f\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0003H\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "com/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f",
        "Landroidx/recyclerview/widget/RecyclerView$Adapter;",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;",
        "",
        "getItemCount",
        "()I",
        "position",
        "getItemViewType",
        "(I)I",
        "Landroid/view/ViewGroup;",
        "parent",
        "viewType",
        "A",
        "(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;",
        "holder",
        "",
        "z",
        "(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;I)V",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static y(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->L(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Ll/ikx;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "presenter"

    .line 8
    .line 9
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Ll/ikx;->u1(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public A(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;->getEntries()Lkotlin/enums/EnumEntries;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 15
    .line 16
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->G(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p2, p0, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance p1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;-><init>(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    return-object p1
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->J(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Ljava/util/List;

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

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->J(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Ljava/util/List;

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
    check-cast p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;->z(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;->A(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public z(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;I)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-object v1, p1

    .line 10
    check-cast v1, Landroid/view/ViewGroup;

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->J(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/4 v0, 0x1

    .line 23
    if-ne p1, v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v2, -0x1

    .line 30
    iput v2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 31
    .line 32
    :cond_0
    move p1, v0

    .line 33
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    check-cast v2, Lv/VDraweeView;

    .line 44
    .line 45
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    move-object v3, p1

    .line 53
    check-cast v3, Lv/VDraweeView;

    .line 54
    .line 55
    const/4 p1, 0x2

    .line 56
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    move-object v4, p1

    .line 64
    check-cast v4, Lv/VDraweeView;

    .line 65
    .line 66
    const/4 p1, 0x3

    .line 67
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    move-object v5, p1

    .line 75
    check-cast v5, Lv/VText_NoTopPadding;

    .line 76
    .line 77
    const/4 p1, 0x4

    .line 78
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    move-object v6, p1

    .line 86
    check-cast v6, Lcom/tantan/library/svga/SVGAnimationView;

    .line 87
    .line 88
    const/4 p1, 0x5

    .line 89
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    move-object v7, p1

    .line 97
    check-cast v7, Lv/VDraweeView;

    .line 98
    .line 99
    invoke-direct/range {v0 .. v7}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;-><init>(Landroid/view/ViewGroup;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Lv/VText_NoTopPadding;Lcom/tantan/library/svga/SVGAnimationView;Lv/VDraweeView;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 103
    .line 104
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->J(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 113
    .line 114
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 115
    .line 116
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->I(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Ljava/util/List;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 125
    .line 126
    if-gt v2, p2, :cond_1

    .line 127
    .line 128
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->I(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Ljava/util/List;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-static {v0, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_1
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->I(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Ljava/util/List;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-static {v0, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-interface {v2, p2, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    :goto_0
    sget-object p2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper;

    .line 152
    .line 153
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 154
    .line 155
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->c0()Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-virtual {p2, v2, v0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper;->e(Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)V

    .line 160
    .line 161
    .line 162
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 163
    .line 164
    new-instance p2, Ll/hlx;

    .line 165
    .line 166
    invoke-direct {p2, p0, p1}, Ll/hlx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)V

    .line 167
    .line 168
    .line 169
    invoke-static {v1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 170
    .line 171
    .line 172
    return-void
.end method
