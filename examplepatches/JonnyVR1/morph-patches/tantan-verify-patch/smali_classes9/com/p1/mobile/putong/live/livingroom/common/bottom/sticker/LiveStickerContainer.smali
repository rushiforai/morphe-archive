.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VEditText;

.field public e:Lv/VText;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/VText;

.field public h:Landroid/graphics/Paint;

.field public i:Landroid/graphics/Path;

.field public j:Z

.field public k:Z

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

.field public s:Z

.field public t:Z

.field public u:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$b;

.field public v:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;

.field public w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public x:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

.field public y:I

.field public z:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/pae;->b()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->y:I

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->A(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->F()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->z(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->y(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method private init()V
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->h:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->h:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget v2, Ll/qa00;->a:I

    .line 15
    .line 16
    int-to-float v2, v2

    .line 17
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->h:Landroid/graphics/Paint;

    .line 21
    .line 22
    const v2, -0x66000001

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->h:Landroid/graphics/Paint;

    .line 29
    .line 30
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Landroid/graphics/Paint;

    .line 36
    .line 37
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->z:Landroid/graphics/Paint;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->z:Landroid/graphics/Paint;

    .line 46
    .line 47
    const v2, 0x29d74d37

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->z:Landroid/graphics/Paint;

    .line 54
    .line 55
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Landroid/graphics/Path;

    .line 61
    .line 62
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->i:Landroid/graphics/Path;

    .line 66
    .line 67
    new-instance v0, Landroid/graphics/DashPathEffect;

    .line 68
    .line 69
    sget v2, Ll/qa00;->f:I

    .line 70
    .line 71
    int-to-float v3, v2

    .line 72
    int-to-float v2, v2

    .line 73
    const/4 v4, 0x2

    .line 74
    new-array v4, v4, [F

    .line 75
    .line 76
    const/4 v5, 0x0

    .line 77
    aput v3, v4, v5

    .line 78
    .line 79
    aput v2, v4, v1

    .line 80
    .line 81
    const/4 v1, 0x0

    .line 82
    invoke-direct {v0, v4, v1}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->h:Landroid/graphics/Paint;

    .line 86
    .line 87
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->l:I

    .line 103
    .line 104
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->E()V

    return-void
.end method

.method private setMaxCountFilter(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->d:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Ll/qcr;

    .line 4
    .line 5
    mul-int/lit8 p1, p1, 0x2

    .line 6
    .line 7
    new-instance v2, Ll/k7u;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/k7u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v1, p1, v2}, Ll/qcr;-><init>(ILl/x20;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    new-array p0, p0, [Landroid/text/InputFilter;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    aput-object v1, p0, p1

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private x()V
    .locals 5

    .line 1
    new-instance v0, Ll/c0s;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->v:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;

    .line 4
    .line 5
    sget v2, Ll/jgc0;->g:I

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-virtual {p0, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-direct {v0, v1, v2, v3}, Ll/c0s;-><init>(Ll/xzs;ILandroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 24
    .line 25
    new-instance v1, Ll/p7u;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/p7u;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 34
    .line 35
    sget v1, Ll/jgc0;->l:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c0(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->b:Landroid/view/View;

    .line 41
    .line 42
    new-instance v1, Ll/q7u;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/q7u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->e:Lv/VText;

    .line 51
    .line 52
    new-instance v1, Ll/r7u;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/r7u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->d:Lv/VEditText;

    .line 61
    .line 62
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$a;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->v:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;->openGiftStickerDialog()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->v:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->d:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->T4(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic E()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->g:Lv/VText;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->g:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic F()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->d:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->be:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->x:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getContent()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->x:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 17
    .line 18
    invoke-interface {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->T(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->x:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    return-object v1
.end method

.method public final H()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->g:Lv/VText;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->g:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->g:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const v0, 0x3f99999a    # 1.2f

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-wide/16 v0, 0xc8

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final I()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->g:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-wide/16 v1, 0xc8

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/l7u;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/l7u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public J()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->x:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 2
    .line 3
    instance-of v1, v0, Landroid/view/View;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->x:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 14
    .line 15
    return-void
.end method

.method public K(Ljava/lang/String;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->x()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->setMaxCountFilter(I)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/app/Dialog;->isShowing()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-nez p2, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->d:Lv/VEditText;

    .line 25
    .line 26
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->d:Lv/VEditText;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->d:Lv/VEditText;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->i:Landroid/graphics/Path;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->f:Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->i:Landroid/graphics/Path;

    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    int-to-float v0, v0

    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Path;->moveTo(FF)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->i:Landroid/graphics/Path;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    int-to-float v2, v2

    .line 32
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Path;->lineTo(FF)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->i:Landroid/graphics/Path;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->h:Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    if-ne v0, v1, :cond_3

    .line 10
    .line 11
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->k:Z

    .line 12
    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->L()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->t:Z

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 30
    .line 31
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->performClick()Z

    .line 32
    .line 33
    .line 34
    :cond_1
    const/4 v0, 0x0

    .line 35
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->k:Z

    .line 36
    .line 37
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->s:Z

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->s()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->u:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$b;

    .line 44
    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 48
    .line 49
    invoke-interface {v1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$b;->c(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Z)V

    .line 50
    .line 51
    .line 52
    :cond_2
    const/4 v0, 0x0

    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 54
    .line 55
    :cond_3
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0
.end method

.method public getCurrentSticker()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->x:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->p(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s7u;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/t7u;->b(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->v:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {p1, v0}, Ll/j5g0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/m7u;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/m7u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->setOnTouchListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c$b;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 35
    .line 36
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->x:F

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    int-to-float v2, v2

    .line 43
    mul-float/2addr v1, v2

    .line 44
    float-to-int v1, v1

    .line 45
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 46
    .line 47
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->y:F

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->f:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    sub-int/2addr v3, v4

    .line 60
    int-to-float v3, v3

    .line 61
    mul-float/2addr v2, v3

    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->f:Landroid/widget/FrameLayout;

    .line 63
    .line 64
    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    int-to-float v3, v3

    .line 69
    add-float/2addr v2, v3

    .line 70
    float-to-int v2, v2

    .line 71
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->C()Landroid/widget/FrameLayout$LayoutParams;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 76
    .line 77
    iput v2, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 78
    .line 79
    invoke-virtual {p0, v0, v3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->n(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Landroid/widget/FrameLayout$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    instance-of v1, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/InteractiveSticker;

    .line 83
    .line 84
    if-nez v1, :cond_1

    .line 85
    .line 86
    instance-of v1, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;

    .line 87
    .line 88
    if-eqz v1, :cond_2

    .line 89
    .line 90
    :cond_1
    new-instance v1, Ll/n7u;

    .line 91
    .line 92
    invoke-direct {v1, p0, v0}, Ll/n7u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V

    .line 93
    .line 94
    .line 95
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->setOnClickListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c$a;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    instance-of v1, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;

    .line 99
    .line 100
    if-eqz v1, :cond_3

    .line 101
    .line 102
    move-object v1, v0

    .line 103
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;

    .line 104
    .line 105
    new-instance v2, Ll/o7u;

    .line 106
    .line 107
    invoke-direct {v2, p0, p1}, Ll/o7u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;->setGiftClick(Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    :cond_3
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->x:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 114
    .line 115
    return-object v0
.end method

.method public final n(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 1

    .line 1
    instance-of v0, p1, Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->k(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->init()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    float-to-int v0, v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->m:I

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    float-to-int v0, v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->n:I

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    float-to-int v0, v0

    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->o:I

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    float-to-int v0, v0

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->p:I

    .line 35
    .line 36
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->q:I

    .line 37
    .line 38
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->k:Z

    .line 39
    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    return v1

    .line 50
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 51
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_3

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    float-to-int v0, v0

    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    float-to-int p1, p1

    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->q:I

    .line 19
    .line 20
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->l:I

    .line 21
    .line 22
    if-ge v1, v2, :cond_0

    .line 23
    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->m:I

    .line 25
    .line 26
    sub-int v1, v0, v1

    .line 27
    .line 28
    int-to-double v1, v1

    .line 29
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    .line 30
    .line 31
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->n:I

    .line 36
    .line 37
    sub-int v5, p1, v5

    .line 38
    .line 39
    int-to-double v5, v5

    .line 40
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->pow(DD)D

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    add-double/2addr v1, v3

    .line 45
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 46
    .line 47
    .line 48
    move-result-wide v1

    .line 49
    double-to-int v1, v1

    .line 50
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->q:I

    .line 51
    .line 52
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->q:I

    .line 53
    .line 54
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->l:I

    .line 55
    .line 56
    if-le v1, v2, :cond_2

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 59
    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->s:Z

    .line 63
    .line 64
    const/4 v3, 0x1

    .line 65
    if-nez v2, :cond_1

    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->u:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$b;

    .line 68
    .line 69
    if-eqz v2, :cond_1

    .line 70
    .line 71
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->s:Z

    .line 72
    .line 73
    invoke-interface {v2, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$b;->b(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V

    .line 74
    .line 75
    .line 76
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 77
    .line 78
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->o:I

    .line 79
    .line 80
    sub-int v2, v0, v2

    .line 81
    .line 82
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->p:I

    .line 83
    .line 84
    sub-int v4, p1, v4

    .line 85
    .line 86
    invoke-virtual {p0, v1, v2, v4}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->v(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;II)V

    .line 87
    .line 88
    .line 89
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->t:Z

    .line 90
    .line 91
    :cond_2
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->o:I

    .line 92
    .line 93
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->p:I

    .line 94
    .line 95
    :cond_3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->k:Z

    .line 96
    .line 97
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->v:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;

    .line 2
    .line 3
    return-void
.end method

.method public q(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->y:I

    .line 2
    .line 3
    return-void
.end method

.method public final s()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getTranslation()Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 16
    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getSize()Landroid/graphics/Rect;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 22
    .line 23
    add-int/2addr v1, v0

    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->f:Landroid/widget/FrameLayout;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    sub-int/2addr v0, v1

    .line 31
    if-lez v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->J()V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public setMaskVisibility(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->j:Z

    .line 2
    .line 3
    if-eq p1, v0, :cond_1

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->j:Z

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->f:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p1, 0x4

    .line 14
    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public setOnDragListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->u:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$b;

    .line 2
    .line 3
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->d:Lv/VEditText;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;II)V
    .locals 4

    .line 1
    invoke-interface {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getTranslation()Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/2addr p2, v1

    .line 14
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    add-int/2addr p3, v0

    .line 23
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->w(II)[I

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-interface {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getSize()Landroid/graphics/Rect;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    iget p3, p3, Landroid/graphics/Rect;->top:I

    .line 32
    .line 33
    invoke-interface {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getTranslation()Landroid/util/Pair;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v0, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p3, v0

    .line 46
    invoke-interface {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getSize()Landroid/graphics/Rect;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 51
    .line 52
    const/4 v1, 0x1

    .line 53
    aget v2, p2, v1

    .line 54
    .line 55
    add-int/2addr v0, v2

    .line 56
    invoke-interface {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getTranslation()Landroid/util/Pair;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast v2, Ljava/lang/Integer;

    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    add-int/2addr v0, v2

    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->f:Landroid/widget/FrameLayout;

    .line 70
    .line 71
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    sub-int p3, v2, p3

    .line 76
    .line 77
    const/4 v3, 0x0

    .line 78
    if-lez p3, :cond_0

    .line 79
    .line 80
    move p3, v1

    .line 81
    goto :goto_0

    .line 82
    :cond_0
    move p3, v3

    .line 83
    :goto_0
    sub-int/2addr v2, v0

    .line 84
    if-lez v2, :cond_1

    .line 85
    .line 86
    move v0, v1

    .line 87
    goto :goto_1

    .line 88
    :cond_1
    move v0, v3

    .line 89
    :goto_1
    if-eqz p3, :cond_2

    .line 90
    .line 91
    if-nez v0, :cond_2

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->I()V

    .line 94
    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_2
    if-nez p3, :cond_3

    .line 98
    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->H()V

    .line 102
    .line 103
    .line 104
    :cond_3
    :goto_2
    aget p3, p2, v3

    .line 105
    .line 106
    invoke-interface {p1, p3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->n(I)V

    .line 107
    .line 108
    .line 109
    aget p2, p2, v1

    .line 110
    .line 111
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->v(I)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->u:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$b;

    .line 115
    .line 116
    if-eqz p0, :cond_4

    .line 117
    .line 118
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$b;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V

    .line 119
    .line 120
    .line 121
    :cond_4
    return-void
.end method

.method public final w(II)[I
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getSize()Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 8
    .line 9
    add-int/2addr p1, v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 11
    .line 12
    invoke-interface {v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getSize()Landroid/graphics/Rect;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-gez p1, :cond_0

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    sub-int/2addr v2, p1

    .line 29
    int-to-float v2, v2

    .line 30
    int-to-float v3, v1

    .line 31
    const/high16 v4, 0x3f800000    # 1.0f

    .line 32
    .line 33
    mul-float/2addr v3, v4

    .line 34
    cmpg-float v2, v2, v3

    .line 35
    .line 36
    if-gez v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    int-to-float p1, p1

    .line 43
    sub-float/2addr p1, v3

    .line 44
    float-to-int p1, p1

    .line 45
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 46
    .line 47
    invoke-interface {v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getTranslation()Landroid/util/Pair;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 52
    .line 53
    invoke-interface {v3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getSize()Landroid/graphics/Rect;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iget v3, v3, Landroid/graphics/Rect;->top:I

    .line 58
    .line 59
    add-int/2addr p2, v3

    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 61
    .line 62
    invoke-interface {v4}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getSize()Landroid/graphics/Rect;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    const/high16 v6, 0x42700000    # 60.0f

    .line 75
    .line 76
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    sub-int/2addr v5, v6

    .line 81
    add-int/lit8 v5, v5, -0x1

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    const/high16 v7, 0x43850000    # 266.0f

    .line 88
    .line 89
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    sub-int/2addr v6, v7

    .line 94
    add-int/lit8 v6, v6, -0x1

    .line 95
    .line 96
    iget v7, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->y:I

    .line 97
    .line 98
    add-int/lit8 v7, v7, 0x1

    .line 99
    .line 100
    iget-object v8, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast v8, Ljava/lang/Integer;

    .line 103
    .line 104
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 105
    .line 106
    .line 107
    move-result v8

    .line 108
    add-int/2addr v8, v0

    .line 109
    add-int v9, p2, v4

    .line 110
    .line 111
    if-le v9, v5, :cond_2

    .line 112
    .line 113
    sub-int p2, v5, v4

    .line 114
    .line 115
    :cond_2
    div-int/lit8 v5, v1, 0x2

    .line 116
    .line 117
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    sub-int/2addr p0, v7

    .line 122
    sub-int/2addr v1, p0

    .line 123
    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    sub-int/2addr v7, p0

    .line 128
    if-ge p1, v7, :cond_4

    .line 129
    .line 130
    add-int p0, p2, v4

    .line 131
    .line 132
    if-le p0, v6, :cond_4

    .line 133
    .line 134
    if-ge v8, v7, :cond_3

    .line 135
    .line 136
    sub-int p2, v6, v4

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_3
    move p1, v7

    .line 140
    :cond_4
    :goto_1
    sub-int/2addr p1, v0

    .line 141
    iget-object p0, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 142
    .line 143
    check-cast p0, Ljava/lang/Integer;

    .line 144
    .line 145
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    sub-int/2addr p1, p0

    .line 150
    sub-int/2addr p2, v3

    .line 151
    iget-object p0, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 152
    .line 153
    check-cast p0, Ljava/lang/Integer;

    .line 154
    .line 155
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    sub-int/2addr p2, p0

    .line 160
    filled-new-array {p1, p2}, [I

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    return-object p0
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x1

    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->t:Z

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->r:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->k:Z

    .line 14
    .line 15
    :cond_0
    return v0
.end method

.method public final synthetic z(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getContent()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getMaxCount()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->K(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
