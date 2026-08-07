.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings<",
        "Ll/djs;",
        ">;"
    }
.end annotation


# instance fields
.field public m:Ll/coj;

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, -0x1

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;Ll/coj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->q0(Ll/coj;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;Ll/coj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->p0(Ll/coj;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->s0()V

    return-void
.end method

.method public static synthetic l0(Ll/coj;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/coj;->e:Ll/h64;

    .line 2
    .line 3
    iget-object p0, p0, Ll/h64;->c:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic m0(Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;Ll/coj;Ll/pcj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->r0(Ll/coj;Ll/pcj;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public getCurrentGiftCallInfo()Ll/coj;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->d:Ll/k3m;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast v0, Ll/djs;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/oo2;->A0()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "live"

    .line 22
    .line 23
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->m:Ll/coj;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public final o0(Ljava/util/List;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sget v0, Ll/qa00;->y:I

    .line 6
    .line 7
    mul-int/2addr p1, v0

    .line 8
    sget v0, Ll/qa00;->j:I

    .line 9
    .line 10
    add-int/2addr p1, v0

    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/bnl0;->w0()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 v1, 0x1

    .line 24
    aget v0, v0, v1

    .line 25
    .line 26
    sub-int/2addr p0, v0

    .line 27
    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public final synthetic p0(Ll/coj;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->d:Ll/k3m;

    .line 2
    .line 3
    check-cast p0, Ll/djs;

    .line 4
    .line 5
    iget-object p2, p1, Ll/coj;->e:Ll/h64;

    .line 6
    .line 7
    iget-object p2, p2, Ll/h64;->a:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p1, p1, Ll/coj;->g:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p2, p1}, Ll/djs;->U3(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic q0(Ll/coj;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->d:Ll/k3m;

    .line 2
    .line 3
    check-cast p0, Ll/djs;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/djs;->T3(Ll/coj;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic r0(Ll/coj;Ll/pcj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/coj;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-interface {p2}, Ll/pcj;->call()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    const/4 p3, 0x1

    .line 19
    if-gt p2, p3, :cond_1

    .line 20
    .line 21
    const-string p0, "\u6ca1\u6709\u66f4\u591a"

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->w0(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic s0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->f:Landroidx/constraintlayout/widget/Group;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->i:Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public t0(Ll/cqj;Ll/pcj;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cqj;",
            "Ll/pcj<",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/cqj;->g()Ll/coj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->m:Ll/coj;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/cqj;->b()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->n:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 14
    .line 15
    sget v1, Ll/qa00;->v:I

    .line 16
    .line 17
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, v0, Ll/coj;->e:Ll/h64;

    .line 22
    .line 23
    iget-object v3, v3, Ll/h64;->a:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v4, v0, Ll/coj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 26
    .line 27
    iget-boolean v5, v0, Ll/coj;->a:Z

    .line 28
    .line 29
    invoke-virtual {v2, v3, v4, v5}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    new-instance v3, Ll/a0k;

    .line 34
    .line 35
    invoke-direct {v3}, Ll/a0k;-><init>()V

    .line 36
    .line 37
    .line 38
    const/4 v4, 0x0

    .line 39
    invoke-static {p1, v1, v2, v4, v3}, Ll/biv;->d(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;ZLl/qcj;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->h:Lv/VText;

    .line 43
    .line 44
    invoke-static {v0}, Ll/cpj;->C(Ll/coj;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->u0(Ll/coj;Ll/pcj;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->v0(Ll/coj;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final u0(Ll/coj;Ll/pcj;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/coj;",
            "Ll/pcj<",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->k:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/b0k;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/b0k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;Ll/coj;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->l:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/c0k;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/c0k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;Ll/coj;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->j:Landroid/view/View;

    .line 22
    .line 23
    new-instance v1, Ll/d0k;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1, p2}, Ll/d0k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;Ll/coj;Ll/pcj;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final v0(Ll/coj;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->l:Lv/VText;

    .line 2
    .line 3
    iget-boolean v1, p1, Ll/coj;->c:Z

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    xor-int/2addr v1, v2

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/coj;->i()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->i:Landroid/widget/ImageView;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->h:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->h:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    float-to-int p1, p1

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    const/high16 p1, 0x42ea0000    # 117.0f

    .line 48
    .line 49
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->h:Lv/VText;

    .line 54
    .line 55
    new-array v0, v2, [Landroid/view/View;

    .line 56
    .line 57
    aput-object p0, v0, v1

    .line 58
    .line 59
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final w0(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->h:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/yec0;->F1:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->o0(Ljava/util/List;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    new-instance v2, Landroid/widget/PopupWindow;

    .line 23
    .line 24
    const/high16 v3, 0x43480000    # 200.0f

    .line 25
    .line 26
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    const/4 v4, 0x1

    .line 31
    invoke-direct {v2, v0, v3, v1, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 32
    .line 33
    .line 34
    sget v1, Ll/jgc0;->e:I

    .line 35
    .line 36
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 37
    .line 38
    .line 39
    sget v1, Ll/mdc0;->X4:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 46
    .line 47
    sget v3, Ll/mdc0;->J2:I

    .line 48
    .line 49
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    invoke-direct {v3, v5}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v4}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 69
    .line 70
    .line 71
    new-instance v3, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;

    .line 72
    .line 73
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->n:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->d:Ll/k3m;

    .line 76
    .line 77
    check-cast v5, Ll/djs;

    .line 78
    .line 79
    invoke-direct {v3, v2, v4, v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;-><init>(Landroid/widget/PopupWindow;Ljava/lang/String;Ll/djs;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v3, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView$a;->J(Ljava/util/List;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->f:Landroidx/constraintlayout/widget/Group;

    .line 89
    .line 90
    const/4 v1, 0x0

    .line 91
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->i:Landroid/widget/ImageView;

    .line 95
    .line 96
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    new-instance p1, Ll/e0k;

    .line 100
    .line 101
    invoke-direct {p1, v2}, Ll/e0k;-><init>(Landroid/widget/PopupWindow;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveGiftUserInfoViewBindings;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 108
    .line 109
    const/high16 v0, 0x40c00000    # 6.0f

    .line 110
    .line 111
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    neg-int v0, v0

    .line 116
    const/high16 v1, 0x42440000    # 49.0f

    .line 117
    .line 118
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    neg-int v1, v1

    .line 123
    invoke-virtual {v2, p1, v0, v1}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 124
    .line 125
    .line 126
    new-instance p1, Ll/f0k;

    .line 127
    .line 128
    invoke-direct {p1, p0}, Ll/f0k;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v2, p1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method
