.class public Lcom/p1/mobile/putong/core/ui/result/VipContent$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/result/VipContent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public e:Lcom/p1/mobile/putong/app/PutongFrag;

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->f:Z

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->f:Z

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Ll/j690;->A()Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->c:Ljava/util/ArrayList;

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-static {p2}, Ll/c690;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->c:Ljava/util/ArrayList;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/result/VipContent$a;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->J(Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/result/VipContent$a;ILcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->I(ILcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->G(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->c:Ljava/util/ArrayList;

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
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eq p2, v0, :cond_3

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    sget v0, Ll/rec0;->a2:I

    .line 26
    .line 27
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;

    .line 32
    .line 33
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->f:Z

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->s()V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-object p1

    .line 41
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    sget v0, Ll/rec0;->a3:I

    .line 46
    .line 47
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;

    .line 52
    .line 53
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->f:Z

    .line 54
    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->m()V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-object p1

    .line 61
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    sget p2, Ll/rec0;->D2:I

    .line 68
    .line 69
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;II)V
    .locals 7

    .line 1
    const/4 p4, 0x2

    .line 2
    if-eqz p3, :cond_1

    .line 3
    .line 4
    if-ne p3, p4, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    return-void

    .line 8
    :cond_1
    :goto_0
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;

    .line 9
    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    move-object v1, p1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;

    .line 14
    .line 15
    new-instance v4, Ll/iol0;

    .line 16
    .line 17
    invoke-direct {v4, p0, p3}, Ll/iol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContent$a;I)V

    .line 18
    .line 19
    .line 20
    if-ne p3, p4, :cond_2

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    :goto_1
    move v5, p1

    .line 24
    goto :goto_2

    .line 25
    :cond_2
    const/4 p1, 0x0

    .line 26
    goto :goto_1

    .line 27
    :goto_2
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    move-object v2, p0

    .line 30
    move-object v3, p2

    .line 31
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->o(Ll/jic0;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;ZLcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_3
    move-object v2, p0

    .line 36
    move-object v3, p2

    .line 37
    check-cast p1, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;

    .line 38
    .line 39
    new-instance p0, Ll/jol0;

    .line 40
    .line 41
    invoke-direct {p0, v2}, Ll/jol0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContent$a;)V

    .line 42
    .line 43
    .line 44
    iget-object p2, v2, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 45
    .line 46
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p1, v3, p0, p2}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->j(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;Lcom/p1/mobile/android/app/Act;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/core/data/Privilege;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic I(ILcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 8
    .line 9
    invoke-interface {v0, v1, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Bp(Lcom/p1/mobile/putong/app/PutongFrag;I)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/core/ui/result/a;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/result/a;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x2

    .line 20
    if-ne p1, p0, :cond_0

    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/result/a;->y(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/result/a;->x(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/result/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/result/a;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/result/a;->y(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/result/a;->x(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->H(I)Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->svip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/result/VipContent;->G()Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->c:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x2

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method
