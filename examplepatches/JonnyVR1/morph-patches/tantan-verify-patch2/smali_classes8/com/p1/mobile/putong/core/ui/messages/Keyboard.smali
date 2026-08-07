.class public Lcom/p1/mobile/putong/core/ui/messages/Keyboard;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;
    }
.end annotation


# instance fields
.field public A:I

.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VList_Horizontal;

.field public c:Lcom/google/android/material/appbar/AppBarLayout;

.field public d:Lcom/google/android/material/tabs/TabLayout;

.field public e:Lv/VPager;

.field public f:Lv/VPager;

.field public g:Lv/VPagerCircleIndicator;

.field public h:Landroid/view/View;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lv/VList_Horizontal;

.field public k:Lv/VFrame;

.field public l:Lv/VFrame;

.field public m:Lv/VButton_FakeShadow;

.field public n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;"
        }
    .end annotation
.end field

.field public p:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

.field public q:Ll/au9;

.field public r:Ll/w0r;

.field public s:Ll/x20;

.field public t:Ll/x20;

.field public u:Z

.field public v:Z

.field public final w:I

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->n:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->o:Ljava/util/List;

    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Ll/b0r;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->u:Z

    .line 23
    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->v:Z

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p1}, Ll/r97;->q()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    const/4 v0, 0x3

    .line 39
    const/4 v1, 0x2

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    move p1, v1

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move p1, v0

    .line 45
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->w:I

    .line 46
    .line 47
    const/high16 p1, 0x42240000    # 41.0f

    .line 48
    .line 49
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->x:I

    .line 54
    .line 55
    const/high16 p1, 0x42080000    # 34.0f

    .line 56
    .line 57
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->y:I

    .line 62
    .line 63
    const/high16 p1, 0x41600000    # 14.0f

    .line 64
    .line 65
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->z:I

    .line 70
    .line 71
    invoke-static {}, Ll/bnl0;->y0()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    const/high16 v2, 0x42000000    # 32.0f

    .line 76
    .line 77
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    sub-int/2addr p1, v2

    .line 82
    div-int/2addr p1, v0

    .line 83
    const/high16 v0, 0x41800000    # 16.0f

    .line 84
    .line 85
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    sub-int/2addr p1, v0

    .line 90
    div-int/2addr p1, v1

    .line 91
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->A:I

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->q()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 97
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 98
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->n:Ljava/util/List;

    const/4 p1, 0x0

    .line 99
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->o:Ljava/util/List;

    .line 100
    new-instance p2, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Ll/b0r;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    const/4 p1, 0x0

    .line 101
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->u:Z

    .line 102
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->v:Z

    .line 103
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p1

    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p1

    invoke-interface {p1}, Ll/r97;->q()Z

    move-result p1

    const/4 p2, 0x3

    const/4 v0, 0x2

    if-eqz p1, :cond_0

    move p1, v0

    goto :goto_0

    :cond_0
    move p1, p2

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->w:I

    const/high16 p1, 0x42240000    # 41.0f

    .line 104
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->x:I

    const/high16 p1, 0x42080000    # 34.0f

    .line 105
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->y:I

    const/high16 p1, 0x41600000    # 14.0f

    .line 106
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->z:I

    .line 107
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p1

    const/high16 v1, 0x42000000    # 32.0f

    invoke-static {v1}, Ll/qa00;->d(F)I

    move-result v1

    sub-int/2addr p1, v1

    div-int/2addr p1, p2

    const/high16 p2, 0x41800000    # 16.0f

    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    sub-int/2addr p1, p2

    div-int/2addr p1, v0

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->A:I

    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->q()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 109
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 110
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->n:Ljava/util/List;

    const/4 p1, 0x0

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->o:Ljava/util/List;

    .line 112
    new-instance p2, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Ll/b0r;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    const/4 p1, 0x0

    .line 113
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->u:Z

    .line 114
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->v:Z

    .line 115
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p1

    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p1

    invoke-interface {p1}, Ll/r97;->q()Z

    move-result p1

    const/4 p2, 0x3

    const/4 p3, 0x2

    if-eqz p1, :cond_0

    move p1, p3

    goto :goto_0

    :cond_0
    move p1, p2

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->w:I

    const/high16 p1, 0x42240000    # 41.0f

    .line 116
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->x:I

    const/high16 p1, 0x42080000    # 34.0f

    .line 117
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->y:I

    const/high16 p1, 0x41600000    # 14.0f

    .line 118
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->z:I

    .line 119
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p1

    const/high16 v0, 0x42000000    # 32.0f

    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    sub-int/2addr p1, v0

    div-int/2addr p1, p2

    const/high16 p2, 0x41800000    # 16.0f

    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    sub-int/2addr p1, p2

    div-int/2addr p1, p3

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->A:I

    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->q()V

    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->s(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->z()V

    return-void
.end method

.method public static synthetic d(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->t()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->y(Lcom/p1/mobile/putong/core/data/Sticker;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->x(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->u(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->A(Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->v(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)Ll/au9;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->q:Ll/au9;

    return-object p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->w:I

    return p0
.end method

.method private setPagerAdapterByPage(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, p1, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->r:Ll/w0r;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/w0r;->Y()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic A(Ll/pf60;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->n()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/clz;->e6()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->d()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/clz;->d6()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_2

    .line 66
    .line 67
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 68
    .line 69
    return-object p0

    .line 70
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_3
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 74
    .line 75
    return-object p0
.end method

.method public C()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->r:Ll/w0r;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->r:Ll/w0r;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/w0r;->W()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->o:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->o:Ljava/util/List;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->D(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public D(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->o:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/vzq;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/vzq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->r:Ll/w0r;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ll/w0r;->V(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->q:Ll/au9;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/au9;->w(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    iget-object p1, p1, Ll/dkb;->M1:Ll/vxd0;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Ljava/lang/Integer;

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->q:Ll/au9;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/au9;->getCount()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-ge p1, v0, :cond_1

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->q:Ll/au9;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ll/au9;->y(I)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->H(Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 74
    .line 75
    iget-object p1, p1, Ll/dkb;->M1:Ll/vxd0;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Ljava/lang/Integer;

    .line 82
    .line 83
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/a;->getCount()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-ge p1, v0, :cond_1

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    .line 96
    .line 97
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->y(Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;I)V

    .line 98
    .line 99
    .line 100
    :cond_1
    return-void
.end method

.method public E()V
    .locals 0

    .line 1
    return-void
.end method

.method public getCurrentPackage()Ll/vxd0;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->M1:Ll/vxd0;

    .line 6
    .line 7
    return-object p0
.end method

.method public final n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s1r;->a(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final o(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/t1r;->a(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/data/Link;

    .line 2
    .line 3
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/Link;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "sticker"

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LinkIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkIntent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "https://r.tantanapp.com/user/"

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 37
    .line 38
    new-instance v1, Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 39
    .line 40
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;-><init>(Lcom/p1/mobile/putong/data/Link;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->b6:I

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->c6:I

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    const/4 v5, 0x0

    .line 68
    const/4 v6, 0x0

    .line 69
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->w0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Z)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    new-instance v0, Ll/nzq;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/nzq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    .line 76
    .line 77
    .line 78
    new-instance v2, Ll/pzq;

    .line 79
    .line 80
    invoke-direct {v2, p0}, Ll/pzq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v0, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->t:Ll/x20;

    .line 91
    .line 92
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_0

    .line 97
    .line 98
    new-instance p1, Ll/qzq;

    .line 99
    .line 100
    invoke-direct {p1, p0}, Ll/qzq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->t0(Ll/z20;)Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 104
    .line 105
    .line 106
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 11

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->n:Ljava/util/List;

    .line 19
    .line 20
    sget-object v1, Ll/hxj0$a;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->n:Ljava/util/List;

    .line 26
    .line 27
    sget-object v1, Ll/hxj0$a;->b:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->n:Ljava/util/List;

    .line 33
    .line 34
    sget-object v1, Ll/hxj0$a;->c:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->o(Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->b:Lv/VList_Horizontal;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->j:Lv/VList_Horizontal;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->e:Lv/VPager;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->a:Landroid/widget/LinearLayout;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->i:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    new-instance v0, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/tye;->d()Ljava/util/ArrayList;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->j:Lv/VList_Horizontal;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->q:Ll/au9;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lv/VList_Horizontal;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->j:Lv/VList_Horizontal;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->q:Ll/au9;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 79
    .line 80
    .line 81
    new-instance v1, Ll/w0r;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    new-instance v3, Ll/rzq;

    .line 88
    .line 89
    invoke-direct {v3, p0}, Ll/rzq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    .line 90
    .line 91
    .line 92
    new-instance v4, Ll/szq;

    .line 93
    .line 94
    invoke-direct {v4, p0}, Ll/szq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Ll/d3z;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->n:Ljava/util/List;

    .line 120
    .line 121
    new-instance v8, Ll/tzq;

    .line 122
    .line 123
    invoke-direct {v8, p0}, Ll/tzq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    .line 124
    .line 125
    .line 126
    const/4 v9, 0x0

    .line 127
    const/4 v10, 0x0

    .line 128
    invoke-direct/range {v1 .. v10}, Ll/w0r;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/List;Ll/x20;ZZ)V

    .line 129
    .line 130
    .line 131
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->r:Ll/w0r;

    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 139
    .line 140
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$a;

    .line 141
    .line 142
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_0
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->n(Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->j:Lv/VList_Horizontal;

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    .line 155
    .line 156
    invoke-virtual {v0, v1}, Lv/VList_Horizontal;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->j:Lv/VList_Horizontal;

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->k:Lv/VFrame;

    .line 167
    .line 168
    new-instance v1, Ll/uzq;

    .line 169
    .line 170
    invoke-direct {v1}, Ll/uzq;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->m:Lv/VButton_FakeShadow;

    .line 177
    .line 178
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->l:Lv/VFrame;

    .line 182
    .line 183
    const/4 v1, 0x4

    .line 184
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->k:Lv/VFrame;

    .line 188
    .line 189
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 190
    .line 191
    .line 192
    const v0, -0x1b1713

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final q()V
    .locals 1

    .line 1
    new-instance v0, Ll/au9;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/au9;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->q:Ll/au9;

    .line 7
    .line 8
    return-void
.end method

.method public r()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->l:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final synthetic s(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->l:Lv/VFrame;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->k:Lv/VFrame;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->s:Ll/x20;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->s:Ll/x20;

    .line 21
    .line 22
    invoke-interface {p0}, Ll/x20;->call()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public setNestedScrolling(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->r:Ll/w0r;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->r:Ll/w0r;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/w0r;->c0(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setShareCancelCallbackListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->t:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setUnlockSuccessListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->s:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic t()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->S:Lcom/p1/mobile/putong/core/api/z$b;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/z$b;->E()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/xzq;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/xzq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/ozq;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/ozq;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic u(Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/wzq;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/wzq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic v(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/ui/share/ShareHelper$PlatformNotFoundException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/tcz;->N(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p1, "cancel"

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->t:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic x(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->C2()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p1}, Ll/u1z;->B1(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0}, Ll/clz;->R6(Lcom/p1/mobile/putong/core/data/Sticker;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic z()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->p()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/u1z;->k1()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
