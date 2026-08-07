.class public Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public A:Landroid/widget/FrameLayout;

.field public B:Lv/VLinear;

.field public C:Lv/VText;

.field public D:Lv/VText;

.field public E:Lv/VText;

.field public E0:Landroid/view/View;

.field public F:Lv/VText;

.field public F0:Lv/VText;

.field public G:Landroid/widget/TextView;

.field public G0:Lv/VText;

.field public H:Landroid/widget/LinearLayout;

.field public H0:Lv/VText;

.field public I:Landroid/widget/LinearLayout;

.field public I0:Landroid/view/View;

.field public J:Lv/VImage;

.field public J0:Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;

.field public K:Lv/VText;

.field public K0:I

.field public L:Landroid/widget/LinearLayout;

.field public L0:Lcom/p1/mobile/putong/core/data/Question;

.field public M:Lv/VImage;

.field public M0:Ll/kcg0;

.field public N:Lv/VText;

.field public N0:Landroid/widget/TextView;

.field public O:Landroid/widget/LinearLayout;

.field public O0:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;

.field public P:Lv/VImage;

.field public P0:Z

.field public Q:Lv/VText;

.field public Q0:Ljava/lang/String;

.field public R:Landroid/widget/LinearLayout;

.field public S:Lv/VImage;

.field public T:Lv/VText;

.field public U:Z

.field public V:Ljava/lang/String;

.field public W:Ljava/lang/CharSequence;

.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VLinear;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VDraweeView;

.field public e:Lv/VImage;

.field public f:Lv/VImage;

.field public g:Lv/VLinear;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VDraweeView;

.field public k0:Ljava/lang/CharSequence;

.field public l:Landroid/widget/FrameLayout;

.field public m:Landroid/widget/LinearLayout;

.field public n:Landroid/widget/FrameLayout;

.field public o:Lv/VDraweeView;

.field public p:Lv/VImage;

.field public p0:Ljava/lang/CharSequence;

.field public q:Lv/VImage;

.field public r:Landroid/view/ViewStub;

.field public s:Lv/VText;

.field public t:Landroid/view/ViewStub;

.field public u:Landroid/widget/LinearLayout;

.field public v:Landroid/widget/RelativeLayout;

.field public w:Lv/VDraweeView;

.field public x:Landroid/widget/FrameLayout;

.field public y:Lv/VDraweeView;

.field public z:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->U:Z

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->V:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->W:Ljava/lang/CharSequence;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k0:Ljava/lang/CharSequence;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p0:Ljava/lang/CharSequence;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->L0:Lcom/p1/mobile/putong/core/data/Question;

    .line 19
    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P0:Z

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Q0:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 25
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->U:Z

    .line 27
    const-string p2, ""

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->V:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->W:Ljava/lang/CharSequence;

    .line 29
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k0:Ljava/lang/CharSequence;

    .line 30
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p0:Ljava/lang/CharSequence;

    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->L0:Lcom/p1/mobile/putong/core/data/Question;

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P0:Z

    .line 33
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Q0:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 35
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->U:Z

    .line 36
    const-string p2, ""

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->V:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->W:Ljava/lang/CharSequence;

    .line 38
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k0:Ljava/lang/CharSequence;

    .line 39
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p0:Ljava/lang/CharSequence;

    const/4 p3, 0x0

    .line 40
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->L0:Lcom/p1/mobile/putong/core/data/Question;

    .line 41
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P0:Z

    .line 42
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Q0:Ljava/lang/String;

    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->l0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic B(Ljava/util/List;Lcom/p1/mobile/putong/data/Tag;Lcom/p1/mobile/putong/data/Tag;)I
    .locals 1

    .line 1
    new-instance v0, Ll/t700;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/t700;-><init>(Lcom/p1/mobile/putong/data/Tag;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    new-instance v0, Ll/u700;

    .line 11
    .line 12
    invoke-direct {v0, p2}, Ll/u700;-><init>(Lcom/p1/mobile/putong/data/Tag;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sub-int/2addr p1, p0

    .line 20
    return p1
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "music"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "places"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->h0(Ll/clz;Landroid/view/View;)V

    return-void
.end method

.method public static I(FLjava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 2
    .line 3
    cmpg-float v1, p0, v0

    .line 4
    .line 5
    if-gez v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object v1, Ll/q8g0;->b:Ljava/text/DecimalFormat;

    .line 13
    .line 14
    float-to-double v2, p0

    .line 15
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 23
    .line 24
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->U4:I

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    sget-object v2, Ll/q8g0;->b:Ljava/text/DecimalFormat;

    .line 44
    .line 45
    div-float/2addr p0, v0

    .line 46
    float-to-double v3, p0

    .line 47
    invoke-virtual {v2, v3, v4}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 55
    .line 56
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->i4:I

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p1, "("

    .line 78
    .line 79
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string p0, ")"

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method

.method public static L(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_3

    .line 26
    .line 27
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 37
    .line 38
    const-string v2, ""

    .line 39
    .line 40
    if-nez v1, :cond_1

    .line 41
    .line 42
    move-object v1, v2

    .line 43
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 51
    .line 52
    if-nez v1, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    move-object v2, v1

    .line 56
    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 72
    .line 73
    invoke-static {}, Ll/nrb0;->c()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_4

    .line 78
    .line 79
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_4

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-ge v2, v3, :cond_4

    .line 102
    .line 103
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 104
    .line 105
    iget v2, v2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-le v2, v0, :cond_4

    .line 116
    .line 117
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 120
    .line 121
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 126
    .line 127
    const/4 v1, 0x0

    .line 128
    invoke-static {v0, p0, v1}, Ll/q8g0;->Z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Location;Z)Ll/pf60;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .line 136
    .line 137
    iget-object v1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 138
    .line 139
    check-cast v1, Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 145
    .line 146
    check-cast p0, Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    return-object p0

    .line 160
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 161
    .line 162
    iget p0, p0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 163
    .line 164
    int-to-float p0, p0

    .line 165
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->I(FLjava/lang/String;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0
.end method

.method public static P(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    new-instance v3, Landroid/graphics/Canvas;

    .line 16
    .line 17
    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 18
    .line 19
    .line 20
    new-instance v4, Landroid/graphics/Paint;

    .line 21
    .line 22
    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 23
    .line 24
    .line 25
    new-instance v5, Landroid/graphics/Rect;

    .line 26
    .line 27
    const/4 v6, 0x0

    .line 28
    invoke-direct {v5, v6, v6, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Landroid/graphics/RectF;

    .line 32
    .line 33
    invoke-direct {v0, v5}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 34
    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 38
    .line 39
    .line 40
    int-to-float p1, p1

    .line 41
    invoke-virtual {v3, v0, p1, p1, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 42
    .line 43
    .line 44
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 45
    .line 46
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 47
    .line 48
    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4, p1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 52
    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    invoke-virtual {v3, p0, p1, v5, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 56
    .line 57
    .line 58
    return-object v2
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->n0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ll/clz;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->g0(Ll/clz;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    return-void
.end method

.method public static synthetic d(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    new-instance v0, Ll/y700;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/y700;-><init>(Lcom/p1/mobile/putong/data/Tag;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "personality"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->f0()V

    return-void
.end method

.method public static synthetic g(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private getCheckTxt()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "icebreaking_check_txt"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->R5:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string p0, "content"

    .line 32
    .line 33
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    return-object p0

    .line 44
    :catch_0
    :cond_1
    :goto_0
    return-object v0
.end method

.method private getIntlInstantMatchTagIcon()I
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, -0x1

    .line 17
    sparse-switch v0, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :sswitch_0
    const-string v0, "zh"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v1, 0x5

    .line 31
    goto :goto_0

    .line 32
    :sswitch_1
    const-string v0, "vi"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v1, 0x4

    .line 42
    goto :goto_0

    .line 43
    :sswitch_2
    const-string v0, "th"

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 v1, 0x3

    .line 53
    goto :goto_0

    .line 54
    :sswitch_3
    const-string v0, "ko"

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    const/4 v1, 0x2

    .line 64
    goto :goto_0

    .line 65
    :sswitch_4
    const-string v0, "ja"

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_4

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    const/4 v1, 0x1

    .line 75
    goto :goto_0

    .line 76
    :sswitch_5
    const-string v0, "in"

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-nez p0, :cond_5

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    const/4 v1, 0x0

    .line 86
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 87
    .line 88
    .line 89
    sget p0, Ll/ibc0;->X0:I

    .line 90
    .line 91
    return p0

    .line 92
    :pswitch_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const-string v0, "TW"

    .line 101
    .line 102
    if-eq p0, v0, :cond_7

    .line 103
    .line 104
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    const-string v0, "HK"

    .line 113
    .line 114
    if-eq p0, v0, :cond_7

    .line 115
    .line 116
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    const-string v0, "MO"

    .line 125
    .line 126
    if-ne p0, v0, :cond_6

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_6
    sget p0, Ll/ibc0;->d1:I

    .line 130
    .line 131
    return p0

    .line 132
    :cond_7
    :goto_1
    sget p0, Ll/ibc0;->e1:I

    .line 133
    .line 134
    return p0

    .line 135
    :pswitch_1
    sget p0, Ll/ibc0;->c1:I

    .line 136
    .line 137
    return p0

    .line 138
    :pswitch_2
    sget p0, Ll/ibc0;->b1:I

    .line 139
    .line 140
    return p0

    .line 141
    :pswitch_3
    sget p0, Ll/ibc0;->a1:I

    .line 142
    .line 143
    return p0

    .line 144
    :pswitch_4
    sget p0, Ll/ibc0;->Z0:I

    .line 145
    .line 146
    return p0

    .line 147
    :pswitch_5
    sget p0, Ll/ibc0;->Y0:I

    .line 148
    .line 149
    return p0

    .line 150
    nop

    .line 151
    :sswitch_data_0
    .sparse-switch
        0xd25 -> :sswitch_5
        0xd37 -> :sswitch_4
        0xd64 -> :sswitch_3
        0xe74 -> :sswitch_2
        0xeb3 -> :sswitch_1
        0xf2e -> :sswitch_0
    .end sparse-switch

    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Question;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Question;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m0(Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->j0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "literature"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/data/Tag;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "sports"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->e0(Ll/clz;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Ljava/util/List;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    new-instance v0, Ll/v700;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/v700;-><init>(Lcom/p1/mobile/putong/data/Tag;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/data/Tag;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/data/Tag;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/data/Tag;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic s(Ljava/util/List;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    new-instance v0, Ll/x700;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/x700;-><init>(Lcom/p1/mobile/putong/data/Tag;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method private setMatchIcon(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->z:Lv/VImage;

    .line 10
    .line 11
    :cond_0
    if-eqz p1, :cond_b

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a0(Lcom/p1/mobile/putong/data/User;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    goto/16 :goto_0

    .line 24
    .line 25
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const-string v1, "matched"

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    if-eqz p0, :cond_5

    .line 35
    .line 36
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_5

    .line 45
    .line 46
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 49
    .line 50
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_3

    .line 55
    .line 56
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 59
    .line 60
    const-string v3, "liked"

    .line 61
    .line 62
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_5

    .line 67
    .line 68
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 71
    .line 72
    const-string v3, "boosted"

    .line 73
    .line 74
    invoke-static {v3}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-interface {p0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_5

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-interface {p0}, Ll/r97;->G1()Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_5

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 99
    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->wq()Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_4

    .line 114
    .line 115
    sget p0, Ll/ibc0;->m3:I

    .line 116
    .line 117
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_4
    sget p0, Ll/ibc0;->l3:I

    .line 122
    .line 123
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 128
    .line 129
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-eqz p0, :cond_6

    .line 134
    .line 135
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 138
    .line 139
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    if-eqz p0, :cond_6

    .line 144
    .line 145
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 148
    .line 149
    const-string v3, "superLiked"

    .line 150
    .line 151
    invoke-static {v3}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-interface {p0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    if-eqz p0, :cond_6

    .line 160
    .line 161
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-interface {p0}, Ll/r97;->G1()Z

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    if-eqz p0, :cond_6

    .line 174
    .line 175
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 176
    .line 177
    .line 178
    sget p0, Ll/ibc0;->p3:I

    .line 179
    .line 180
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 193
    .line 194
    invoke-interface {p0, v3}, Ll/r97;->Q4(Ljava/lang/String;)Z

    .line 195
    .line 196
    .line 197
    move-result p0

    .line 198
    if-eqz p0, :cond_7

    .line 199
    .line 200
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 201
    .line 202
    .line 203
    sget p0, Ll/ibc0;->g6:I

    .line 204
    .line 205
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 210
    .line 211
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    if-eqz p0, :cond_8

    .line 216
    .line 217
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 218
    .line 219
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 220
    .line 221
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    if-eqz p0, :cond_8

    .line 226
    .line 227
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 228
    .line 229
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 230
    .line 231
    const-string v3, "letter"

    .line 232
    .line 233
    invoke-static {v3}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 234
    .line 235
    .line 236
    move-result-object v3

    .line 237
    invoke-interface {p0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result p0

    .line 241
    if-eqz p0, :cond_8

    .line 242
    .line 243
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 244
    .line 245
    .line 246
    sget p0, Ll/ibc0;->o3:I

    .line 247
    .line 248
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 249
    .line 250
    .line 251
    return-void

    .line 252
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 253
    .line 254
    if-eqz p0, :cond_9

    .line 255
    .line 256
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 257
    .line 258
    const-string v3, "default"

    .line 259
    .line 260
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 261
    .line 262
    .line 263
    move-result p0

    .line 264
    if-nez p0, :cond_9

    .line 265
    .line 266
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 267
    .line 268
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 269
    .line 270
    const-string v3, "unknown_"

    .line 271
    .line 272
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 273
    .line 274
    .line 275
    move-result p0

    .line 276
    if-eqz p0, :cond_a

    .line 277
    .line 278
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 279
    .line 280
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result p0

    .line 284
    if-eqz p0, :cond_a

    .line 285
    .line 286
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 287
    .line 288
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 289
    .line 290
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 291
    .line 292
    .line 293
    move-result p0

    .line 294
    if-eqz p0, :cond_a

    .line 295
    .line 296
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 297
    .line 298
    .line 299
    sget p0, Ll/ibc0;->n3:I

    .line 300
    .line 301
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 302
    .line 303
    .line 304
    return-void

    .line 305
    :cond_a
    const/16 p0, 0x8

    .line 306
    .line 307
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 308
    .line 309
    .line 310
    :cond_b
    :goto_0
    return-void
.end method

.method private setOldDateInfo(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->d0(Ll/clz;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p0(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->i0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Ll/y20;Ll/z80;)V
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p1}, Ll/z80;->c()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/z80;->c()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-virtual {p1}, Ll/z80;->f()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/z80;->f()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic x(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;)V
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "chat_card_content_category"

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->getShowedTrackParams()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "chat_card_content"

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->getShowContent()Lorg/json/JSONArray;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    filled-new-array {v0, p1}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "e_chat_sayhi_card"

    .line 32
    .line 33
    invoke-static {v0, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->q0(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/data/Tag;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public final A0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a0(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 9
    .line 10
    .line 11
    move-result p4

    .line 12
    if-nez p4, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->L0:Lcom/p1/mobile/putong/core/data/Question;

    .line 22
    .line 23
    if-nez p4, :cond_2

    .line 24
    .line 25
    new-instance p4, Ll/b800;

    .line 26
    .line 27
    invoke-direct {p4, p0, p1, p2, p3}, Ll/b800;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p4}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->B0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final B0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;)V
    .locals 6

    .line 1
    new-instance v0, Ll/f700;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v4, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v2, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/f700;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Question;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, v4, v2, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final C0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 11
    .line 12
    const/high16 v1, 0x43680000    # 232.0f

    .line 13
    .line 14
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 19
    .line 20
    const/4 v1, -0x2

    .line 21
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final D0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->r:Landroid/view/ViewStub;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p2}, Ll/pm6;->d(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->q:Lv/VImage;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->q:Lv/VImage;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->q:Lv/VImage;

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->getIntlInstantMatchTagIcon()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-static {p2}, Ll/pm6;->d(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 39
    .line 40
    new-instance v0, Ll/d800;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/d800;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;)V

    .line 43
    .line 44
    .line 45
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNCTEpVREI2RFdQTkw0U09OVkczNjZVUTZOVEhZNjE0IiwidyI6NDIwLCJoIjo2MzYsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyMjYwOTgxMTY1Nzc5NTE3NDR9.png"

    .line 46
    .line 47
    invoke-virtual {p2, v2, v0}, Ll/fsb0;->I(Ljava/lang/String;Ll/y20;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    invoke-static {p2}, Ll/pm6;->f(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-eqz p2, :cond_3

    .line 56
    .line 57
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 58
    .line 59
    new-instance v0, Ll/e800;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/e800;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;)V

    .line 62
    .line 63
    .line 64
    const-string v2, "https://auto.tancdn.com/v1/raw/ce8a6af5-70b4-4386-b63e-8aebd6f11c5d14.webp"

    .line 65
    .line 66
    invoke-virtual {p2, v2, v0}, Ll/fsb0;->I(Ljava/lang/String;Ll/y20;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 71
    .line 72
    sget v0, Ll/ibc0;->q2:I

    .line 73
    .line 74
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 75
    .line 76
    .line 77
    :goto_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 80
    .line 81
    invoke-virtual {p2, p1}, Ll/ina;->z3(Lcom/p1/mobile/putong/data/User;)Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->E0:Landroid/view/View;

    .line 86
    .line 87
    if-nez v0, :cond_4

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->r:Landroid/view/ViewStub;

    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->E0:Landroid/view/View;

    .line 96
    .line 97
    sget v2, Ll/edc0;->a5:I

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Lv/VText;

    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F0:Lv/VText;

    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->E0:Landroid/view/View;

    .line 108
    .line 109
    sget v2, Ll/edc0;->Z4:I

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lv/VText;

    .line 116
    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G0:Lv/VText;

    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->E0:Landroid/view/View;

    .line 120
    .line 121
    sget v2, Ll/edc0;->Y4:I

    .line 122
    .line 123
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Lv/VText;

    .line 128
    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->H0:Lv/VText;

    .line 130
    .line 131
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F0:Lv/VText;

    .line 132
    .line 133
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a0(Lcom/p1/mobile/putong/data/User;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F0:Lv/VText;

    .line 145
    .line 146
    if-eqz v0, :cond_5

    .line 147
    .line 148
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-lez v0, :cond_6

    .line 160
    .line 161
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G0:Lv/VText;

    .line 162
    .line 163
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 164
    .line 165
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G0:Lv/VText;

    .line 179
    .line 180
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 181
    .line 182
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    :cond_6
    :goto_1
    const/4 p1, 0x0

    .line 190
    if-eqz p2, :cond_7

    .line 191
    .line 192
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G0:Lv/VText;

    .line 193
    .line 194
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 195
    .line 196
    .line 197
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->H0:Lv/VText;

    .line 198
    .line 199
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public E0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-eqz p2, :cond_3

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a0(Lcom/p1/mobile/putong/data/User;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->t:Landroid/view/ViewStub;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->I0:Landroid/view/View;

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->t:Landroid/view/ViewStub;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->I0:Landroid/view/View;

    .line 38
    .line 39
    sget v1, Ll/edc0;->q5:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J0:Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;

    .line 48
    .line 49
    :cond_2
    invoke-static {}, Ll/guy;->N()Ll/guy;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0, p1, p2}, Ll/guy;->K(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J0:Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;

    .line 58
    .line 59
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->setContent(Ljava/util/ArrayList;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J0:Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->getShowedTagType()Ljava/util/Set;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string p1, "about_me"

    .line 69
    .line 70
    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    :cond_3
    :goto_0
    return-void
.end method

.method public F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/g800;->b(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public F0(Lcom/p1/mobile/putong/data/User;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v2}, Ll/r97;->f3()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-static {p1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-interface {v0, v1, v2, p2}, Ll/r97;->y2(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->getImageSmall()Lv/VDraweeView;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 65
    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-interface {p2}, Ll/r97;->T0()I

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {p1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-interface {v0, p0, p1, p2}, Ll/r97;->y2(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 103
    .line 104
    .line 105
    :cond_3
    return-void
.end method

.method public G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/h800;->b(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public G0(Lcom/p1/mobile/putong/data/User;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v2}, Ll/r97;->f3()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->X(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-interface {v0, v1, v2, p2}, Ll/r97;->y2(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 80
    .line 81
    .line 82
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->getImageSmall()Lv/VDraweeView;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_4

    .line 91
    .line 92
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 93
    .line 94
    if-eqz v0, :cond_3

    .line 95
    .line 96
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 97
    .line 98
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-interface {p2}, Ll/r97;->T0()I

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-interface {v0, p0, p1, p2}, Ll/r97;->y2(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 131
    .line 132
    .line 133
    :cond_4
    return-void
.end method

.method public H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/i800;->b(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public H0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    sget v1, Ll/ibc0;->i4:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    sget v1, Ll/qa00;->c:I

    .line 26
    .line 27
    sget v2, Ll/qa00;->i:I

    .line 28
    .line 29
    invoke-virtual {v0, v1, v1, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 41
    .line 42
    const-string v0, "#ffffff"

    .line 43
    .line 44
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void
.end method

.method public final I0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    new-instance p0, Landroid/text/SpannableString;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    add-int/2addr p2, p1

    .line 28
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 29
    .line 30
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    const/high16 v1, -0x1000000

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const-string v1, "#cc000000"

    .line 48
    .line 49
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    :goto_0
    invoke-direct {v0, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 54
    .line 55
    .line 56
    const/16 v1, 0x21

    .line 57
    .line 58
    invoke-virtual {p0, v0, p1, p2, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 59
    .line 60
    .line 61
    new-instance v0, Landroid/text/style/StyleSpan;

    .line 62
    .line 63
    const/4 v2, 0x1

    .line 64
    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v0, p1, p2, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_1
    return-object p0
.end method

.method public final J(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const/4 v0, 0x3

    .line 13
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v0, 0x0

    .line 18
    :goto_0
    if-ge v0, p0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    const-string v1, "\u3001"

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/data/Tag;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    add-int/lit8 v0, v0, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    :goto_1
    return-void
.end method

.method public final J0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K(Landroid/view/View;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 19
    .line 20
    .line 21
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    instance-of v0, v0, Landroid/view/View;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void
.end method

.method public K0(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v4

    .line 9
    int-to-float p0, p2

    .line 10
    int-to-float p2, v3

    .line 11
    div-float/2addr p0, p2

    .line 12
    int-to-float p2, p3

    .line 13
    int-to-float p3, v4

    .line 14
    div-float/2addr p2, p3

    .line 15
    new-instance v5, Landroid/graphics/Matrix;

    .line 16
    .line 17
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v5, p0, p2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 21
    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v6, 0x1

    .line 25
    const/4 v1, 0x0

    .line 26
    move-object v0, p1

    .line 27
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public final M(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->L(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    const-string v1, "\u5c45\u4f4f\u5728"

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-lez v0, :cond_1

    .line 45
    .line 46
    const-string v0, ", "

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 52
    .line 53
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->a5:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    :cond_2
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public final N(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [Ljava/lang/CharSequence;

    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const/4 v2, 0x0

    .line 9
    aput-object v1, v0, v2

    .line 10
    .line 11
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_4

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->M:Lv/VImage;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_3

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Ll/r97;->a2()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->M:Lv/VImage;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_0

    .line 54
    .line 55
    sget p1, Ll/ibc0;->B2:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    sget p1, Ll/ibc0;->A2:I

    .line 59
    .line 60
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    sget p1, Ll/ibc0;->C2:I

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    sget p1, Ll/ibc0;->z2:I

    .line 82
    .line 83
    :goto_1
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 84
    .line 85
    .line 86
    :cond_3
    :goto_2
    aget-object p0, v0, v2

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_4
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    const-string v3, " "

    .line 94
    .line 95
    if-nez v1, :cond_5

    .line 96
    .line 97
    new-instance v1, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 103
    .line 104
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->b5:I

    .line 105
    .line 106
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 123
    .line 124
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->c5:I

    .line 125
    .line 126
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {p0, v1, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->I0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 138
    .line 139
    .line 140
    move-result-object p3

    .line 141
    aput-object p3, v0, v2

    .line 142
    .line 143
    :cond_5
    aget-object p3, v0, v2

    .line 144
    .line 145
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result p3

    .line 149
    if-nez p3, :cond_6

    .line 150
    .line 151
    aget-object p0, v0, v2

    .line 152
    .line 153
    return-object p0

    .line 154
    :cond_6
    iget-object p3, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 155
    .line 156
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 157
    .line 158
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p3

    .line 162
    if-eqz p3, :cond_7

    .line 163
    .line 164
    iget-object p3, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 165
    .line 166
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 167
    .line 168
    iget p3, p3, Lcom/p1/mobile/putong/data/Passby;->count:I

    .line 169
    .line 170
    if-lez p3, :cond_7

    .line 171
    .line 172
    new-instance p3, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 175
    .line 176
    .line 177
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 178
    .line 179
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->d5:I

    .line 180
    .line 181
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 192
    .line 193
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 194
    .line 195
    iget v1, v1, Lcom/p1/mobile/putong/data/Passby;->count:I

    .line 196
    .line 197
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 204
    .line 205
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->s6:I

    .line 206
    .line 207
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p3

    .line 218
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 219
    .line 220
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 221
    .line 222
    iget v1, v1, Lcom/p1/mobile/putong/data/Passby;->count:I

    .line 223
    .line 224
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    invoke-virtual {p0, p3, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->I0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 229
    .line 230
    .line 231
    move-result-object p3

    .line 232
    aput-object p3, v0, v2

    .line 233
    .line 234
    :cond_7
    aget-object p3, v0, v2

    .line 235
    .line 236
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 237
    .line 238
    .line 239
    move-result p3

    .line 240
    if-nez p3, :cond_8

    .line 241
    .line 242
    aget-object p0, v0, v2

    .line 243
    .line 244
    return-object p0

    .line 245
    :cond_8
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->w0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    return-object p0
.end method

.method public final O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 7
    .line 8
    const-string p2, ""

    .line 9
    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p3, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    new-instance v0, Lcom/baidu/mapapi/model/LatLng;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Passby;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 23
    .line 24
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 25
    .line 26
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Ll/xc2;->b(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-static {p1, v0}, Ll/fmj;->c(Ll/ner;Z)Ll/fmj;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    if-nez p0, :cond_2

    .line 39
    .line 40
    invoke-interface {p3, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    iget-wide v3, p0, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 45
    .line 46
    iget-wide v5, p0, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 47
    .line 48
    new-instance v7, Ll/m700;

    .line 49
    .line 50
    invoke-direct {v7, p3}, Ll/m700;-><init>(Ll/y20;)V

    .line 51
    .line 52
    .line 53
    new-instance v8, Ll/n700;

    .line 54
    .line 55
    invoke-direct {v8, p3}, Ll/n700;-><init>(Ll/y20;)V

    .line 56
    .line 57
    .line 58
    move-object v2, p1

    .line 59
    invoke-virtual/range {v1 .. v8}, Ll/fmj;->e(Ll/ner;DDLl/y20;Ll/y20;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "sports"

    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    const-string v1, "music"

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    const-string v1, "places"

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    const-string v1, "food"

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    const-string v1, "movies"

    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 34
    .line 35
    new-instance v1, Ll/h700;

    .line 36
    .line 37
    invoke-direct {v1, v0}, Ll/h700;-><init>(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p2, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    const-string v2, ""

    .line 49
    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    return-object v2

    .line 53
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 56
    .line 57
    new-instance v1, Ll/i700;

    .line 58
    .line 59
    invoke-direct {v1, v0}, Ll/i700;-><init>(Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    return-object v2

    .line 73
    :cond_1
    new-instance v1, Ll/j700;

    .line 74
    .line 75
    invoke-direct {v1, v0}, Ll/j700;-><init>(Ljava/util/List;)V

    .line 76
    .line 77
    .line 78
    invoke-static {p1, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p2, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 82
    .line 83
    .line 84
    new-instance v0, Ll/k700;

    .line 85
    .line 86
    invoke-direct {v0, p1}, Ll/k700;-><init>(Ljava/util/ArrayList;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p2, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    if-eqz p2, :cond_2

    .line 98
    .line 99
    return-object v2

    .line 100
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 108
    .line 109
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->Y4:I

    .line 110
    .line 111
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v1, "\uff1a"

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    const/4 v1, 0x0

    .line 136
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    if-ge v1, v2, :cond_4

    .line 141
    .line 142
    if-eqz v1, :cond_3

    .line 143
    .line 144
    const-string v2, "\u3001"

    .line 145
    .line 146
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    :cond_3
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    check-cast v2, Lcom/p1/mobile/putong/data/Tag;

    .line 154
    .line 155
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    add-int/lit8 v1, v1, 0x1

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_4
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->I0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    return-object p0
.end method

.method public final R(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 4

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 7
    .line 8
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 9
    .line 10
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 11
    .line 12
    const-string v2, "\u5b66\u751f"

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    goto/16 :goto_0

    .line 20
    .line 21
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const-string v1, "\u5176\u5b83"

    .line 30
    .line 31
    const-string v3, "\u5176\u4ed6"

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_1

    .line 70
    .line 71
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    :cond_1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 81
    .line 82
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_3

    .line 91
    .line 92
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_3

    .line 103
    .line 104
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_3

    .line 115
    .line 116
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 117
    .line 118
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 119
    .line 120
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_3

    .line 127
    .line 128
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-nez v0, :cond_2

    .line 133
    .line 134
    const-string v0, "\u00b7"

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    :cond_2
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 140
    .line 141
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 142
    .line 143
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    :cond_3
    :goto_0
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 149
    .line 150
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 151
    .line 152
    new-instance v1, Ll/o700;

    .line 153
    .line 154
    invoke-direct {v1}, Ll/o700;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 165
    .line 166
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 167
    .line 168
    new-instance v1, Ll/p700;

    .line 169
    .line 170
    invoke-direct {v1}, Ll/p700;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 181
    .line 182
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 183
    .line 184
    new-instance v1, Ll/q700;

    .line 185
    .line 186
    invoke-direct {v1}, Ll/q700;-><init>()V

    .line 187
    .line 188
    .line 189
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 197
    .line 198
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 199
    .line 200
    new-instance v1, Ll/r700;

    .line 201
    .line 202
    invoke-direct {v1}, Ll/r700;-><init>()V

    .line 203
    .line 204
    .line 205
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 210
    .line 211
    .line 212
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 213
    .line 214
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 215
    .line 216
    new-instance v1, Ll/s700;

    .line 217
    .line 218
    invoke-direct {v1}, Ll/s700;-><init>()V

    .line 219
    .line 220
    .line 221
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    if-eqz v0, :cond_4

    .line 237
    .line 238
    const-string p0, ""

    .line 239
    .line 240
    return-object p0

    .line 241
    :cond_4
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 242
    .line 243
    const-string v0, "female"

    .line 244
    .line 245
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 246
    .line 247
    .line 248
    move-result p2

    .line 249
    if-eqz p2, :cond_5

    .line 250
    .line 251
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 252
    .line 253
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->b3:I

    .line 254
    .line 255
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p2

    .line 259
    goto :goto_1

    .line 260
    :cond_5
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 261
    .line 262
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->d3:I

    .line 263
    .line 264
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p2

    .line 268
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    const-string p2, "\uff1a"

    .line 277
    .line 278
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object p2

    .line 285
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p2

    .line 292
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->I0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    return-object p0
.end method

.method public final S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/data/Answer;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ll/kua;->o3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Question;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    if-nez p0, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    move-object p2, p0

    .line 38
    :goto_1
    if-nez p2, :cond_2

    .line 39
    .line 40
    const-string p0, ""

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 44
    .line 45
    const-string p1, "female"

    .line 46
    .line 47
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 54
    .line 55
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->c3:I

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    goto :goto_2

    .line 62
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 63
    .line 64
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->e3:I

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string p0, ": "

    .line 79
    .line 80
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method public final T(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 4
    .line 5
    const-string v0, "unknown_"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 20
    .line 21
    invoke-static {p0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    const-string p0, ""

    .line 27
    .line 28
    return-object p0
.end method

.method public U(Ll/clz;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/clz<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/yxz;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/clz;->l7()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    new-instance v0, Ll/l700;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/l700;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ll/clz;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0}, Ll/r97;->D()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_3

    .line 67
    .line 68
    invoke-virtual {p1}, Ll/clz;->V2()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_3

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->getImageSmall()Lv/VDraweeView;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout$a;

    .line 85
    .line 86
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ll/clz;)V

    .line 87
    .line 88
    .line 89
    new-instance v2, Ll/w700;

    .line 90
    .line 91
    invoke-direct {v2, p0, p1}, Ll/w700;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ll/clz;)V

    .line 92
    .line 93
    .line 94
    new-instance v3, Ll/z700;

    .line 95
    .line 96
    invoke-direct {v3, p0, p1}, Ll/z700;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ll/clz;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/b;->t(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/messages/b$c;Landroid/view/View$OnClickListener;Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->getImageSmall()Lv/VDraweeView;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    new-instance v1, Ll/a800;

    .line 107
    .line 108
    invoke-direct {v1, p0, p1}, Ll/a800;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ll/clz;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J0()V

    .line 115
    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-interface {v0}, Ll/r97;->D()Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_4

    .line 130
    .line 131
    invoke-static {}, Ll/w600;->h()Ll/w600;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->getTickleAnimContent()Landroid/widget/FrameLayout;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->getImageSmall()Lv/VDraweeView;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    const-string v2, "headView"

    .line 148
    .line 149
    invoke-virtual {v0, p1, v2, v1, p0}, Ll/w600;->p(Ljava/lang/String;Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    :cond_4
    return-void
.end method

.method public V()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    sget v1, Ll/ibc0;->t5:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G:Landroid/widget/TextView;

    .line 9
    .line 10
    sget v1, Ll/ibc0;->Z1:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G:Landroid/widget/TextView;

    .line 16
    .line 17
    const-string v1, "#FFD489"

    .line 18
    .line 19
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J:Lv/VImage;

    .line 27
    .line 28
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    sget v1, Ll/ibc0;->u2:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    sget v1, Ll/ibc0;->t2:I

    .line 46
    .line 47
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->M:Lv/VImage;

    .line 51
    .line 52
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    sget v1, Ll/ibc0;->x2:I

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    sget v1, Ll/ibc0;->w2:I

    .line 70
    .line 71
    :goto_1
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P:Lv/VImage;

    .line 75
    .line 76
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_2

    .line 89
    .line 90
    sget v1, Ll/ibc0;->F2:I

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_2
    sget v1, Ll/ibc0;->E2:I

    .line 94
    .line 95
    :goto_2
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->S:Lv/VImage;

    .line 99
    .line 100
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    sget v0, Ll/ibc0;->I2:I

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_3
    sget v0, Ll/ibc0;->H2:I

    .line 118
    .line 119
    :goto_3
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public W()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    sget v1, Ll/ibc0;->s5:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G:Landroid/widget/TextView;

    .line 9
    .line 10
    sget v1, Ll/ibc0;->Y1:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G:Landroid/widget/TextView;

    .line 16
    .line 17
    const-string v1, "#74502A"

    .line 18
    .line 19
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J:Lv/VImage;

    .line 27
    .line 28
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    sget v1, Ll/ibc0;->u2:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    sget v1, Ll/ibc0;->t2:I

    .line 46
    .line 47
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->M:Lv/VImage;

    .line 51
    .line 52
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    sget v1, Ll/ibc0;->x2:I

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    sget v1, Ll/ibc0;->w2:I

    .line 70
    .line 71
    :goto_1
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P:Lv/VImage;

    .line 75
    .line 76
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_2

    .line 89
    .line 90
    sget v1, Ll/ibc0;->F2:I

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_2
    sget v1, Ll/ibc0;->E2:I

    .line 94
    .line 95
    :goto_2
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->S:Lv/VImage;

    .line 99
    .line 100
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    sget v0, Ll/ibc0;->I2:I

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_3
    sget v0, Ll/ibc0;->H2:I

    .line 118
    .line 119
    :goto_3
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public final X(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    :cond_0
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 18
    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/clz;->Y3()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    :cond_1
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_2
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public final Y()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 13
    .line 14
    iget-object v0, v0, Ll/clz;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 23
    .line 24
    instance-of p0, p0, Ll/tvz;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_0
    return v1
.end method

.method public final Z()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->v2()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->v2()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 26
    .line 27
    const-string v0, "blocked"

    .line 28
    .line 29
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public a0(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final b0()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 13
    .line 14
    iget-object p0, p0, Ll/clz;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_0
    return v1
.end method

.method public final c0(Landroid/view/View;II)Z
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    const/4 v0, 0x2

    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 9
    .line 10
    .line 11
    aget v1, v0, p0

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    aget v0, v0, v2

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    add-int/2addr v3, v1

    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    add-int/2addr p1, v0

    .line 26
    if-lt p3, v0, :cond_1

    .line 27
    .line 28
    if-gt p3, p1, :cond_1

    .line 29
    .line 30
    if-lt p2, v1, :cond_1

    .line 31
    .line 32
    if-gt p2, v3, :cond_1

    .line 33
    .line 34
    return v2

    .line 35
    :cond_1
    return p0
.end method

.method public final synthetic d0(Ll/clz;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->r0(ZLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string p0, "p_chat_view"

    .line 10
    .line 11
    new-array p2, v0, [Ll/sfj0$a;

    .line 12
    .line 13
    const-string v0, "e_message_head"

    .line 14
    .line 15
    invoke-static {v0, p0, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 16
    .line 17
    .line 18
    const-string p0, "profile_bubble"

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ll/clz;->v6(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-int v0, v0

    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    float-to-int v1, v1

    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_5

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_5

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K0:I

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G:Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-virtual {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->c0(Landroid/view/View;II)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K0:I

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->B:Lv/VLinear;

    .line 39
    .line 40
    invoke-virtual {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->c0(Landroid/view/View;II)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_4

    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->E:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->c0(Landroid/view/View;II)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-nez v2, :cond_4

    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F:Lv/VText;

    .line 55
    .line 56
    invoke-virtual {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->c0(Landroid/view/View;II)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->H:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    invoke-virtual {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->c0(Landroid/view/View;II)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    const/4 v0, 0x3

    .line 72
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K0:I

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->w:Lv/VDraweeView;

    .line 76
    .line 77
    invoke-virtual {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->c0(Landroid/view/View;II)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-nez v2, :cond_3

    .line 82
    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->x:Landroid/widget/FrameLayout;

    .line 84
    .line 85
    invoke-virtual {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->c0(Landroid/view/View;II)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_5

    .line 90
    .line 91
    :cond_3
    const/4 v0, 0x4

    .line 92
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K0:I

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    :goto_0
    const/4 v0, 0x2

    .line 96
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K0:I

    .line 97
    .line 98
    :cond_5
    :goto_1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    return p0
.end method

.method public final synthetic e0(Ll/clz;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "is_self_avatar"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "e_chat_avatar"

    .line 36
    .line 37
    invoke-static {v1, p2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 38
    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    invoke-virtual {p1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->r0(ZLjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const-string p0, "messages_thumbnail_left"

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ll/clz;->v6(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic f0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->y:Lv/VDraweeView;

    .line 10
    .line 11
    const/high16 v0, 0x41000000    # 8.0f

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setRotation(F)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic g0(Ll/clz;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/c800;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/c800;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v1, 0x12c

    .line 11
    .line 12
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public getImageSmall()Lv/VDraweeView;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->y:Lv/VDraweeView;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k:Lv/VDraweeView;

    .line 11
    .line 12
    return-object p0
.end method

.method public getTickleAnimContent()Landroid/widget/FrameLayout;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->A:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->l:Landroid/widget/FrameLayout;

    .line 11
    .line 12
    return-object p0
.end method

.method public final synthetic h0(Ll/clz;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->r0(ZLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    const-string v0, "is_self_avatar"

    .line 34
    .line 35
    invoke-static {v0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    filled-new-array {p2}, [Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    const-string v0, "e_chat_avatar"

    .line 44
    .line 45
    invoke-static {v0, p0, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 46
    .line 47
    .line 48
    const-string p0, "messages_thumbnail_left"

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ll/clz;->v6(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic i0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic j0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->r0(ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->d:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_6

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->e:Lv/VImage;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_6

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->f:Lv/VImage;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_6

    .line 30
    .line 31
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-lez v0, :cond_4

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->e:Lv/VImage;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 56
    .line 57
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->d:Lv/VDraweeView;

    .line 58
    .line 59
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 66
    .line 67
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->f:Lv/VImage;

    .line 73
    .line 74
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    if-le v3, v1, :cond_0

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    move v1, v2

    .line 84
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 95
    .line 96
    if-eqz v0, :cond_2

    .line 97
    .line 98
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 99
    .line 100
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->d:Lv/VDraweeView;

    .line 101
    .line 102
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    check-cast v2, Lcom/p1/mobile/putong/data/Video;

    .line 109
    .line 110
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 111
    .line 112
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v0, v3, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->e:Lv/VImage;

    .line 120
    .line 121
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_2
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->d:Lv/VDraweeView;

    .line 128
    .line 129
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-eqz v2, :cond_3

    .line 142
    .line 143
    sget v2, Ll/ibc0;->W:I

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_3
    sget v2, Ll/ibc0;->V:I

    .line 147
    .line 148
    :goto_1
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 149
    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_4
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->d:Lv/VDraweeView;

    .line 155
    .line 156
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-eqz v2, :cond_5

    .line 169
    .line 170
    sget v2, Ll/ibc0;->U:I

    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_5
    sget v2, Ll/ibc0;->T:I

    .line 174
    .line 175
    :goto_2
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 176
    .line 177
    .line 178
    :cond_6
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->h:Landroid/widget/TextView;

    .line 179
    .line 180
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-eqz v0, :cond_d

    .line 185
    .line 186
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->i:Landroid/widget/TextView;

    .line 187
    .line 188
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_d

    .line 193
    .line 194
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 195
    .line 196
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    const-string v1, "\u4ed6"

    .line 201
    .line 202
    const-string v2, "\u5979"

    .line 203
    .line 204
    if-eqz v0, :cond_9

    .line 205
    .line 206
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P0:Z

    .line 207
    .line 208
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->i:Landroid/widget/TextView;

    .line 209
    .line 210
    if-eqz p2, :cond_7

    .line 211
    .line 212
    const-string p2, "\u4f60\u53d1\u5e03\u7684\u52a8\u6001"

    .line 213
    .line 214
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 215
    .line 216
    .line 217
    goto :goto_5

    .line 218
    :cond_7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 219
    .line 220
    .line 221
    move-result p2

    .line 222
    if-eqz p2, :cond_8

    .line 223
    .line 224
    move-object p2, v2

    .line 225
    goto :goto_4

    .line 226
    :cond_8
    move-object p2, v1

    .line 227
    :goto_4
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    const-string v3, "%s\u53d1\u5e03\u7684\u52a8\u6001"

    .line 232
    .line 233
    invoke-static {v3, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p2

    .line 237
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 238
    .line 239
    .line 240
    goto :goto_5

    .line 241
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->i:Landroid/widget/TextView;

    .line 242
    .line 243
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 244
    .line 245
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 246
    .line 247
    .line 248
    :goto_5
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P0:Z

    .line 249
    .line 250
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->h:Landroid/widget/TextView;

    .line 251
    .line 252
    if-eqz p2, :cond_b

    .line 253
    .line 254
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 255
    .line 256
    .line 257
    move-result p1

    .line 258
    if-eqz p1, :cond_a

    .line 259
    .line 260
    move-object v1, v2

    .line 261
    :cond_a
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    const-string p2, "\u6211\u901a\u8fc7\u8fd9\u6761\u52a8\u6001\u559c\u6b22\u4e86%s"

    .line 266
    .line 267
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    .line 273
    .line 274
    return-void

    .line 275
    :cond_b
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    if-eqz p1, :cond_c

    .line 280
    .line 281
    move-object v1, v2

    .line 282
    :cond_c
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    const-string p2, "%s\u901a\u8fc7\u8fd9\u6761\u52a8\u6001\u559c\u6b22\u4e86\u6211"

    .line 287
    .line 288
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 293
    .line 294
    .line 295
    :cond_d
    return-void
.end method

.method public final synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic m0(Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/util/Random;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/putong/core/data/Question;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->L0:Lcom/p1/mobile/putong/core/data/Question;

    .line 27
    .line 28
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->L0:Lcom/p1/mobile/putong/core/data/Question;

    .line 29
    .line 30
    invoke-virtual {p0, p2, p3, p4, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->B0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->e:Ll/wzh0;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, -0x1

    .line 7
    invoke-virtual {v0, v1, v1, v2}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v5

    .line 11
    new-instance v3, Ll/g700;

    .line 12
    .line 13
    move-object v4, p0

    .line 14
    move-object v6, p1

    .line 15
    move-object v7, p2

    .line 16
    move-object v8, p3

    .line 17
    invoke-direct/range {v3 .. v8}, Ll/g700;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v3}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Question;Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->M(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->V:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->I:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K:Lv/VText;

    .line 22
    .line 23
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->V:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->I:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->V:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    xor-int/2addr v3, v2

    .line 37
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->V:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->V:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    invoke-virtual {p0, p2, p1, p5}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->N(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->W:Ljava/lang/CharSequence;

    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->L:Landroid/widget/LinearLayout;

    .line 61
    .line 62
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    const-string p5, "\n"

    .line 67
    .line 68
    const-string v1, ""

    .line 69
    .line 70
    if-eqz p2, :cond_2

    .line 71
    .line 72
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->N:Lv/VText;

    .line 73
    .line 74
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->W:Ljava/lang/CharSequence;

    .line 75
    .line 76
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->L:Landroid/widget/LinearLayout;

    .line 80
    .line 81
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->W:Ljava/lang/CharSequence;

    .line 82
    .line 83
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    xor-int/2addr v3, v2

    .line 88
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->W:Ljava/lang/CharSequence;

    .line 93
    .line 94
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    if-nez p2, :cond_4

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    if-eqz p2, :cond_3

    .line 109
    .line 110
    move-object p2, v1

    .line 111
    goto :goto_1

    .line 112
    :cond_3
    move-object p2, p5

    .line 113
    :goto_1
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->W:Ljava/lang/CharSequence;

    .line 117
    .line 118
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    :cond_4
    :goto_2
    invoke-virtual {p0, p3, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->R(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k0:Ljava/lang/CharSequence;

    .line 126
    .line 127
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->O:Landroid/widget/LinearLayout;

    .line 128
    .line 129
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    if-eqz p2, :cond_5

    .line 134
    .line 135
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Q:Lv/VText;

    .line 136
    .line 137
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k0:Ljava/lang/CharSequence;

    .line 138
    .line 139
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    .line 141
    .line 142
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->O:Landroid/widget/LinearLayout;

    .line 143
    .line 144
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k0:Ljava/lang/CharSequence;

    .line 145
    .line 146
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result p3

    .line 150
    xor-int/2addr p3, v2

    .line 151
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    goto :goto_4

    .line 155
    :cond_5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k0:Ljava/lang/CharSequence;

    .line 156
    .line 157
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    if-nez p2, :cond_7

    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    if-eqz p2, :cond_6

    .line 172
    .line 173
    move-object p2, v1

    .line 174
    goto :goto_3

    .line 175
    :cond_6
    move-object p2, p5

    .line 176
    :goto_3
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k0:Ljava/lang/CharSequence;

    .line 180
    .line 181
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    :cond_7
    :goto_4
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/CharSequence;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p0:Ljava/lang/CharSequence;

    .line 189
    .line 190
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->R:Landroid/widget/LinearLayout;

    .line 191
    .line 192
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result p2

    .line 196
    if-eqz p2, :cond_8

    .line 197
    .line 198
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->T:Lv/VText;

    .line 199
    .line 200
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p0:Ljava/lang/CharSequence;

    .line 201
    .line 202
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    .line 204
    .line 205
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->R:Landroid/widget/LinearLayout;

    .line 206
    .line 207
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p0:Ljava/lang/CharSequence;

    .line 208
    .line 209
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 210
    .line 211
    .line 212
    move-result p3

    .line 213
    xor-int/2addr p3, v2

    .line 214
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 215
    .line 216
    .line 217
    goto :goto_5

    .line 218
    :cond_8
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p0:Ljava/lang/CharSequence;

    .line 219
    .line 220
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 221
    .line 222
    .line 223
    move-result p2

    .line 224
    if-nez p2, :cond_a

    .line 225
    .line 226
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 231
    .line 232
    .line 233
    move-result p2

    .line 234
    if-eqz p2, :cond_9

    .line 235
    .line 236
    move-object p5, v1

    .line 237
    :cond_9
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p0:Ljava/lang/CharSequence;

    .line 241
    .line 242
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    :cond_a
    :goto_5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 246
    .line 247
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result p2

    .line 251
    if-eqz p2, :cond_c

    .line 252
    .line 253
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p2

    .line 257
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 258
    .line 259
    .line 260
    move-result p2

    .line 261
    if-nez p2, :cond_b

    .line 262
    .line 263
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a0(Lcom/p1/mobile/putong/data/User;)Z

    .line 264
    .line 265
    .line 266
    move-result p1

    .line 267
    if-nez p1, :cond_b

    .line 268
    .line 269
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->setOldDateInfo(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 277
    .line 278
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 279
    .line 280
    .line 281
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 282
    .line 283
    const-string p2, "#66000000"

    .line 284
    .line 285
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 286
    .line 287
    .line 288
    move-result p2

    .line 289
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 290
    .line 291
    .line 292
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 293
    .line 294
    const/high16 p1, 0x41600000    # 14.0f

    .line 295
    .line 296
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 297
    .line 298
    .line 299
    return-void

    .line 300
    :cond_b
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 301
    .line 302
    const/4 p1, 0x0

    .line 303
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 304
    .line 305
    .line 306
    :cond_c
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->M0:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 8

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->C:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    sget v4, Ll/g9c0;->g:I

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->D:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    sget v4, Ll/g9c0;->g:I

    .line 59
    .line 60
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->E:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    sget v4, Ll/g9c0;->i:I

    .line 74
    .line 75
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    .line 81
    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F:Lv/VText;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    sget v4, Ll/g9c0;->i:I

    .line 89
    .line 90
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G:Landroid/widget/TextView;

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    sget v4, Ll/g9c0;->i:I

    .line 104
    .line 105
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 110
    .line 111
    .line 112
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J:Lv/VImage;

    .line 113
    .line 114
    sget v3, Ll/ibc0;->v2:I

    .line 115
    .line 116
    invoke-static {v2, v3}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 117
    .line 118
    .line 119
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K:Lv/VText;

    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    sget v4, Ll/g9c0;->h:I

    .line 126
    .line 127
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 132
    .line 133
    .line 134
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->M:Lv/VImage;

    .line 135
    .line 136
    sget v3, Ll/ibc0;->y2:I

    .line 137
    .line 138
    invoke-static {v2, v3}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 139
    .line 140
    .line 141
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->N:Lv/VText;

    .line 142
    .line 143
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    sget v4, Ll/g9c0;->h:I

    .line 148
    .line 149
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 154
    .line 155
    .line 156
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P:Lv/VImage;

    .line 157
    .line 158
    sget v3, Ll/ibc0;->G2:I

    .line 159
    .line 160
    invoke-static {v2, v3}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 161
    .line 162
    .line 163
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Q:Lv/VText;

    .line 164
    .line 165
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    sget v4, Ll/g9c0;->h:I

    .line 170
    .line 171
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 176
    .line 177
    .line 178
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->S:Lv/VImage;

    .line 179
    .line 180
    sget v3, Ll/ibc0;->J2:I

    .line 181
    .line 182
    invoke-static {v2, v3}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 183
    .line 184
    .line 185
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->T:Lv/VText;

    .line 186
    .line 187
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    sget v4, Ll/g9c0;->h:I

    .line 192
    .line 193
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 194
    .line 195
    .line 196
    move-result v3

    .line 197
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 198
    .line 199
    .line 200
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    if-eqz v2, :cond_1

    .line 205
    .line 206
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G:Landroid/widget/TextView;

    .line 207
    .line 208
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 209
    .line 210
    .line 211
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->G:Landroid/widget/TextView;

    .line 212
    .line 213
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->getCheckTxt()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 218
    .line 219
    .line 220
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->v:Landroid/widget/RelativeLayout;

    .line 221
    .line 222
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 223
    .line 224
    .line 225
    goto :goto_0

    .line 226
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    :goto_0
    const/4 v2, 0x1

    .line 239
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 243
    .line 244
    .line 245
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->O8()Z

    .line 254
    .line 255
    .line 256
    move-result v0

    .line 257
    if-eqz v0, :cond_4

    .line 258
    .line 259
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 276
    .line 277
    .line 278
    move-result-object v3

    .line 279
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 280
    .line 281
    .line 282
    move-result v3

    .line 283
    if-eqz v3, :cond_3

    .line 284
    .line 285
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->h:Landroid/widget/TextView;

    .line 286
    .line 287
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 288
    .line 289
    .line 290
    move-result-object v4

    .line 291
    sget v5, Ll/g9c0;->g:I

    .line 292
    .line 293
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 294
    .line 295
    .line 296
    move-result v4

    .line 297
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 298
    .line 299
    .line 300
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->i:Landroid/widget/TextView;

    .line 301
    .line 302
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 303
    .line 304
    .line 305
    move-result-object v4

    .line 306
    sget v5, Ll/g9c0;->i:I

    .line 307
    .line 308
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 309
    .line 310
    .line 311
    move-result v4

    .line 312
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 313
    .line 314
    .line 315
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->e:Lv/VImage;

    .line 316
    .line 317
    sget v4, Ll/ibc0;->l1:I

    .line 318
    .line 319
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 320
    .line 321
    .line 322
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->f:Lv/VImage;

    .line 323
    .line 324
    sget v4, Ll/ibc0;->X:I

    .line 325
    .line 326
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 327
    .line 328
    .line 329
    :cond_3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 330
    .line 331
    .line 332
    :cond_4
    new-instance v0, Landroid/widget/TextView;

    .line 333
    .line 334
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 335
    .line 336
    .line 337
    move-result-object v3

    .line 338
    invoke-direct {v0, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 339
    .line 340
    .line 341
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->N0:Landroid/widget/TextView;

    .line 342
    .line 343
    const-string v3, "#4D000000"

    .line 344
    .line 345
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 346
    .line 347
    .line 348
    move-result v3

    .line 349
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 350
    .line 351
    .line 352
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->N0:Landroid/widget/TextView;

    .line 353
    .line 354
    const/high16 v3, 0x41500000    # 13.0f

    .line 355
    .line 356
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 357
    .line 358
    .line 359
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 360
    .line 361
    const/4 v3, -0x1

    .line 362
    const/4 v4, -0x2

    .line 363
    invoke-direct {v0, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 364
    .line 365
    .line 366
    const/high16 v5, 0x41a00000    # 20.0f

    .line 367
    .line 368
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 369
    .line 370
    .line 371
    move-result v6

    .line 372
    iput v6, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 373
    .line 374
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->N0:Landroid/widget/TextView;

    .line 375
    .line 376
    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 377
    .line 378
    .line 379
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->N0:Landroid/widget/TextView;

    .line 380
    .line 381
    const/16 v6, 0x8

    .line 382
    .line 383
    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 384
    .line 385
    .line 386
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->N0:Landroid/widget/TextView;

    .line 387
    .line 388
    invoke-virtual {p0, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 389
    .line 390
    .line 391
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 392
    .line 393
    .line 394
    move-result v0

    .line 395
    if-eqz v0, :cond_5

    .line 396
    .line 397
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->xh()Z

    .line 406
    .line 407
    .line 408
    move-result v0

    .line 409
    if-eqz v0, :cond_5

    .line 410
    .line 411
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Y()Z

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    if-nez v0, :cond_5

    .line 416
    .line 417
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Z()Z

    .line 418
    .line 419
    .line 420
    move-result v0

    .line 421
    if-nez v0, :cond_5

    .line 422
    .line 423
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->H:Landroid/widget/LinearLayout;

    .line 424
    .line 425
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 426
    .line 427
    .line 428
    move-result v0

    .line 429
    if-eqz v0, :cond_5

    .line 430
    .line 431
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 432
    .line 433
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->H:Landroid/widget/LinearLayout;

    .line 434
    .line 435
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 436
    .line 437
    .line 438
    move-result v0

    .line 439
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 440
    .line 441
    .line 442
    move-result-object v2

    .line 443
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 444
    .line 445
    .line 446
    move-result-object v2

    .line 447
    sget v6, Ll/qec0;->H1:I

    .line 448
    .line 449
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 450
    .line 451
    invoke-virtual {v2, v6, v7, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 452
    .line 453
    .line 454
    move-result-object v2

    .line 455
    check-cast v2, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;

    .line 456
    .line 457
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->O0:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;

    .line 458
    .line 459
    new-instance v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 460
    .line 461
    invoke-direct {v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 462
    .line 463
    .line 464
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 465
    .line 466
    .line 467
    move-result v3

    .line 468
    neg-int v3, v3

    .line 469
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 470
    .line 471
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 472
    .line 473
    .line 474
    move-result v3

    .line 475
    neg-int v3, v3

    .line 476
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 477
    .line 478
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 479
    .line 480
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->O0:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;

    .line 481
    .line 482
    invoke-virtual {v3, v4, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 483
    .line 484
    .line 485
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->H:Landroid/widget/LinearLayout;

    .line 486
    .line 487
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 488
    .line 489
    .line 490
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->O0:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;

    .line 491
    .line 492
    new-instance v1, Ll/a700;

    .line 493
    .line 494
    invoke-direct {v1, p0}, Ll/a700;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;)V

    .line 495
    .line 496
    .line 497
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 498
    .line 499
    .line 500
    :cond_5
    return-void
.end method

.method public final synthetic p0(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 v0, 0x43550000    # 213.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, 0x438c0000    # 280.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K0(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/high16 v0, 0x41200000    # 10.0f

    .line 20
    .line 21
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 45
    .line 46
    sget p1, Ll/ibc0;->q2:I

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic q0(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 v0, 0x43550000    # 213.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, 0x438c0000    # 280.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K0(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/high16 v0, 0x41200000    # 10.0f

    .line 20
    .line 21
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 45
    .line 46
    sget p1, Ll/ibc0;->q2:I

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final r0(ZLjava/lang/String;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_e

    .line 6
    .line 7
    const-string v0, "card_content_question"

    .line 8
    .line 9
    const-string v1, "card_content_tag"

    .line 10
    .line 11
    const-string v2, "card_conntent_common_info"

    .line 12
    .line 13
    const-string v3, "card_content_personal_info"

    .line 14
    .line 15
    const-string v4, "e_match_card"

    .line 16
    .line 17
    const-string v5, "0"

    .line 18
    .line 19
    const-string v6, "1"

    .line 20
    .line 21
    if-eqz p1, :cond_4

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->V:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    move-object p1, v6

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move-object p1, v5

    .line 34
    :goto_0
    invoke-static {v3, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->W:Ljava/lang/CharSequence;

    .line 39
    .line 40
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-nez v3, :cond_1

    .line 45
    .line 46
    move-object v3, v6

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    move-object v3, v5

    .line 49
    :goto_1
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k0:Ljava/lang/CharSequence;

    .line 54
    .line 55
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-nez v3, :cond_2

    .line 60
    .line 61
    move-object v3, v6

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    move-object v3, v5

    .line 64
    :goto_2
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p0:Ljava/lang/CharSequence;

    .line 69
    .line 70
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-nez p0, :cond_3

    .line 75
    .line 76
    move-object v5, v6

    .line 77
    :cond_3
    invoke-static {v0, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    filled-new-array {p1, v2, v1, p0}, [Ll/sfj0$a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {v4, p2, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->V:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz p1, :cond_9

    .line 96
    .line 97
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-nez p1, :cond_5

    .line 102
    .line 103
    move-object p1, v6

    .line 104
    goto :goto_3

    .line 105
    :cond_5
    move-object p1, v5

    .line 106
    :goto_3
    invoke-static {v3, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->W:Ljava/lang/CharSequence;

    .line 111
    .line 112
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-nez v3, :cond_6

    .line 117
    .line 118
    move-object v3, v6

    .line 119
    goto :goto_4

    .line 120
    :cond_6
    move-object v3, v5

    .line 121
    :goto_4
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k0:Ljava/lang/CharSequence;

    .line 126
    .line 127
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-nez v3, :cond_7

    .line 132
    .line 133
    move-object v3, v6

    .line 134
    goto :goto_5

    .line 135
    :cond_7
    move-object v3, v5

    .line 136
    :goto_5
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p0:Ljava/lang/CharSequence;

    .line 141
    .line 142
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    if-nez v3, :cond_8

    .line 147
    .line 148
    move-object v5, v6

    .line 149
    :cond_8
    invoke-static {v0, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    const-string v3, "card_click_area"

    .line 154
    .line 155
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->K0:I

    .line 156
    .line 157
    invoke-static {v3, p0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    filled-new-array {p1, v2, v1, v0, p0}, [Ll/sfj0$a;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-static {v4, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_9
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-nez p1, :cond_a

    .line 174
    .line 175
    move-object p1, v6

    .line 176
    goto :goto_6

    .line 177
    :cond_a
    move-object p1, v5

    .line 178
    :goto_6
    invoke-static {v3, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->W:Ljava/lang/CharSequence;

    .line 183
    .line 184
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    if-nez v3, :cond_b

    .line 189
    .line 190
    move-object v3, v6

    .line 191
    goto :goto_7

    .line 192
    :cond_b
    move-object v3, v5

    .line 193
    :goto_7
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->k0:Ljava/lang/CharSequence;

    .line 198
    .line 199
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result v3

    .line 203
    if-nez v3, :cond_c

    .line 204
    .line 205
    move-object v3, v6

    .line 206
    goto :goto_8

    .line 207
    :cond_c
    move-object v3, v5

    .line 208
    :goto_8
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->p0:Ljava/lang/CharSequence;

    .line 213
    .line 214
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 215
    .line 216
    .line 217
    move-result p0

    .line 218
    if-nez p0, :cond_d

    .line 219
    .line 220
    move-object v5, v6

    .line 221
    :cond_d
    invoke-static {v0, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    filled-new-array {p1, v2, v1, p0}, [Ll/sfj0$a;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-static {v4, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 230
    .line 231
    .line 232
    :cond_e
    return-void
.end method

.method public final s0()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->b0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/r97;->k5()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public setFpAnonymityIncludeSelfImage(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v2}, Ll/r97;->f3()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->X(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 64
    .line 65
    invoke-static {p1}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->getImageSmall()Lv/VDraweeView;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_5

    .line 85
    .line 86
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 87
    .line 88
    if-eqz v1, :cond_3

    .line 89
    .line 90
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-interface {p1}, Ll/r97;->T0()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-virtual {p0, v0, p1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 111
    .line 112
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->X(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz p0, :cond_4

    .line 123
    .line 124
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p0, v0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_4
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 135
    .line 136
    invoke-static {p1}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p0, v0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 145
    .line 146
    .line 147
    :cond_5
    return-void
.end method

.method public setOtherSmallImage(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v2}, Ll/r97;->f3()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->X(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->o:Lv/VDraweeView;

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->getImageSmall()Lv/VDraweeView;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_5

    .line 85
    .line 86
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 87
    .line 88
    if-eqz v1, :cond_3

    .line 89
    .line 90
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-interface {p1}, Ll/r97;->T0()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-virtual {p0, v0, p1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 111
    .line 112
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->X(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz p0, :cond_4

    .line 123
    .line 124
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p0, v0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_4
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p0, v0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 145
    .line 146
    .line 147
    :cond_5
    return-void
.end method

.method public t0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->U:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J0:Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->J0:Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;

    .line 15
    .line 16
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->v0(Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u0(Landroid/view/View;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void
.end method

.method public final u0(Landroid/view/View;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->U:Z

    .line 14
    .line 15
    new-instance v0, Ll/f800;

    .line 16
    .line 17
    invoke-direct {v0, p0, p2}, Ll/f800;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-wide/16 v1, 0x64

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final v0(Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->U:Z

    .line 14
    .line 15
    new-instance p0, Ll/e700;

    .line 16
    .line 17
    invoke-direct {p0, p2, p1}, Ll/e700;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;)V

    .line 18
    .line 19
    .line 20
    const-wide/16 v0, 0x64

    .line 21
    .line 22
    invoke-virtual {p1, p0, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final w0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, ""

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-nez p2, :cond_1

    .line 33
    .line 34
    return-object v1

    .line 35
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->M:Lv/VImage;

    .line 36
    .line 37
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_5

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-interface {p2}, Ll/r97;->a2()Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->M:Lv/VImage;

    .line 56
    .line 57
    if-eqz p2, :cond_3

    .line 58
    .line 59
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_2

    .line 72
    .line 73
    sget p2, Ll/ibc0;->B2:I

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    sget p2, Ll/ibc0;->A2:I

    .line 77
    .line 78
    :goto_0
    invoke-virtual {v0, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_3
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    if-eqz p2, :cond_4

    .line 95
    .line 96
    sget p2, Ll/ibc0;->C2:I

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_4
    sget p2, Ll/ibc0;->z2:I

    .line 100
    .line 101
    :goto_1
    invoke-virtual {v0, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 102
    .line 103
    .line 104
    :cond_5
    :goto_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 110
    .line 111
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->Z4:I

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v0, " "

    .line 121
    .line 122
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 126
    .line 127
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 128
    .line 129
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 138
    .line 139
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->o5:I

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 153
    .line 154
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 155
    .line 156
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->I0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    return-object p0
.end method

.method public x0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    const-string v2, ""

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherMomentId:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 47
    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    iget-object v0, v3, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherMomentId:Ljava/lang/String;

    .line 53
    .line 54
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P0:Z

    .line 55
    .line 56
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_0

    .line 61
    .line 62
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    :cond_0
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Q0:Ljava/lang/String;

    .line 65
    .line 66
    move-object v2, v0

    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iget-object p2, v3, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 69
    .line 70
    iget-object p2, p2, Lcom/p1/mobile/putong/data/RelationshipExtensions;->momentId:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-nez p2, :cond_2

    .line 77
    .line 78
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 79
    .line 80
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 81
    .line 82
    iget-object v2, p2, Lcom/p1/mobile/putong/data/RelationshipExtensions;->momentId:Ljava/lang/String;

    .line 83
    .line 84
    const/4 p2, 0x1

    .line 85
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->P0:Z

    .line 86
    .line 87
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 88
    .line 89
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Q0:Ljava/lang/String;

    .line 90
    .line 91
    :cond_2
    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-nez p2, :cond_3

    .line 96
    .line 97
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Q0:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-nez p2, :cond_3

    .line 104
    .line 105
    sget-object p2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->LOCAL_ID_INVALID:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {p2, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-nez p2, :cond_3

    .line 112
    .line 113
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->M0:Ll/kcg0;

    .line 114
    .line 115
    invoke-static {p2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 116
    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->Q0:Ljava/lang/String;

    .line 123
    .line 124
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 125
    .line 126
    invoke-interface {p2, v0, v2, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->momentRefresh(Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    new-instance v0, Ll/b700;

    .line 131
    .line 132
    invoke-direct {v0}, Ll/b700;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p2, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    new-instance v0, Ll/c700;

    .line 140
    .line 141
    invoke-direct {v0, p0, p1}, Ll/c700;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Lcom/p1/mobile/putong/data/User;)V

    .line 142
    .line 143
    .line 144
    new-instance p1, Ll/d700;

    .line 145
    .line 146
    invoke-direct {p1, p0}, Ll/d700;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->M0:Ll/kcg0;

    .line 158
    .line 159
    return-void

    .line 160
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a:Landroid/widget/FrameLayout;

    .line 161
    .line 162
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 163
    .line 164
    .line 165
    :cond_4
    return-void
.end method

.method public y0(Lcom/p1/mobile/android/app/Act;Ll/clz;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/clz<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/yxz;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->setMatchIcon(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->z0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/r97;->e()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->isSupremePartner()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->V()V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v0}, Ll/r97;->a2()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->u:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->W()V

    .line 74
    .line 75
    .line 76
    :cond_1
    :goto_0
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_2

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->C0()V

    .line 83
    .line 84
    .line 85
    iget-object v0, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 86
    .line 87
    invoke-virtual {p0, p4, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->D0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->E0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2}, Ll/clz;->pageId()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->t0(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 101
    .line 102
    invoke-virtual {p0, p1, p3, p4, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->A0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_2
    invoke-virtual {p2}, Ll/clz;->r3()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    const-string v0, "-10040"

    .line 111
    .line 112
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p3

    .line 116
    if-eqz p3, :cond_3

    .line 117
    .line 118
    const-string p3, "\u4f60\u597d\u5440\uff0c\u6211\u662f\u4f60\u7684\u63a2\u63a2\u4ed8\u8d39\u901a\u77e5\u5c0f\u52a9\u624b\u201c\u670d\u52a1\u63d0\u9192\u201d\uff0c\u5982\u9047\u5230\u4efb\u4f55\u4ed8\u8d39\u529f\u80fd\u76f8\u5173\u7684\u95ee\u9898\u90fd\u53ef\u4ee5\u627e\u6211\u5e2e\u4f60\u89e3\u51b3\u54e6"

    .line 119
    .line 120
    invoke-direct {p0, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->setOldDateInfo(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_3
    invoke-virtual {p2}, Ll/clz;->r3()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p3

    .line 128
    const-string v0, "-10021"

    .line 129
    .line 130
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p3

    .line 134
    if-eqz p3, :cond_4

    .line 135
    .line 136
    const-string p3, "AI\u601d\u601d\u6765\u5566\uff01\u662f\u6587\u7b14\u8d85\u68d2\uff0c\u5171\u60c5\u80fd\u529b\u8d85\u5f3a\u7684\u601d\u601d\u54e6\uff0c\u548c\u6211\u804a\u804a\u4f60\u7684\u611f\u60c5\u6545\u4e8b\u5427\uff0c\u6211\u4f1a\u597d\u597d\u5e2e\u4f60\u8bb0\u5f55\u4e0b\u6765\u7684~"

    .line 137
    .line 138
    invoke-direct {p0, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->setOldDateInfo(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_4
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->h4:I

    .line 143
    .line 144
    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p3

    .line 148
    invoke-direct {p0, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->setOldDateInfo(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    :goto_1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->H:Landroid/widget/LinearLayout;

    .line 152
    .line 153
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result p3

    .line 157
    const/4 v0, 0x1

    .line 158
    if-eqz p3, :cond_5

    .line 159
    .line 160
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->H:Landroid/widget/LinearLayout;

    .line 161
    .line 162
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a0(Lcom/p1/mobile/putong/data/User;)Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    xor-int/2addr v1, v0

    .line 167
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 168
    .line 169
    .line 170
    :cond_5
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->O0:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;

    .line 171
    .line 172
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p3

    .line 176
    const/4 v1, 0x0

    .line 177
    if-eqz p3, :cond_6

    .line 178
    .line 179
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->H:Landroid/widget/LinearLayout;

    .line 180
    .line 181
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->O0:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;

    .line 185
    .line 186
    invoke-virtual {p3, p1, p4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;->g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 187
    .line 188
    .line 189
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 190
    .line 191
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-eqz p1, :cond_8

    .line 196
    .line 197
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 198
    .line 199
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a0(Lcom/p1/mobile/putong/data/User;)Z

    .line 200
    .line 201
    .line 202
    move-result p3

    .line 203
    if-nez p3, :cond_7

    .line 204
    .line 205
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s:Lv/VText;

    .line 206
    .line 207
    invoke-virtual {p3}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 208
    .line 209
    .line 210
    move-result-object p3

    .line 211
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 212
    .line 213
    .line 214
    move-result p3

    .line 215
    if-nez p3, :cond_7

    .line 216
    .line 217
    move p3, v0

    .line 218
    goto :goto_2

    .line 219
    :cond_7
    move p3, v1

    .line 220
    :goto_2
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 221
    .line 222
    .line 223
    :cond_8
    iget-object p1, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 224
    .line 225
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-eqz p1, :cond_9

    .line 230
    .line 231
    iget-object p1, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 232
    .line 233
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 234
    .line 235
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result p1

    .line 239
    if-eqz p1, :cond_9

    .line 240
    .line 241
    iget-object p1, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 242
    .line 243
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 244
    .line 245
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 246
    .line 247
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    if-eqz p1, :cond_9

    .line 252
    .line 253
    iget-object p1, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 254
    .line 255
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 256
    .line 257
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 258
    .line 259
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationTag;->guide:Ljava/lang/String;

    .line 260
    .line 261
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    if-nez p1, :cond_9

    .line 266
    .line 267
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->N0:Landroid/widget/TextView;

    .line 268
    .line 269
    iget-object p2, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 270
    .line 271
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 272
    .line 273
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 274
    .line 275
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConversationTag;->guide:Ljava/lang/String;

    .line 276
    .line 277
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 278
    .line 279
    .line 280
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->N0:Landroid/widget/TextView;

    .line 281
    .line 282
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    :cond_9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->N0:Landroid/widget/TextView;

    .line 287
    .line 288
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 289
    .line 290
    .line 291
    return-void
.end method

.method public final z0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ll/ina;->z3(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a0(Lcom/p1/mobile/putong/data/User;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v0, v2

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    move v0, v1

    .line 23
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->C:Lv/VText;

    .line 24
    .line 25
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_3

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a0(Lcom/p1/mobile/putong/data/User;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->C:Lv/VText;

    .line 36
    .line 37
    if-eqz v3, :cond_2

    .line 38
    .line 39
    iget-object v3, p2, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_2
    iget-object v3, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    :goto_2
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->C:Lv/VText;

    .line 51
    .line 52
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 57
    .line 58
    .line 59
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->s0()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    const/16 v3, 0x8

    .line 64
    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F:Lv/VText;

    .line 68
    .line 69
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_5

    .line 74
    .line 75
    if-nez v0, :cond_5

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F:Lv/VText;

    .line 78
    .line 79
    new-instance v1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    const-string v4, " \u00b7 "

    .line 82
    .line 83
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v4, p2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 87
    .line 88
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v4, "\u5c81"

    .line 92
    .line 93
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F:Lv/VText;

    .line 104
    .line 105
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->D:Lv/VText;

    .line 109
    .line 110
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 111
    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->D:Lv/VText;

    .line 115
    .line 116
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_5

    .line 121
    .line 122
    if-nez v0, :cond_5

    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->D:Lv/VText;

    .line 125
    .line 126
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 127
    .line 128
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->F:Lv/VText;

    .line 136
    .line 137
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->D:Lv/VText;

    .line 141
    .line 142
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 143
    .line 144
    .line 145
    :cond_5
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->w:Lv/VDraweeView;

    .line 146
    .line 147
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_7

    .line 152
    .line 153
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 154
    .line 155
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 156
    .line 157
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->X(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_6

    .line 168
    .line 169
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 170
    .line 171
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->w:Lv/VDraweeView;

    .line 172
    .line 173
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_6
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->w:Lv/VDraweeView;

    .line 184
    .line 185
    invoke-static {p1}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 194
    .line 195
    .line 196
    :cond_7
    :goto_4
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a0(Lcom/p1/mobile/putong/data/User;)Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-nez p1, :cond_8

    .line 201
    .line 202
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->E:Lv/VText;

    .line 203
    .line 204
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    if-eqz p1, :cond_8

    .line 209
    .line 210
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->E:Lv/VText;

    .line 211
    .line 212
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->T(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    .line 218
    .line 219
    :cond_8
    return-void
.end method
