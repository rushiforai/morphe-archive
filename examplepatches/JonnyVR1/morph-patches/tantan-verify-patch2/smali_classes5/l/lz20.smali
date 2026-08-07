.class public Ll/lz20;
.super Ll/m1i0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/m1i0<",
        "Ljava/lang/String;",
        "Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/t2i0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m1i0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lz20;->e:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public bridge synthetic g(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lz20;->n(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lz20;->o(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/sec0;->q0:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;

    .line 17
    .line 18
    iget-object p0, p0, Ll/lz20;->e:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ll/t2i0;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterZodiacsItem;->setData(Ll/t2i0;)V

    .line 27
    .line 28
    .line 29
    return-object p1
.end method

.method public o(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lz20;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/t2i0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/t2i0;->c:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public p(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/t2i0;",
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
    iput-object p1, p0, Ll/lz20;->e:Ljava/util/List;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/j1i0;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
