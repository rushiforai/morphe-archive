.class public Ll/m3h0;
.super Ll/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a<",
        "Ll/lxw;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Landroid/content/Context;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/lxw;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/lxw;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/y20<",
            "Ll/lxw;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/m3h0;->d:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/m3h0;->c:Landroid/content/Context;

    .line 12
    .line 13
    iput-object p2, p0, Ll/m3h0;->e:Ll/y20;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/lxw;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/m3h0;->s(Landroid/view/View;Ll/lxw;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m3h0;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/kec0;->Kd:I

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

.method public p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/lxw;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m3h0;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Landroid/view/View;Ll/lxw;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;

    .line 2
    .line 3
    iget-object p0, p0, Ll/m3h0;->e:Ll/y20;

    .line 4
    .line 5
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->b0(Ll/lxw;Ll/y20;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/lxw;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/m3h0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
