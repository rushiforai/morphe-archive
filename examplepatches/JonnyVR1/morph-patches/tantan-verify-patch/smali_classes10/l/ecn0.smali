.class public Ll/ecn0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/ccn0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VDraweeView;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VButton;

.field public o:Lv/VText;

.field public p:Lv/VText;


# direct methods
.method public constructor <init>(Ll/ccn0;)V
    .locals 3

    .line 1
    sget v0, Ll/yec0;->u8:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const v2, 0x3e99999a    # 0.3f

    .line 8
    .line 9
    .line 10
    invoke-static {v2}, Ll/qag0;->c(F)Ll/rq2;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic F(Ll/ecn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ecn0;->H(Landroid/view/View;)V

    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/ccn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ccn0;->W3()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public final G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fcn0;->a(Ll/ecn0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;

    .line 14
    .line 15
    iget-object v0, p0, Ll/ecn0;->k:Lv/VDraweeView;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;->icon:Ljava/lang/String;

    .line 18
    .line 19
    const-string v2, "context_single_room"

    .line 20
    .line 21
    invoke-static {v2, v0, v1}, Ll/izs;->k(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ecn0;->l:Lv/VText;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;->title:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/ecn0;->m:Lv/VText;

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;->content:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/ecn0;->o:Lv/VText;

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;->btnText:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/ecn0;->p:Lv/VText;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;->price:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/ecn0;->G(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/ecn0;->n:Lv/VButton;

    .line 8
    .line 9
    new-instance v0, Ll/dcn0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/dcn0;-><init>(Ll/ecn0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
