.class public abstract Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/a;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008&\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001f\u0010\n\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H&\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0015\u0010\r\u001a\u00020\u000c2\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001f\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u000f2\u0006\u0010\t\u001a\u00020\u0008H\u0004\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/a;",
        "Ll/lb2;",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Landroid/content/Context;)V",
        "Landroid/widget/FrameLayout;",
        "container",
        "",
        "position",
        "r",
        "(Landroid/widget/FrameLayout;I)Landroid/widget/FrameLayout;",
        "",
        "getPageWidth",
        "(I)F",
        "Landroid/view/ViewGroup;",
        "q",
        "(Landroid/view/ViewGroup;I)Landroid/widget/FrameLayout;",
        "e",
        "Landroid/content/Context;",
        "getContext",
        "()Landroid/content/Context;",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final e:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/a;->e:Landroid/content/Context;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final getPageWidth(I)F
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/cf60;->getPageWidth(I)F

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/cf60;->getCount()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    add-int/lit8 p0, p0, -0x1

    .line 11
    .line 12
    if-ne p1, p0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;->Companion:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$a;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$a;->c()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$a;->b()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    add-int/2addr v0, p1

    .line 30
    sub-int/2addr p0, v0

    .line 31
    int-to-float p0, p0

    .line 32
    invoke-static {}, Ll/bnl0;->y0()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    :goto_0
    int-to-float p1, p1

    .line 37
    div-float/2addr p0, p1

    .line 38
    return p0

    .line 39
    :cond_1
    :goto_1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    sget-object p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;->Companion:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$a;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$a;->c()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$a;->a()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    add-int/2addr v0, p1

    .line 54
    sub-int/2addr p0, v0

    .line 55
    int-to-float p0, p0

    .line 56
    invoke-static {}, Ll/bnl0;->y0()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    goto :goto_0
.end method

.method public bridge synthetic p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/a;->q(Landroid/view/ViewGroup;I)Landroid/widget/FrameLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final q(Landroid/view/ViewGroup;I)Landroid/widget/FrameLayout;
    .locals 5
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/widget/FrameLayout;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/a;->e:Landroid/content/Context;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/bnl0;->y0()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {}, Ll/bnl0;->y0()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    sget-object v3, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;->Companion:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$a;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$a;->c()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    sub-int/2addr v2, v4

    .line 26
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$a;->b()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    sub-int/2addr v2, v4

    .line 31
    sub-int/2addr v1, v2

    .line 32
    div-int/lit8 v2, v1, 0x2

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    if-nez p2, :cond_0

    .line 36
    .line 37
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$a;->c()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$a;->b()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {v0, v1, v4, v2, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {p0}, Ll/cf60;->getCount()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    add-int/lit8 v3, v3, -0x1

    .line 54
    .line 55
    if-ne p2, v3, :cond_1

    .line 56
    .line 57
    sub-int/2addr v1, v2

    .line 58
    invoke-virtual {v0, v2, v4, v1, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    invoke-virtual {v0, v2, v4, v2, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 63
    .line 64
    .line 65
    :goto_0
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 66
    .line 67
    const/4 v2, -0x1

    .line 68
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/a;->r(Landroid/widget/FrameLayout;I)Landroid/widget/FrameLayout;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public abstract r(Landroid/widget/FrameLayout;I)Landroid/widget/FrameLayout;
    .param p1    # Landroid/widget/FrameLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method
