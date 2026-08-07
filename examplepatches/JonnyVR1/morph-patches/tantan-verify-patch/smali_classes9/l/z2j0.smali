.class public Ll/z2j0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/g3j0;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VText;

.field public B:I

.field public C:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

.field public D:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

.field public k:Landroid/view/View;

.field public l:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/ImageView;

.field public o:Landroid/view/View;

.field public p:Landroid/view/View;

.field public q:Landroid/view/View;

.field public r:Lv/VDraweeView;

.field public s:Landroid/widget/TextView;

.field public t:Landroid/widget/TextView;

.field public u:Lv/VDraweeView;

.field public v:Landroid/widget/TextView;

.field public w:Landroid/widget/TextView;

.field public x:Landroid/widget/TextView;

.field public y:Lv/VEditText;

.field public z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/g3j0;)V
    .locals 1
    .param p2    # Ll/g3j0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->c6:I

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Ll/z2j0;->B:I

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic F(Ll/z2j0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z2j0;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    array-length p2, p0

    .line 15
    const/4 p3, 0x0

    .line 16
    :goto_0
    if-ge p3, p2, :cond_1

    .line 17
    .line 18
    aget-char p4, p0, p3

    .line 19
    .line 20
    invoke-static {p4}, Ll/a9g0;->i(C)Z

    .line 21
    .line 22
    .line 23
    move-result p5

    .line 24
    if-nez p5, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    :cond_0
    add-int/lit8 p3, p3, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, ""

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_2
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method public static synthetic H(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    sub-int/2addr p5, p4

    .line 6
    sub-int/2addr p3, p5

    .line 7
    const/16 p4, 0xa

    .line 8
    .line 9
    rsub-int/lit8 p3, p3, 0xa

    .line 10
    .line 11
    const-string p5, ""

    .line 12
    .line 13
    if-gtz p3, :cond_0

    .line 14
    .line 15
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 16
    .line 17
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->G6:I

    .line 18
    .line 19
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-object p5

    .line 35
    :cond_0
    sub-int/2addr p2, p1

    .line 36
    if-lt p3, p2, :cond_1

    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return-object p0

    .line 40
    :cond_1
    add-int/2addr p3, p1

    .line 41
    add-int/lit8 p2, p3, -0x1

    .line 42
    .line 43
    invoke-interface {p0, p2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    invoke-static {p2}, Ljava/lang/Character;->isHighSurrogate(C)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_2

    .line 52
    .line 53
    add-int/lit8 p3, p3, -0x1

    .line 54
    .line 55
    if-ne p3, p1, :cond_2

    .line 56
    .line 57
    return-object p5

    .line 58
    :cond_2
    invoke-interface {p0, p1, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public static synthetic I(Ll/z2j0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z2j0;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/z2j0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z2j0;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/z2j0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z2j0;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Ll/z2j0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z2j0;->U(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic M(Ll/z2j0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/z2j0;->Y()V

    return-void
.end method

.method public static bridge synthetic N(Ll/z2j0;Landroid/text/Editable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z2j0;->Z(Landroid/text/Editable;)V

    return-void
.end method

.method private S()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/z2j0;->y:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Ll/v2j0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/v2j0;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v2, Ll/w2j0;

    .line 9
    .line 10
    invoke-direct {v2}, Ll/w2j0;-><init>()V

    .line 11
    .line 12
    .line 13
    const/4 v3, 0x2

    .line 14
    new-array v3, v3, [Landroid/text/InputFilter;

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    aput-object v1, v3, v4

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    aput-object v2, v3, v1

    .line 21
    .line 22
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/z2j0;->y:Lv/VEditText;

    .line 26
    .line 27
    new-instance v1, Ll/z2j0$a;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/z2j0$a;-><init>(Ll/z2j0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/z2j0;->y:Lv/VEditText;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-direct {p0, v0}, Ll/z2j0;->Z(Landroid/text/Editable;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic U(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic V(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget p1, p0, Ll/z2j0;->B:I

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    if-eq p1, v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-ne p1, v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/z2j0;->C:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 16
    .line 17
    :goto_0
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;->giftId:I

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    iget-object p1, p0, Ll/z2j0;->D:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :goto_1
    invoke-virtual {p0, p1}, Ll/z2j0;->d0(I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method private Y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z2j0;->y:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/z2j0;->y:Lv/VEditText;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/j35;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-lez v0, :cond_0

    .line 28
    .line 29
    iget v0, p0, Ll/z2j0;->B:I

    .line 30
    .line 31
    const/4 v1, -0x1

    .line 32
    if-eq v0, v1, :cond_0

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v0, 0x0

    .line 37
    :goto_0
    iget-object p0, p0, Ll/z2j0;->A:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private Z(Landroid/text/Editable;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    :goto_0
    iget-object p0, p0, Ll/z2j0;->z:Landroid/widget/TextView;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p1, "/10"

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z2j0;->k:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/s2j0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/s2j0;-><init>(Ll/z2j0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/z2j0;->S()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/z2j0;->n:Landroid/widget/ImageView;

    .line 15
    .line 16
    new-instance v1, Ll/t2j0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/t2j0;-><init>(Ll/z2j0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/z2j0;->A:Lv/VText;

    .line 25
    .line 26
    new-instance v1, Ll/u2j0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/u2j0;-><init>(Ll/z2j0;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/z2j0;->C0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final O(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/a3j0;->a(Ll/z2j0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public P(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/a3j0;->b(Ll/z2j0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Q(Ll/g3j0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public R()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z2j0;->y:Lv/VEditText;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic W(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/z2j0;->C:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;->num:I

    .line 4
    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/z2j0;->p:Landroid/view/View;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/z2j0;->q:Landroid/view/View;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p1, v1}, Landroid/view/View;->setSelected(Z)V

    .line 17
    .line 18
    .line 19
    iput v0, p0, Ll/z2j0;->B:I

    .line 20
    .line 21
    invoke-direct {p0}, Ll/z2j0;->Y()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/z2j0;->D:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;->num:I

    .line 4
    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/z2j0;->p:Landroid/view/View;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/z2j0;->q:Landroid/view/View;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x2

    .line 20
    iput p1, p0, Ll/z2j0;->B:I

    .line 21
    .line 22
    invoke-direct {p0}, Ll/z2j0;->Y()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final a0(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 13
    .line 14
    iput-object p1, p0, Ll/z2j0;->C:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 15
    .line 16
    iget-object v0, p0, Ll/z2j0;->s:Landroid/widget/TextView;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;->title:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/z2j0;->t:Landroid/widget/TextView;

    .line 24
    .line 25
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ie:I

    .line 26
    .line 27
    iget-object v1, p0, Ll/z2j0;->C:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 28
    .line 29
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;->num:I

    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v0, v1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/z2j0;->r:Lv/VDraweeView;

    .line 43
    .line 44
    iget-object v0, p0, Ll/z2j0;->C:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;->icon:Ljava/lang/String;

    .line 47
    .line 48
    const/high16 v1, 0x42380000    # 46.0f

    .line 49
    .line 50
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const-string v3, "context_livingAct"

    .line 59
    .line 60
    invoke-static {v3, p1, v0, v2, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/z2j0;->p:Landroid/view/View;

    .line 64
    .line 65
    new-instance v0, Ll/x2j0;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/x2j0;-><init>(Ll/z2j0;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public final b0(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 13
    .line 14
    iput-object p1, p0, Ll/z2j0;->D:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 15
    .line 16
    iget-object v0, p0, Ll/z2j0;->v:Landroid/widget/TextView;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;->title:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/z2j0;->w:Landroid/widget/TextView;

    .line 24
    .line 25
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ie:I

    .line 26
    .line 27
    iget-object v1, p0, Ll/z2j0;->D:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 28
    .line 29
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;->num:I

    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v0, v1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/z2j0;->u:Lv/VDraweeView;

    .line 43
    .line 44
    iget-object v0, p0, Ll/z2j0;->D:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;->icon:Ljava/lang/String;

    .line 47
    .line 48
    const/high16 v1, 0x42380000    # 46.0f

    .line 49
    .line 50
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const-string v3, "context_livingAct"

    .line 59
    .line 60
    invoke-static {v3, p1, v0, v2, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/z2j0;->q:Landroid/view/View;

    .line 64
    .line 65
    new-instance v0, Ll/y2j0;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/y2j0;-><init>(Ll/z2j0;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public c0(Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;->templates:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_4

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x2

    .line 14
    if-ge v1, v2, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/z2j0;->a0(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/z2j0;->b0(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/z2j0;->y:Lv/VEditText;

    .line 27
    .line 28
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;->canSend:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/z2j0;->y:Lv/VEditText;

    .line 34
    .line 35
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;->canSend:Z

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    const-string v1, "\u8bf4\u70b9\u4ec0\u4e48"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-string v1, "\u5df2\u6709\u4e00\u6761\u804a\u804a\u6d88\u606f\u5ba1\u6838\u4e2d\uff0c\u6682\u65e0\u6cd5\u4f7f\u7528"

    .line 43
    .line 44
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/z2j0;->A:Lv/VText;

    .line 48
    .line 49
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;->canSend:Z

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 52
    .line 53
    .line 54
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;->canSend:Z

    .line 55
    .line 56
    if-eqz p1, :cond_4

    .line 57
    .line 58
    iget-object p1, p0, Ll/z2j0;->C:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 59
    .line 60
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;->num:I

    .line 61
    .line 62
    if-lez p1, :cond_2

    .line 63
    .line 64
    iget-object p1, p0, Ll/z2j0;->p:Landroid/view/View;

    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    iget-object p1, p0, Ll/z2j0;->D:Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;

    .line 71
    .line 72
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardTopChatTemplateItem;->num:I

    .line 73
    .line 74
    if-lez p1, :cond_3

    .line 75
    .line 76
    iget-object p1, p0, Ll/z2j0;->q:Landroid/view/View;

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    .line 79
    .line 80
    .line 81
    :cond_3
    :goto_1
    invoke-direct {p0}, Ll/z2j0;->Y()V

    .line 82
    .line 83
    .line 84
    :cond_4
    :goto_2
    return-void
.end method

.method public final d0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast v0, Ll/g3j0;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, ""

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object v1, p0, Ll/z2j0;->y:Lv/VEditText;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, p1, v1}, Ll/g3j0;->c4(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/z2j0;->A:Lv/VText;

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/g3j0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z2j0;->Q(Ll/g3j0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z2j0;->P(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/z2j0;->O(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/z2j0;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/g3j0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z2j0;->Q(Ll/g3j0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->w()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/z2j0;->R()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/z2j0;->p:Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/z2j0;->p:Landroid/view/View;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/z2j0;->q:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method
