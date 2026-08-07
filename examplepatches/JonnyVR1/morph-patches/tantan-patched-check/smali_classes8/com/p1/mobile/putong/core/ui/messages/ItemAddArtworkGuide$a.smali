.class public Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$a;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->m(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->m(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)Ljava/util/List;

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
    .locals 4

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
    const/4 v2, 0x3

    .line 25
    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 26
    .line 27
    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    .line 29
    .line 30
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->k(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    div-int/2addr v3, v2

    .line 35
    invoke-virtual {v1, v3}, Landroid/widget/GridView;->setColumnWidth(I)V

    .line 36
    .line 37
    .line 38
    const/high16 v2, 0x40900000    # 4.5f

    .line 39
    .line 40
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setHorizontalSpacing(I)V

    .line 45
    .line 46
    .line 47
    new-instance v2, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    .line 50
    .line 51
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->m(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Ljava/util/List;

    .line 60
    .line 61
    invoke-direct {v2, p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;Ljava/util/List;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    return-object v0
.end method
