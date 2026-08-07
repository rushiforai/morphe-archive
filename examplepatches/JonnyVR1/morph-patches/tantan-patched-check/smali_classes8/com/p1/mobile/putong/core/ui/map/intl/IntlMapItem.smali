.class public Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;
.super Lv/VLinear;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem$a;
    }
.end annotation


# instance fields
.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Lv/VText;

.field public j:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->j:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->j:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->j:I

    return-void
.end method

.method public static synthetic P(Ll/y20;Ll/lxw;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->i:Lv/VText;

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->h:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->g:Lv/VText;

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->e:Landroid/widget/LinearLayout;

    return-void
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->f:Lv/VText;

    return-void
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->c:Landroid/widget/LinearLayout;

    return-void
.end method

.method public static bridge synthetic X(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->d:Lv/VText;

    return-void
.end method


# virtual methods
.method public final Y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem$a;->a(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Z()Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapBaseAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapBaseAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public a0(Ll/xww;IIZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xww;->f()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v1, -0x1

    .line 12
    if-ne p3, v1, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->g:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/xww;->c()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->d:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->Z()Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapBaseAct;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    sget v2, Ll/c9c0;->x1:I

    .line 34
    .line 35
    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->f:Lv/VText;

    .line 43
    .line 44
    const-string p2, ""

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->d:Lv/VText;

    .line 51
    .line 52
    const v3, -0xaeaeaf

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->f:Lv/VText;

    .line 59
    .line 60
    if-ltz p2, :cond_1

    .line 61
    .line 62
    invoke-static {p2, v0}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const/4 p2, 0x0

    .line 68
    :goto_0
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->g:Lv/VText;

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/xww;->c()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->h:Lv/VImage;

    .line 81
    .line 82
    if-eqz p4, :cond_2

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_2
    const/4 v0, 0x4

    .line 86
    :goto_2
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    rem-int/lit8 p3, p3, 0x2

    .line 90
    .line 91
    if-nez p3, :cond_3

    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_3
    const v1, -0x40405

    .line 95
    .line 96
    .line 97
    :goto_3
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->j:I

    .line 98
    .line 99
    return-void
.end method

.method public b0(Ll/lxw;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/lxw;",
            "Ll/y20<",
            "Ll/lxw;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/lxw;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->g:Lv/VText;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/lxw;->b()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->e:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/aco;

    .line 26
    .line 27
    invoke-direct {v0, p2, p1}, Ll/aco;-><init>(Ll/y20;Ll/lxw;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->j:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->Y(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
