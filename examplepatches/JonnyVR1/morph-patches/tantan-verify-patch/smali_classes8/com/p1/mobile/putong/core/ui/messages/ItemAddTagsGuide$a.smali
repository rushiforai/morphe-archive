.class public Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$a;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->h(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->h(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    if-ne p1, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
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

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/qec0;->b:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/edc0;->b1:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Landroid/widget/GridView;

    .line 23
    .line 24
    const/4 v2, 0x2

    .line 25
    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/bnl0;->y0()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    const/high16 v4, 0x42dc0000    # 110.0f

    .line 33
    .line 34
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    sub-int/2addr v3, v4

    .line 39
    div-int/2addr v3, v2

    .line 40
    invoke-virtual {v1, v3}, Landroid/widget/GridView;->setColumnWidth(I)V

    .line 41
    .line 42
    .line 43
    const/high16 v2, 0x40c00000    # 6.0f

    .line 44
    .line 45
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-virtual {v1, v3}, Landroid/widget/GridView;->setHorizontalSpacing(I)V

    .line 50
    .line 51
    .line 52
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setVerticalSpacing(I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;

    .line 60
    .line 61
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;->f(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    check-cast p0, Landroid/widget/ListAdapter;

    .line 70
    .line 71
    invoke-virtual {v1, p0}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    return-object v0
.end method
