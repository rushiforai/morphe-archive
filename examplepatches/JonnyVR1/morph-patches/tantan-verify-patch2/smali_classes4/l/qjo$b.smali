.class public Ll/qjo$b;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qjo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qjo$b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/TribeSubsetContent;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TribeSubsetContent;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/lang/String;

.field public e:I

.field public f:I

.field public final synthetic g:Ll/qjo;


# direct methods
.method public constructor <init>(Ll/qjo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qjo$b;->g:Ll/qjo;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Ll/qjo$b;->e:I

    .line 8
    .line 9
    iput p1, p0, Ll/qjo$b;->f:I

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Ll/qjo;Ll/sjo;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Ll/qjo$b;-><init>(Ll/qjo;)V

    return-void
.end method

.method public static synthetic E(Ll/qjo$b;Lcom/p1/mobile/putong/core/data/TribeSubsetContent;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qjo$b;->H(Lcom/p1/mobile/putong/core/data/TribeSubsetContent;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/qjo$b;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/TribeSubsetContent;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qjo$b;->c:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/qjo$b;->g:Ll/qjo;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qjo;->act()Lcom/p1/mobile/android/app/Act;

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
    const/4 v0, 0x0

    .line 12
    if-eqz p2, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eq p2, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    if-ne p2, v1, :cond_0

    .line 19
    .line 20
    sget p2, Ll/pec0;->U:I

    .line 21
    .line 22
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    const-string p0, "Unknown viewType: "

    .line 28
    .line 29
    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return-object p0

    .line 34
    :cond_1
    sget p2, Ll/pec0;->T:I

    .line 35
    .line 36
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_2
    sget p2, Ll/pec0;->S:I

    .line 42
    .line 43
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/TribeSubsetContent;II)V
    .locals 3

    .line 1
    if-eqz p3, :cond_5

    .line 2
    .line 3
    const/4 p4, 0x1

    .line 4
    if-eq p3, p4, :cond_4

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p3, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move-object p3, p1

    .line 11
    check-cast p3, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;

    .line 12
    .line 13
    iget-object v0, p0, Ll/qjo$b;->c:Ljava/util/List;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result p4

    .line 21
    :cond_1
    iget v0, p0, Ll/qjo$b;->f:I

    .line 22
    .line 23
    if-eq v0, p4, :cond_3

    .line 24
    .line 25
    invoke-static {}, Ll/bnl0;->y0()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/high16 v1, 0x41a00000    # 20.0f

    .line 30
    .line 31
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/high16 v2, 0x41000000    # 8.0f

    .line 36
    .line 37
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    sub-int/2addr v0, v1

    .line 42
    add-int/lit8 v1, p4, -0x1

    .line 43
    .line 44
    mul-int/2addr v1, v2

    .line 45
    sub-int/2addr v0, v1

    .line 46
    div-int/2addr v0, p4

    .line 47
    iput v0, p0, Ll/qjo$b;->e:I

    .line 48
    .line 49
    if-gtz v0, :cond_2

    .line 50
    .line 51
    invoke-static {}, Ll/qjo;->c()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, p0, Ll/qjo$b;->e:I

    .line 56
    .line 57
    :cond_2
    iput p4, p0, Ll/qjo$b;->f:I

    .line 58
    .line 59
    :cond_3
    iget-object p4, p0, Ll/qjo$b;->g:Ll/qjo;

    .line 60
    .line 61
    invoke-static {p4}, Ll/qjo;->b(Ll/qjo;)Ll/ojo;

    .line 62
    .line 63
    .line 64
    move-result-object p4

    .line 65
    iget v0, p0, Ll/qjo$b;->e:I

    .line 66
    .line 67
    invoke-static {}, Ll/qjo;->c()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {p3, p2, p4, v0, v1}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupRight;->s(Lcom/p1/mobile/putong/core/data/TribeSubsetContent;Ll/ojo;II)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    move-object p3, p1

    .line 76
    check-cast p3, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;

    .line 77
    .line 78
    iget-object p4, p0, Ll/qjo$b;->g:Ll/qjo;

    .line 79
    .line 80
    invoke-static {p4}, Ll/qjo;->b(Ll/qjo;)Ll/ojo;

    .line 81
    .line 82
    .line 83
    move-result-object p4

    .line 84
    invoke-virtual {p3, p2, p4}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->s(Lcom/p1/mobile/putong/core/data/TribeSubsetContent;Ll/ojo;)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    move-object p3, p1

    .line 89
    check-cast p3, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupBanner;

    .line 90
    .line 91
    iget-object p4, p0, Ll/qjo$b;->g:Ll/qjo;

    .line 92
    .line 93
    invoke-static {p4}, Ll/qjo;->b(Ll/qjo;)Ll/ojo;

    .line 94
    .line 95
    .line 96
    move-result-object p4

    .line 97
    invoke-virtual {p3, p2, p4}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupBanner;->s(Lcom/p1/mobile/putong/core/data/TribeSubsetContent;Ll/ojo;)V

    .line 98
    .line 99
    .line 100
    :goto_0
    new-instance p3, Ll/rjo;

    .line 101
    .line 102
    invoke-direct {p3, p0, p2}, Ll/rjo;-><init>(Ll/qjo$b;Lcom/p1/mobile/putong/core/data/TribeSubsetContent;)V

    .line 103
    .line 104
    .line 105
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/core/data/TribeSubsetContent;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qjo$b;->c:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/core/data/TribeSubsetContent;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/qjo$b;->g:Ll/qjo;

    .line 2
    .line 3
    invoke-static {p2}, Ll/qjo;->b(Ll/qjo;)Ll/ojo;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p0, p0, Ll/qjo$b;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2, p0, p1}, Ll/ojo;->L0(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/TribeSubsetContent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public I(Ljava/util/List;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TribeSubsetContent;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qjo$b;->c:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v0, Ll/qjo$b$a;

    .line 14
    .line 15
    iget-object v2, p0, Ll/qjo$b;->c:Ljava/util/List;

    .line 16
    .line 17
    invoke-direct {v0, p0, v2, p1}, Ll/qjo$b$a;-><init>(Ll/qjo$b;Ljava/util/List;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Landroidx/recyclerview/widget/g;->b(Landroidx/recyclerview/widget/g$b;)Landroidx/recyclerview/widget/g$e;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object p1, p0, Ll/qjo$b;->c:Ljava/util/List;

    .line 25
    .line 26
    iput-object p2, p0, Ll/qjo$b;->d:Ljava/lang/String;

    .line 27
    .line 28
    iput v1, p0, Ll/qjo$b;->e:I

    .line 29
    .line 30
    iput v1, p0, Ll/qjo$b;->f:I

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/g$e;->b(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    :goto_0
    iput-object p1, p0, Ll/qjo$b;->c:Ljava/util/List;

    .line 37
    .line 38
    iput-object p2, p0, Ll/qjo$b;->d:Ljava/lang/String;

    .line 39
    .line 40
    iput v1, p0, Ll/qjo$b;->e:I

    .line 41
    .line 42
    iput v1, p0, Ll/qjo$b;->f:I

    .line 43
    .line 44
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qjo$b;->G(I)Lcom/p1/mobile/putong/core/data/TribeSubsetContent;

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
    iget-object p0, p0, Ll/qjo$b;->d:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    sparse-switch p1, :sswitch_data_0

    .line 8
    .line 9
    .line 10
    goto :goto_1

    .line 11
    :sswitch_0
    const-string p1, "right"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x2

    .line 20
    return p0

    .line 21
    :sswitch_1
    const-string p1, "hobby"

    .line 22
    .line 23
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :sswitch_2
    const-string p1, "pursue"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :sswitch_3
    const-string p1, "banner"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :cond_0
    :goto_1
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    nop

    .line 43
    :sswitch_data_0
    .sparse-switch
        -0x533a80d4 -> :sswitch_3
        -0x3a3aebea -> :sswitch_2
        0x5ed7dd2 -> :sswitch_1
        0x677c21c -> :sswitch_0
    .end sparse-switch
.end method
