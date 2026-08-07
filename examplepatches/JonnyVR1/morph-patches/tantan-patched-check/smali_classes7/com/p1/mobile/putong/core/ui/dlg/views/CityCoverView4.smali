.class public Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;

.field public b:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverSmallCardView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
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

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, -0x1

    .line 12
    :goto_0
    const-string v1, "\u8d2d\u4e70\u5931\u8d25"

    .line 13
    .line 14
    invoke-static {v1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "\u8d2d\u4e70\u5931\u8d25\uff0cerror code \uff1a"

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, " error: "

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "[city_top]"

    .line 40
    .line 41
    invoke-static {v0, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic b(Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_city_cover_pay_confirm_cancel"

    .line 2
    .line 3
    const-string v0, "p_city_cover_pay_confirm_alert"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->o(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d(Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_city_cover_pay_confirm_yes"

    .line 2
    .line 3
    const-string v0, "p_city_cover_pay_confirm_alert"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic e(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->q()V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i()V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->m(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->n()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public getLocationStr()Ljava/lang/String;
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 10
    .line 11
    const-string v1, ""

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_0

    .line 40
    .line 41
    move-object v1, v0

    .line 42
    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    const-string v0, "null"

    .line 49
    .line 50
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v0, "(1km)"

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    :cond_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-nez p0, :cond_3

    .line 93
    .line 94
    const-string p0, ".\u521a\u521a\u6d3b\u8dc3"

    .line 95
    .line 96
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0

    .line 101
    :cond_3
    const-string p0, "\u521a\u521a\u6d3b\u8dc3"

    .line 102
    .line 103
    return-object p0
.end method

.method public final l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e65;->a(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final m(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "coin"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 12
    .line 13
    const-string v1, "suggestTopShow"

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v0, ""

    .line 25
    .line 26
    :goto_0
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 35
    .line 36
    invoke-virtual {v2, p1, v0}, Ll/no7;->A3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Ll/c65;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/c65;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;)V

    .line 47
    .line 48
    .line 49
    new-instance p0, Ll/d65;

    .line 50
    .line 51
    invoke-direct {p0}, Ll/d65;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final n()Z
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lqb;->r4()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/lqb;->Y4()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    int-to-long v2, p0

    .line 20
    cmp-long p0, v0, v2

    .line 21
    .line 22
    if-ltz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public final synthetic o(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->C1:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->f:Ll/y20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->f:Ll/y20;

    .line 21
    .line 22
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->l(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->e:Lv/VText;

    .line 8
    .line 9
    new-instance v1, Ll/v55;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/v55;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->e:Lv/VText;

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/4 v3, 0x1

    .line 25
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->c:Lv/VText;

    .line 29
    .line 30
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q()V
    .locals 1

    .line 1
    const-string v0, "coin"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->m(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final r()V
    .locals 5

    .line 1
    invoke-static {}, Ll/joa;->p3()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "privilege"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->m(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "chances"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->n()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/lqb;->r4()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    new-instance v1, Ll/w55;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/w55;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/x55;

    .line 35
    .line 36
    invoke-direct {v2}, Ll/x55;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->u(ILl/x20;Ll/x20;)V

    .line 40
    .line 41
    .line 42
    const-string v0, "enough_coins"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 58
    .line 59
    invoke-virtual {v2}, Ll/lqb;->r4()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    new-instance v3, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4$a;

    .line 64
    .line 65
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4$a;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;)V

    .line 66
    .line 67
    .line 68
    const/4 v4, 0x1

    .line 69
    invoke-interface {v0, v1, v4, v2, v3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Y8(Lcom/p1/mobile/android/app/Act;ZILl/x20;)V

    .line 70
    .line 71
    .line 72
    const-string v0, "not_enough_coins"

    .line 73
    .line 74
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->g:Ll/y20;

    .line 75
    .line 76
    if-eqz p0, :cond_2

    .line 77
    .line 78
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    return-void
.end method

.method public s()V
    .locals 3

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/lqb;->k5()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4$b;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4$b;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4$c;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4$c;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public t(Ll/y20;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->f:Ll/y20;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->g:Ll/y20;

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 16
    .line 17
    invoke-virtual {p2}, Ll/lqb;->r4()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->getLocationStr()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->b:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverSmallCardView;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, v2, p1, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverSmallCardView;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->c:Lv/VText;

    .line 39
    .line 40
    if-nez p2, :cond_0

    .line 41
    .line 42
    const-string v0, "-"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    :goto_0
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "\u82b1\u8d39%s\u63a2\u5e01\uff0c\u767b\u9876\u57ce\u5e02\u5c01\u9762"

    .line 54
    .line 55
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Ll/s75;->i()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    sub-int/2addr p1, p2

    .line 67
    if-gez p1, :cond_1

    .line 68
    .line 69
    const/4 p1, 0x0

    .line 70
    :cond_1
    div-int/lit8 p1, p1, 0xa

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->d:Lv/VText;

    .line 73
    .line 74
    invoke-static {}, Ll/s75;->i()I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    div-int/lit8 p2, p2, 0xa

    .line 79
    .line 80
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    const-string p2, "*\u6362\u7b97\u4e3a\u4eba\u6c11\u5e01\u539f\u4ef7\u00a5%s\uff0c\u4e13\u5c5e\u6298\u6263\u7acb\u51cf\u00a5%s"

    .line 93
    .line 94
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final u(ILl/x20;Ll/x20;)V
    .locals 3

    .line 1
    const-string v0, "p_city_cover_pay_confirm_alert"

    .line 2
    .line 3
    const-string v1, "CoinConsumeConfirmDialog"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/th0$a;

    .line 10
    .line 11
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-direct {v1, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v2, "\u672c\u6b21\u4e0a\u57ce\u5e02\u5c01\u9762\u5c06\u82b1\u8d39%d\u63a2\u5e01\uff0c\u786e\u8ba4\u82b1\u8d39"

    .line 31
    .line 32
    invoke-static {p0, v2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v1, p0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "\u786e\u8ba4"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance p1, Ll/y55;

    .line 47
    .line 48
    invoke-direct {p1, p2}, Ll/y55;-><init>(Ll/x20;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    new-instance p1, Ll/z55;

    .line 56
    .line 57
    invoke-direct {p1, p3}, Ll/z55;-><init>(Ll/x20;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->a:I

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    new-instance p1, Ll/a65;

    .line 71
    .line 72
    invoke-direct {p1, v0}, Ll/a65;-><init>(Ll/l4g0;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p1}, Ll/th0$a;->n(Landroid/content/DialogInterface$OnShowListener;)Ll/th0$a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    new-instance p1, Ll/b65;

    .line 80
    .line 81
    invoke-direct {p1, v0}, Ll/b65;-><init>(Ll/l4g0;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p1}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 93
    .line 94
    .line 95
    return-void
.end method
