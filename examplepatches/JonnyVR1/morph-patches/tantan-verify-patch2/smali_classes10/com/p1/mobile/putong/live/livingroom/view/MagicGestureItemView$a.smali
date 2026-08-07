.class public Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/android/app/Act;Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;",
            ">;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->c:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->d:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->e:Ll/z20;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureListItemView;ILcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->I(Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureListItemView;ILcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->c:Ljava/util/List;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p1, Ll/yec0;->K3:I

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    invoke-virtual {p0, p1, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;II)V
    .locals 2

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureListItemView;

    .line 2
    .line 3
    iget-object p3, p1, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureListItemView;->d:Lv/VText;

    .line 4
    .line 5
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p3, p1, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureListItemView;->c:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->cover:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "context_livingAct"

    .line 15
    .line 16
    invoke-static {v1, p3, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-boolean p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->isSelected:Z

    .line 20
    .line 21
    invoke-virtual {p1, p3}, Landroid/view/View;->setSelected(Z)V

    .line 22
    .line 23
    .line 24
    new-instance p3, Ll/mrw;

    .line 25
    .line 26
    invoke-direct {p3, p0, p1, p4, p2}, Ll/mrw;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureListItemView;ILcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final G(ZI)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->C()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->H(I)Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-ne v1, p2, :cond_0

    .line 14
    .line 15
    iput-boolean p1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->isSelected:Z

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    iput-boolean v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->isSelected:Z

    .line 19
    .line 20
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureListItemView;ILcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    xor-int/lit8 p4, p4, 0x1

    .line 6
    .line 7
    invoke-virtual {p1, p4}, Landroid/view/View;->setSelected(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    invoke-virtual {p0, p4, p2}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->G(ZI)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->e:Ll/z20;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p0, p3, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;->H(I)Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
