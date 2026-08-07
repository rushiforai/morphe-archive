.class public abstract Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/a;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008&\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001f\u0010\n\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H&\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0015\u0010\r\u001a\u00020\u000c2\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001f\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u000f2\u0006\u0010\t\u001a\u00020\u0008H\u0004\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/a;",
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/a;->e:Landroid/content/Context;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final getPageWidth(I)F
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/cf60;->getPageWidth(I)F

    .line 2
    .line 3
    .line 4
    const/high16 p0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    return p0
.end method

.method public bridge synthetic p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/a;->q(Landroid/view/ViewGroup;I)Landroid/widget/FrameLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final q(Landroid/view/ViewGroup;I)Landroid/widget/FrameLayout;
    .locals 4
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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/a;->e:Landroid/content/Context;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    sget-object v2, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->Companion:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout$a;

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout$a;->b()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout$a;->a()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {v0, v3, v1, v2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p0}, Ll/cf60;->getCount()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    add-int/lit8 v2, v2, -0x1

    .line 33
    .line 34
    if-ne p2, v2, :cond_1

    .line 35
    .line 36
    sget-object v2, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->Companion:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout$a;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout$a;->a()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout$a;->b()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-virtual {v0, v3, v1, v2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout;->Companion:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout$a;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout$a;->a()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlTopCardLayout$a;->a()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {v0, v3, v1, v2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 61
    .line 62
    .line 63
    :goto_0
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 64
    .line 65
    const/4 v2, -0x1

    .line 66
    const/4 v3, -0x2

    .line 67
    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/a;->r(Landroid/widget/FrameLayout;I)Landroid/widget/FrameLayout;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
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
