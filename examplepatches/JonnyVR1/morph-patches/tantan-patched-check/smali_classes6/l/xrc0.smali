.class public Ll/xrc0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xrc0$b;,
        Ll/xrc0$a;,
        Ll/xrc0$c;,
        Ll/xrc0$d;
    }
.end annotation


# static fields
.field public static final a:Ll/xrc0$b;

.field public static final b:Ll/xrc0$b;

.field public static final c:Ll/xrc0$b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/xrc0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/xrc0$a;-><init>(Ll/yrc0;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/xrc0;->a:Ll/xrc0$b;

    .line 8
    .line 9
    new-instance v0, Ll/xrc0$c;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/xrc0$c;-><init>(Ll/yrc0;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/xrc0;->b:Ll/xrc0$b;

    .line 15
    .line 16
    new-instance v0, Ll/xrc0$d;

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ll/xrc0$d;-><init>(Ll/yrc0;)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Ll/xrc0;->c:Ll/xrc0$b;

    .line 22
    .line 23
    return-void
.end method

.method public static bridge synthetic a(Landroid/view/View;ZF)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xrc0;->b(Landroid/view/View;ZF)Z

    move-result p0

    return p0
.end method

.method public static b(Landroid/view/View;ZF)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ynp0;->u(Landroid/view/View;Z)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    cmpl-float p0, p0, p2

    .line 6
    .line 7
    if-ltz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static c(Landroidx/recyclerview/widget/RecyclerView;)Ll/xrc0$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    instance-of p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ll/xrc0;->a:Ll/xrc0$b;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    if-eqz v0, :cond_1

    .line 17
    .line 18
    sget-object p0, Ll/xrc0;->b:Ll/xrc0$b;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    sget-object p0, Ll/xrc0;->c:Ll/xrc0$b;

    .line 22
    .line 23
    return-object p0
.end method

.method public static d(Landroidx/recyclerview/widget/RecyclerView;)Ll/yem0;
    .locals 1
    .param p0    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/yem0;->b()Ll/yem0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-static {p0}, Ll/xrc0;->c(Landroidx/recyclerview/widget/RecyclerView;)Ll/xrc0$b;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0, p0}, Ll/xrc0$b;->a(Landroidx/recyclerview/widget/RecyclerView;)Ll/yem0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static e(Landroidx/recyclerview/widget/RecyclerView;ZF)Lcom/p1/mobile/putong/live/base/util/IntSet;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/NullPointerException;

    .line 4
    .line 5
    const-string p1, "try to getMVIndexSet on a null RecyclerView"

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/util/IntSet;->emptySet()Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-static {p0}, Ll/xrc0;->c(Landroidx/recyclerview/widget/RecyclerView;)Ll/xrc0$b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0, p0, p1, p2}, Ll/xrc0$b;->b(Landroidx/recyclerview/widget/RecyclerView;ZF)Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method
