.class public Ll/oud0$b;
.super Ll/cf60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/oud0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public final synthetic c:Ll/oud0;


# direct methods
.method public constructor <init>(Ll/oud0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/oud0$b;->c:Ll/oud0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cf60;-><init>()V

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
    iput-object p1, p0, Ll/oud0$b;->a:Ljava/util/List;

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    iput p1, p0, Ll/oud0$b;->b:I

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oud0$b;->a:Ljava/util/List;

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

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0

    .line 1
    const/4 p0, -0x2

    .line 2
    return p0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/oud0$b;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/a690;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/a690;->A()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/a690;->w()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/a690;->z()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/a690;->B()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/a690;->x()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/a690;->y()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object p2, p0, Ll/oud0$b;->c:Ll/oud0;

    .line 48
    .line 49
    iget-object p2, p2, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    sget v1, Ll/rec0;->J0:I

    .line 56
    .line 57
    invoke-virtual {p2, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;

    .line 62
    .line 63
    iget-object p0, p0, Ll/oud0$b;->c:Ll/oud0;

    .line 64
    .line 65
    iget-object p0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 66
    .line 67
    invoke-virtual {p2, v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->d(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    return-object p2

    .line 74
    :cond_1
    :goto_0
    iget-object v1, p0, Ll/oud0$b;->c:Ll/oud0;

    .line 75
    .line 76
    iget-object v1, v1, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    invoke-static {v1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    sget v3, Ll/rec0;->b2:I

    .line 83
    .line 84
    invoke-virtual {v1, v3, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;

    .line 89
    .line 90
    iget-object p0, p0, Ll/oud0$b;->c:Ll/oud0;

    .line 91
    .line 92
    iget-object p0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 93
    .line 94
    invoke-virtual {v1, v0, p2, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d(Ll/a690;ILcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 98
    .line 99
    .line 100
    return-object v1
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public j(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/oud0$b;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/oud0$b;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 1
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Ll/oud0$b;->b:I

    .line 2
    .line 3
    if-eq v0, p2, :cond_2

    .line 4
    .line 5
    iput p2, p0, Ll/oud0$b;->b:I

    .line 6
    .line 7
    instance-of v0, p3, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-object v0, p3

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    instance-of v0, p3, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage1;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    move-object v0, p3

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage1;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage1;->b()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    instance-of v0, p3, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    move-object v0, p3

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroPage2;->c()V

    .line 37
    .line 38
    .line 39
    :cond_2
    :goto_0
    invoke-super {p0, p1, p2, p3}, Ll/cf60;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
