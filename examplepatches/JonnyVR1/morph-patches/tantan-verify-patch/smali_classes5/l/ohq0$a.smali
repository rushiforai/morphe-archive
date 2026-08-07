.class public Ll/ohq0$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ohq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/AccountRecord;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/AccountRecord;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic d:Ll/ohq0;


# direct methods
.method public constructor <init>(Ll/ohq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ohq0$a;->d:Ll/ohq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

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
    iput-object p1, p0, Ll/ohq0$a;->c:Ljava/util/List;

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Ll/ohq0;Ll/phq0;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Ll/ohq0$a;-><init>(Ll/ohq0;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/AccountRecord;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ohq0$a;->E(Landroid/view/View;Lcom/p1/mobile/putong/core/data/AccountRecord;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ohq0$a;->c:Ljava/util/List;

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

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ohq0$a;->d:Ll/ohq0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ohq0;->a(Ll/ohq0;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/rec0;->h2:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/core/data/AccountRecord;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/svip/WithdrawRecordsItemView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ohq0$a;->C()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 p3, 0x1

    .line 8
    sub-int/2addr p0, p3

    .line 9
    if-eq p4, p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p3, 0x0

    .line 13
    :goto_0
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/svip/WithdrawRecordsItemView;->i0(Lcom/p1/mobile/putong/core/data/AccountRecord;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public F(I)Lcom/p1/mobile/putong/core/data/AccountRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ohq0$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/AccountRecord;

    .line 8
    .line 9
    return-object p0
.end method

.method public G(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/AccountRecord;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ohq0$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ohq0$a;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ohq0$a;->F(I)Lcom/p1/mobile/putong/core/data/AccountRecord;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
