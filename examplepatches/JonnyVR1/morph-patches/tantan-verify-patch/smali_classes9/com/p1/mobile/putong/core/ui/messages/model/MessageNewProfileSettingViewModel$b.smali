.class public Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/data/User;

.field public d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic i:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->i:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->e:I

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->f:I

    .line 11
    .line 12
    const/4 p1, 0x3

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->g:I

    .line 14
    .line 15
    new-instance p1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->h:Ljava/util/List;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->E(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->h:Ljava/util/List;

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
    const/4 v0, 0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->i:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->u(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;)Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingHead;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 v0, 0x3

    .line 12
    if-ne p2, v0, :cond_1

    .line 13
    .line 14
    new-instance p1, Landroid/view/View;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->i:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

    .line 17
    .line 18
    iget-object p0, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    const/4 p2, -0x1

    .line 26
    sget v0, Ll/qa00;->d:I

    .line 27
    .line 28
    invoke-direct {p0, p2, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    sget p0, Ll/qa00;->y:I

    .line 35
    .line 36
    invoke-static {p1, p0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1, p0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 40
    .line 41
    .line 42
    return-object p1

    .line 43
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->i:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

    .line 44
    .line 45
    iget-object p0, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget p2, Ll/qec0;->z2:I

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;II)V
    .locals 0

    .line 1
    const/4 p4, 0x1

    .line 2
    if-ne p3, p4, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->i:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->u(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;)Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingHead;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->i:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

    .line 11
    .line 12
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->c:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->d:I

    .line 15
    .line 16
    invoke-virtual {p1, p2, p3, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingHead;->B(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 p4, 0x3

    .line 21
    if-ne p3, p4, :cond_1

    .line 22
    .line 23
    const-string p0, "#F9F9F9"

    .line 24
    .line 25
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;

    .line 34
    .line 35
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->i:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->c:Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    invoke-virtual {p1, p3, p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->O(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public F(I)Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 8
    .line 9
    return-object p0
.end method

.method public G()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->h:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public H(Lcom/p1/mobile/putong/data/User;ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->c:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->d:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->h:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->F(I)Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

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
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;->F(I)Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->head:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->line:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 12
    .line 13
    if-ne p0, p1, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x2

    .line 18
    return p0
.end method
