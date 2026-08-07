.class public abstract Ll/em2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qql;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qql<",
        "Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;",
        "Landroid/widget/FrameLayout;",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# static fields
.field public static a:I

.field public static b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41800000    # 16.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/em2;->a:I

    .line 8
    .line 9
    const/high16 v0, 0x42dc0000    # 110.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Ll/em2;->b:I

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Landroid/widget/FrameLayout;Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, -0x2

    .line 5
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 6
    .line 7
    .line 8
    const/16 v1, 0x50

    .line 9
    .line 10
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/em2;->e()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/em2;->f()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/em2;->d(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    sget p0, Ll/em2;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    sget p0, Ll/em2;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public j(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Ll/qk4;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/em2;->l(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/data/User;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->c()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;->setHideCertificationIcon(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->g()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p1, p4, p3, p0, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;->q(Lcom/p1/mobile/putong/data/User;IZZ)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/em2;->n(Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/data/User;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    move-object p4, v0

    .line 21
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->b()Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->e()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    move v1, v3

    .line 40
    goto :goto_1

    .line 41
    :cond_2
    move v1, v2

    .line 42
    :goto_1
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->b:Z

    .line 43
    .line 44
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    move v1, v3

    .line 57
    goto :goto_2

    .line 58
    :cond_3
    move v1, v2

    .line 59
    :goto_2
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->a:Z

    .line 60
    .line 61
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->g()Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    move v1, v3

    .line 74
    goto :goto_3

    .line 75
    :cond_4
    move v1, v2

    .line 76
    :goto_3
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->c:Z

    .line 77
    .line 78
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_5

    .line 83
    .line 84
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->k()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_5

    .line 89
    .line 90
    move v1, v3

    .line 91
    goto :goto_4

    .line 92
    :cond_5
    move v1, v2

    .line 93
    :goto_4
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->d:Z

    .line 94
    .line 95
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->e:Z

    .line 100
    .line 101
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->f:Z

    .line 106
    .line 107
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->g:Lcom/p1/mobile/putong/data/User;

    .line 108
    .line 109
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_6

    .line 114
    .line 115
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    :cond_6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->h:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 120
    .line 121
    iget-object p2, p1, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->g:Lv/VText;

    .line 122
    .line 123
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    invoke-static {}, Ll/gra;->T2()Z

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->i:Z

    .line 131
    .line 132
    invoke-virtual {p1, p4, p3, v3, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->X(Lcom/p1/mobile/putong/data/User;IZLcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method
