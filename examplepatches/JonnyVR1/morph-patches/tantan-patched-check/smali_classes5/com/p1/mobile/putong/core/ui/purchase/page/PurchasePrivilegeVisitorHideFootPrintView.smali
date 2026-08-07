.class public final Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000e\u0018\u00002\u00020\u0001B\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\t\u0010\nJ\r\u0010\u000b\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\nJ\u0017\u0010\u000e\u001a\u00020\u00082\u0006\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fR\"\u0010\u0016\u001a\u00020\u00108\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u000e\u0010\u0011\u001a\u0004\u0008\u0012\u0010\u0013\"\u0004\u0008\u0014\u0010\u0015R\"\u0010\u0019\u001a\u00020\u00108\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u000b\u0010\u0011\u001a\u0004\u0008\u0017\u0010\u0013\"\u0004\u0008\u0018\u0010\u0015R\"\u0010\u001d\u001a\u00020\u00108\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u001a\u0010\u0011\u001a\u0004\u0008\u001b\u0010\u0013\"\u0004\u0008\u001c\u0010\u0015\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;",
        "Landroid/widget/FrameLayout;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "onFinishInflate",
        "()V",
        "b",
        "Landroid/view/View;",
        "view",
        "a",
        "(Landroid/view/View;)V",
        "Lv/AutoVDraweeView;",
        "Lv/AutoVDraweeView;",
        "get_left",
        "()Lv/AutoVDraweeView;",
        "set_left",
        "(Lv/AutoVDraweeView;)V",
        "_left",
        "get_right",
        "set_right",
        "_right",
        "c",
        "get_avatar",
        "set_avatar",
        "_avatar",
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


# instance fields
.field public a:Lv/AutoVDraweeView;

.field public b:Lv/AutoVDraweeView;

.field public c:Lv/AutoVDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 3
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lgb0;->a(Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->get_left()Lv/AutoVDraweeView;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    sget v3, Ll/jbc0;->cb:I

    .line 22
    .line 23
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 24
    .line 25
    .line 26
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->get_right()Lv/AutoVDraweeView;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    sget v3, Ll/jbc0;->db:I

    .line 33
    .line 34
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->get_left()Lv/AutoVDraweeView;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    sget v3, Ll/jbc0;->eb:I

    .line 45
    .line 46
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 47
    .line 48
    .line 49
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->get_right()Lv/AutoVDraweeView;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    sget v3, Ll/jbc0;->fb:I

    .line 56
    .line 57
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 58
    .line 59
    .line 60
    :goto_0
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->get_avatar()Lv/AutoVDraweeView;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profile180()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const/4 v2, 0x2

    .line 79
    const/16 v3, 0x8

    .line 80
    .line 81
    invoke-virtual {v1, p0, v0, v2, v3}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final get_avatar()Lv/AutoVDraweeView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->c:Lv/AutoVDraweeView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_avatar"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_left()Lv/AutoVDraweeView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->a:Lv/AutoVDraweeView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_left"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_right()Lv/AutoVDraweeView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->b:Lv/AutoVDraweeView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_right"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final set_avatar(Lv/AutoVDraweeView;)V
    .locals 0
    .param p1    # Lv/AutoVDraweeView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->c:Lv/AutoVDraweeView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_left(Lv/AutoVDraweeView;)V
    .locals 0
    .param p1    # Lv/AutoVDraweeView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->a:Lv/AutoVDraweeView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_right(Lv/AutoVDraweeView;)V
    .locals 0
    .param p1    # Lv/AutoVDraweeView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->b:Lv/AutoVDraweeView;

    .line 5
    .line 6
    return-void
.end method
