.class public Ll/kbe0;
.super Ll/dq1;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SectionIndexer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Lcom/p1/mobile/putong/core/data/School;",
        ">;",
        "Landroid/widget/SectionIndexer;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

.field public d:Z

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/School;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/kbe0;->d:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/kbe0;->e:Ljava/util/List;

    .line 13
    .line 14
    iput-object p1, p0, Ll/kbe0;->c:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getCount()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/kbe0;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/kbe0;->c:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;->d:Ll/vle0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/vle0;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/kbe0;->e:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kbe0;->s(I)Lcom/p1/mobile/putong/core/data/School;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getPositionForSection(I)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/kbe0;->e:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Ll/kbe0;->e:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/core/data/School;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 20
    .line 21
    sget-object v3, Ll/e1b;->i:[Ljava/lang/String;

    .line 22
    .line 23
    aget-object v3, v3, p1

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    return v1

    .line 32
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return v0
.end method

.method public getSectionForPosition(I)I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    sget-object v1, Ll/e1b;->i:[Ljava/lang/String;

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_2

    .line 6
    .line 7
    iget-object v1, p0, Ll/kbe0;->e:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-lez v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Ll/kbe0;->e:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-lt p1, v2, :cond_0

    .line 22
    .line 23
    iget-object v2, p0, Ll/kbe0;->e:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    move v2, p1

    .line 31
    :goto_1
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/p1/mobile/putong/core/data/School;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 38
    .line 39
    sget-object v2, Ll/e1b;->i:[Ljava/lang/String;

    .line 40
    .line 41
    aget-object v2, v2, v0

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    return v0

    .line 50
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    array-length p0, v1

    .line 54
    add-int/lit8 p0, p0, -0x1

    .line 55
    .line 56
    return p0
.end method

.method public bridge synthetic getSections()[Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kbe0;->t()[Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public isEnabled(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/School;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/kbe0;->p(Landroid/view/View;Lcom/p1/mobile/putong/core/data/School;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kbe0;->c:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/kec0;->Se:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public p(Landroid/view/View;Lcom/p1/mobile/putong/core/data/School;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;

    .line 2
    .line 3
    iget-boolean p3, p0, Ll/kbe0;->d:Z

    .line 4
    .line 5
    invoke-virtual {p0, p4}, Ll/kbe0;->w(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p3, p2, p4, p0}, Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;->e(ZLcom/p1/mobile/putong/core/data/School;IZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public s(I)Lcom/p1/mobile/putong/core/data/School;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/kbe0;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/kbe0;->c:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;->d:Ll/vle0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/vle0;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/data/School;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/kbe0;->e:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/putong/core/data/School;

    .line 25
    .line 26
    return-object p0
.end method

.method public t()[Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/e1b;->i:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(I)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/kbe0;->getSectionForPosition(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/kbe0;->getPositionForSection(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public y(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kbe0;->c:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;->c:Ll/bme0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/bme0;->f:Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x4

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iput-boolean p1, p0, Ll/kbe0;->d:Z

    .line 16
    .line 17
    iget-object p1, p0, Ll/kbe0;->c:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;->d:Ll/vle0;

    .line 20
    .line 21
    iget-object p1, p1, Ll/vle0;->a:Ljava/util/List;

    .line 22
    .line 23
    iput-object p1, p0, Ll/kbe0;->e:Ljava/util/List;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
