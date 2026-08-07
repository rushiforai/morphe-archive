.class public final Ll/dc90;
.super Ll/y4;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dc90$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 \u00182\u00020\u0001:\u0001\u000bB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u000eJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0017\u0010\u0013\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\nR\u0018\u0010\u0017\u001a\u0004\u0018\u00010\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u0019"
    }
    d2 = {
        "Ll/dc90;",
        "Ll/y4;",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;",
        "privilegeEntranceInfo",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V",
        "",
        "hidden",
        "",
        "s",
        "(Z)V",
        "a",
        "()Z",
        "b",
        "()V",
        "m",
        "",
        "h",
        "()Ljava/lang/String;",
        "j",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;",
        "d",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;",
        "_privilege_view",
        "Companion",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/dc90$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/dc90$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/dc90$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/dc90;->Companion:Ll/dc90$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/y4;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic p(Ll/dc90;Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;[I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dc90;->t(Ll/dc90;Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;[I)V

    return-void
.end method

.method public static synthetic q(Ll/dc90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dc90;->r(Ll/dc90;Landroid/view/View;)V

    return-void
.end method

.method public static final r(Ll/dc90;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/dc90;->h()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/y4;->f()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ie()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/y4;->o(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private final s(Z)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/dc90;->d:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;->get_light_svga()Lcom/tantan/library/svga/SVGAnimationView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, 0x1

    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {p0, v2, p1, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation$default(Lcom/tantan/library/svga/SVGAnimationView;ZILjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;->get_light_svga()Lcom/tantan/library/svga/SVGAnimationView;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    new-instance p1, Ll/bc90;

    .line 32
    .line 33
    invoke-direct {p1, p0, v0}, Ll/bc90;-><init>(Ll/dc90;Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, p1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;->get_light_svga()Lcom/tantan/library/svga/SVGAnimationView;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const/16 v7, 0x18

    .line 53
    .line 54
    const/4 v8, 0x0

    .line 55
    const-string v4, "https://auto.tancdn.com/v1/raw/f02f282a-b010-44d2-97a6-26182984414a12.pdf"

    .line 56
    .line 57
    const/4 v5, 0x0

    .line 58
    const/4 v6, 0x0

    .line 59
    move-object v1, p0

    .line 60
    invoke-static/range {v1 .. v8}, Ll/y4;->l(Ll/y4;Landroid/view/View;Lcom/tantan/library/svga/SVGAnimationView;Ljava/lang/String;ILcom/tantan/library/svga/AnimListener;ILjava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public static final t(Ll/dc90;Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;[I)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;->get_light_svga()Lcom/tantan/library/svga/SVGAnimationView;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/16 v6, 0x18

    .line 14
    .line 15
    const/4 v7, 0x0

    .line 16
    const-string v3, "https://auto.tancdn.com/v1/raw/f02f282a-b010-44d2-97a6-26182984414a12.pdf"

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    const/4 v5, 0x0

    .line 20
    move-object v0, p0

    .line 21
    invoke-static/range {v0 .. v7}, Ll/y4;->l(Ll/y4;Landroid/view/View;Lcom/tantan/library/svga/SVGAnimationView;Ljava/lang/String;ILcom/tantan/library/svga/AnimListener;ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/dk90;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeViewType;->HAS_PRIVILEGE_VIEW:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeViewType;

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, v2}, Ll/y4;->i(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeViewType;)Ll/n3m;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;

    .line 24
    .line 25
    iput-object v0, p0, Ll/dc90;->d:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;

    .line 26
    .line 27
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 28
    .line 29
    const/16 v1, 0x50

    .line 30
    .line 31
    invoke-static {v1}, Ll/txq;->c(I)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, -0x2

    .line 36
    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object p0, p0, Ll/dc90;->d:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;

    .line 48
    .line 49
    invoke-virtual {v1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public h()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "e_privilege_banner_svip"

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 p1, 0x1

    .line 5
    invoke-direct {p0, p1}, Ll/dc90;->s(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/y4;->m()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dc90;->d:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    sget v1, Ll/jbc0;->s3:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;->get_texture()Lv/VImage;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget v2, Ll/jbc0;->y3:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;->get_border()Lv/VImage;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget v2, Ll/jbc0;->t3:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;->get_light_icon_svga()Lcom/tantan/library/svga/SVGAnimationView;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    sget v3, Ll/jbc0;->v3:I

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;->get_iv_privilege_icon()Lv/VImage;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    sget v2, Ll/jbc0;->g6:I

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;->get_vip_desc()Lv/VText;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    sget v3, Ll/h9c0;->u:I

    .line 74
    .line 75
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    .line 81
    .line 82
    const-string v1, "svip"

    .line 83
    .line 84
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {v1}, Ll/dk90;->d(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v2}, Ll/xzc0;->M()Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-virtual {v3}, Ll/xzc0;->y()Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v2, :cond_0

    .line 109
    .line 110
    if-eqz v3, :cond_0

    .line 111
    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->c7()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;->get_vip_desc()Lv/VText;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceHasPrivilegeView;->get_vip_go()Lv/VImage;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    sget v2, Ll/jbc0;->C9:I

    .line 136
    .line 137
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 138
    .line 139
    .line 140
    const/4 v1, 0x0

    .line 141
    invoke-direct {p0, v1}, Ll/dc90;->s(Z)V

    .line 142
    .line 143
    .line 144
    new-instance v1, Ll/cc90;

    .line 145
    .line 146
    invoke-direct {v1, p0}, Ll/cc90;-><init>(Ll/dc90;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 150
    .line 151
    .line 152
    :cond_1
    return-void
.end method
