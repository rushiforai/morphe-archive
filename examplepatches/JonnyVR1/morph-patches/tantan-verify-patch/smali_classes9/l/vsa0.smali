.class public Ll/vsa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vsa0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ssa0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Lv/VFrame;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

.field public i:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public final j:Landroid/content/Context;

.field public final k:Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;

.field public l:Ll/ssa0;

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public n:Z

.field public o:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/vsa0;->m:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/vsa0;->n:Z

    .line 13
    .line 14
    const/4 v0, -0x1

    .line 15
    iput v0, p0, Ll/vsa0;->o:I

    .line 16
    .line 17
    iput-object p1, p0, Ll/vsa0;->j:Landroid/content/Context;

    .line 18
    .line 19
    iput-object p2, p0, Ll/vsa0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;

    .line 20
    .line 21
    return-void
.end method

.method private C(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "-"

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/vsa0;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/vsa0;->w(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    return-void
.end method

.method public static synthetic b(Ll/vsa0;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/vsa0;->x(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    return-void
.end method

.method public static bridge synthetic c(Ll/vsa0;Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsa0;->i:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    return-void
.end method

.method public static bridge synthetic d(Ll/vsa0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsa0;->a:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic e(Ll/vsa0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsa0;->g:Lv/VText;

    return-void
.end method

.method public static bridge synthetic f(Ll/vsa0;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsa0;->c:Lv/VFrame;

    return-void
.end method

.method public static bridge synthetic i(Ll/vsa0;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    return-void
.end method

.method public static bridge synthetic j(Ll/vsa0;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    return-void
.end method

.method public static bridge synthetic k(Ll/vsa0;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    return-void
.end method

.method public static bridge synthetic l(Ll/vsa0;Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

    return-void
.end method

.method public static bridge synthetic m(Ll/vsa0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsa0;->b:Landroid/widget/TextView;

    return-void
.end method

.method private v(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HometownSuggest;->china:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;

    .line 40
    .line 41
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->region:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->subRegion:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->subRegion:Ljava/util/List;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_2
    return-object v0
.end method

.method private synthetic w(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/vsa0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic x(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/vsa0;->z(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public A(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->a0(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public A3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/vsa0;->a:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/vsa0;->a:Landroid/widget/TextView;

    .line 13
    .line 14
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HometownSuggest;->china:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/p1/mobile/putong/core/data/HometownChinaItem;

    .line 50
    .line 51
    iget-object v1, p0, Ll/vsa0;->m:Ljava/util/List;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->region:Ljava/lang/String;

    .line 54
    .line 55
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-static {}, Ll/xra;->w()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    iget-object p1, p0, Ll/vsa0;->g:Lv/VText;

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    :cond_2
    iget-object p1, p0, Ll/vsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 72
    .line 73
    new-instance v0, Ll/tsa0;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/tsa0;-><init>(Ll/vsa0;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setOnItemSelectedListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/vsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 82
    .line 83
    new-instance v0, Ll/usa0;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Ll/usa0;-><init>(Ll/vsa0;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setOnItemSelectedListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Ll/vsa0;->i:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 92
    .line 93
    iget-object v0, p0, Ll/vsa0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ll/vsa0;->u()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object p0, p0, Ll/vsa0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public B(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/xra;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/vsa0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->U4()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/vsa0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 19
    .line 20
    invoke-static {v0}, Ll/tr90;->m(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-nez v2, :cond_0

    .line 29
    .line 30
    iget-object v2, p0, Ll/vsa0;->b:Landroid/widget/TextView;

    .line 31
    .line 32
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/vsa0;->b:Landroid/widget/TextView;

    .line 36
    .line 37
    const/high16 v3, 0x41400000    # 12.0f

    .line 38
    .line 39
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-static {v2, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Ll/vsa0;->c:Lv/VFrame;

    .line 47
    .line 48
    const/high16 v3, 0x41d80000    # 27.0f

    .line 49
    .line 50
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-static {v2, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Ll/vsa0;->b:Landroid/widget/TextView;

    .line 58
    .line 59
    const/high16 v3, 0x41700000    # 15.0f

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Ll/vsa0;->b:Landroid/widget/TextView;

    .line 65
    .line 66
    const-string v3, "#a9a9a9"

    .line 67
    .line 68
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ll/vsa0;->b:Landroid/widget/TextView;

    .line 76
    .line 77
    const-string v3, "\u9884\u8ba1\u7b26\u5408%s\u4eba\u7684\u7406\u60f3\u578b"

    .line 78
    .line 79
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->W0:I

    .line 100
    .line 101
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->n2:I

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    iget-object v2, p0, Ll/vsa0;->c:Lv/VFrame;

    .line 122
    .line 123
    invoke-static {v2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    iget-object v2, p0, Ll/vsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 127
    .line 128
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Ll/vsa0;->u()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 144
    .line 145
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 146
    .line 147
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 148
    .line 149
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 150
    .line 151
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    const/4 v3, 0x0

    .line 156
    if-nez v2, :cond_7

    .line 157
    .line 158
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    check-cast v2, Ljava/lang/CharSequence;

    .line 163
    .line 164
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    sget v5, Lcom/p1/mobile/putong/core/profile/R$string;->W0:I

    .line 169
    .line 170
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    if-eqz v2, :cond_7

    .line 179
    .line 180
    iget-object v1, p0, Ll/vsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 181
    .line 182
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 183
    .line 184
    .line 185
    iget-object v1, p0, Ll/vsa0;->m:Ljava/util/List;

    .line 186
    .line 187
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    iget-object v2, p0, Ll/vsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 192
    .line 193
    if-eqz v1, :cond_1

    .line 194
    .line 195
    invoke-direct {p0, v2}, Ll/vsa0;->C(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 196
    .line 197
    .line 198
    iget-object v1, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 199
    .line 200
    invoke-direct {p0, v1}, Ll/vsa0;->C(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 201
    .line 202
    .line 203
    goto/16 :goto_2

    .line 204
    .line 205
    :cond_1
    iget-object v1, p0, Ll/vsa0;->m:Ljava/util/List;

    .line 206
    .line 207
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p0}, Ll/vsa0;->u()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 223
    .line 224
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 225
    .line 226
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 227
    .line 228
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 229
    .line 230
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 231
    .line 232
    .line 233
    move-result v2

    .line 234
    if-nez v2, :cond_2

    .line 235
    .line 236
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    check-cast v2, Ljava/lang/CharSequence;

    .line 241
    .line 242
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 243
    .line 244
    .line 245
    move-result v2

    .line 246
    if-nez v2, :cond_2

    .line 247
    .line 248
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    check-cast v1, Ljava/lang/String;

    .line 253
    .line 254
    iget-object v2, p0, Ll/vsa0;->m:Ljava/util/List;

    .line 255
    .line 256
    invoke-interface {v2, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 257
    .line 258
    .line 259
    move-result v2

    .line 260
    goto :goto_0

    .line 261
    :cond_2
    const-string v1, ""

    .line 262
    .line 263
    move v2, v3

    .line 264
    :goto_0
    iget-object v4, p0, Ll/vsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 265
    .line 266
    const/4 v5, -0x1

    .line 267
    if-ne v2, v5, :cond_3

    .line 268
    .line 269
    move v2, v3

    .line 270
    :cond_3
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 271
    .line 272
    .line 273
    invoke-direct {p0, v1}, Ll/vsa0;->v(Ljava/lang/String;)Ljava/util/List;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 278
    .line 279
    .line 280
    move-result v2

    .line 281
    iget-object v4, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 282
    .line 283
    if-nez v2, :cond_6

    .line 284
    .line 285
    invoke-virtual {v4, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0}, Ll/vsa0;->u()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 293
    .line 294
    .line 295
    move-result-object v2

    .line 296
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 297
    .line 298
    .line 299
    move-result-object v2

    .line 300
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 301
    .line 302
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 303
    .line 304
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 305
    .line 306
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 307
    .line 308
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 309
    .line 310
    .line 311
    move-result v4

    .line 312
    if-nez v4, :cond_5

    .line 313
    .line 314
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object v2

    .line 318
    check-cast v2, Ljava/lang/CharSequence;

    .line 319
    .line 320
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 321
    .line 322
    .line 323
    move-result v2

    .line 324
    if-nez v2, :cond_5

    .line 325
    .line 326
    iget-object v2, p0, Ll/vsa0;->m:Ljava/util/List;

    .line 327
    .line 328
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    invoke-interface {v2, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 333
    .line 334
    .line 335
    move-result v1

    .line 336
    iget-object v2, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 337
    .line 338
    if-ne v1, v5, :cond_4

    .line 339
    .line 340
    goto :goto_1

    .line 341
    :cond_4
    move v3, v1

    .line 342
    :goto_1
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 343
    .line 344
    .line 345
    goto :goto_2

    .line 346
    :cond_5
    iget-object v1, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 347
    .line 348
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 349
    .line 350
    .line 351
    goto :goto_2

    .line 352
    :cond_6
    invoke-direct {p0, v4}, Ll/vsa0;->C(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 353
    .line 354
    .line 355
    goto :goto_2

    .line 356
    :cond_7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 357
    .line 358
    .line 359
    move-result v2

    .line 360
    if-nez v2, :cond_8

    .line 361
    .line 362
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 363
    .line 364
    .line 365
    move-result-object v2

    .line 366
    check-cast v2, Ljava/lang/CharSequence;

    .line 367
    .line 368
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 369
    .line 370
    .line 371
    move-result-object v3

    .line 372
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 373
    .line 374
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v3

    .line 378
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 379
    .line 380
    .line 381
    move-result v2

    .line 382
    if-eqz v2, :cond_8

    .line 383
    .line 384
    iget-object v1, p0, Ll/vsa0;->g:Lv/VText;

    .line 385
    .line 386
    iget-object v2, p0, Ll/vsa0;->j:Landroid/content/Context;

    .line 387
    .line 388
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->r2:I

    .line 389
    .line 390
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v2

    .line 394
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 395
    .line 396
    .line 397
    iget-object v1, p0, Ll/vsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 398
    .line 399
    const/4 v2, 0x2

    .line 400
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 401
    .line 402
    .line 403
    iget-object v1, p0, Ll/vsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 404
    .line 405
    invoke-direct {p0, v1}, Ll/vsa0;->C(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 406
    .line 407
    .line 408
    iget-object v1, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 409
    .line 410
    invoke-direct {p0, v1}, Ll/vsa0;->C(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 411
    .line 412
    .line 413
    goto :goto_2

    .line 414
    :cond_8
    iget-object v2, p0, Ll/vsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 415
    .line 416
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 417
    .line 418
    .line 419
    iget-object v1, p0, Ll/vsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 420
    .line 421
    invoke-direct {p0, v1}, Ll/vsa0;->C(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 422
    .line 423
    .line 424
    iget-object v1, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 425
    .line 426
    invoke-direct {p0, v1}, Ll/vsa0;->C(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 427
    .line 428
    .line 429
    :goto_2
    invoke-virtual {p0, p1, v0}, Ll/vsa0;->E(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/util/List;)V

    .line 430
    .line 431
    .line 432
    iget-object p0, p0, Ll/vsa0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;

    .line 433
    .line 434
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->f5()V

    .line 435
    .line 436
    .line 437
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vsa0;->j:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ljava/lang/CharSequence;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->W0:I

    .line 19
    .line 20
    invoke-virtual {p2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    :cond_0
    iget-object p0, p0, Ll/vsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->setVisible(Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ssa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vsa0;->p(Ll/ssa0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vsa0;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vsa0$a;->a(Ll/vsa0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Ll/ssa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsa0;->l:Ll/ssa0;

    .line 2
    .line 3
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/vsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getSelectItem()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/vsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getSelectItem()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getSelectItem()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const-string v3, "-"

    .line 32
    .line 33
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    const-string v5, ""

    .line 38
    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    move-object v1, v5

    .line 42
    :cond_0
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_1

    .line 47
    .line 48
    move-object v2, v5

    .line 49
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v4, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .line 58
    .line 59
    new-instance v6, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    sget v8, Lcom/p1/mobile/putong/core/profile/R$string;->m2:I

    .line 69
    .line 70
    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    invoke-static {v7, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    if-nez v7, :cond_3

    .line 79
    .line 80
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    .line 83
    move-result-object v7

    .line 84
    sget v8, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 85
    .line 86
    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v7

    .line 90
    invoke-static {v7, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    if-eqz v7, :cond_2

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    sget v7, Lcom/p1/mobile/putong/core/profile/R$string;->W0:I

    .line 102
    .line 103
    invoke-virtual {v5, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    invoke-static {v5, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v5

    .line 111
    if-eqz v5, :cond_4

    .line 112
    .line 113
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 123
    .line 124
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 125
    .line 126
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 127
    .line 128
    iput-object v3, v0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 129
    .line 130
    iput-object v4, v0, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 131
    .line 132
    iput-object v6, v0, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_3
    :goto_0
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 145
    .line 146
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 147
    .line 148
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 149
    .line 150
    iput-object v3, v0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 151
    .line 152
    iput-object v4, v0, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 153
    .line 154
    iput-object v6, v0, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 155
    .line 156
    :cond_4
    :goto_1
    iget-object p0, p0, Ll/vsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

    .line 157
    .line 158
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->W(Lcom/p1/mobile/putong/data/User;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public s()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vsa0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public u()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vsa0;->j:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public y(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vsa0;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->W0:I

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move p1, v1

    .line 29
    :goto_0
    iget-object v0, p0, Ll/vsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 30
    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    iget-object v2, p0, Ll/vsa0;->m:Ljava/util/List;

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/vsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/vsa0;->m:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct {p0, v0}, Ll/vsa0;->v(Ljava/lang/String;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    iget-object v3, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 60
    .line 61
    if-nez v2, :cond_1

    .line 62
    .line 63
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    invoke-direct {p0, v3}, Ll/vsa0;->C(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    invoke-direct {p0, v0}, Ll/vsa0;->C(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 80
    .line 81
    invoke-direct {p0, v0}, Ll/vsa0;->C(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 82
    .line 83
    .line 84
    :goto_1
    iget-object p0, p0, Ll/vsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->setVisible(Z)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public z(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/vsa0;->v(Ljava/lang/String;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/vsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-direct {p0, v1}, Ll/vsa0;->C(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
