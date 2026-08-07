.class public final Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation build Landroidx/media3/common/util/UnstableApi;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0007\u0018\u00002\u00020\u0001B\u0011\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B\u0019\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0004\u0010\u0008B!\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0004\u0010\u000bJ\u0011\u0010\r\u001a\u0004\u0018\u00010\u000cH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0011J\u000f\u0010\u0015\u001a\u00020\u0014H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0011J\u000f\u0010\u0018\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0011J\r\u0010\u0019\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u0019\u0010\u0011J\r\u0010\u001a\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u001a\u0010\u0011J\r\u0010\u001b\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u001b\u0010\u0011J\r\u0010\u001c\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u001c\u0010\u0011R\u0014\u0010 \u001a\u00020\u001d8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u001fR\u0014\u0010$\u001a\u00020!8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\"\u0010#R\u0014\u0010(\u001a\u00020%8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008&\u0010\'R\u0014\u0010,\u001a\u00020)8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008*\u0010+R\u0018\u0010/\u001a\u0004\u0018\u00010\u000c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008-\u0010.\u00a8\u00060"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Landroid/content/Context;)V",
        "Landroid/util/AttributeSet;",
        "attrs",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "defStyleAttr",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "Lcom/clevertap/android/sdk/inbox/d;",
        "M",
        "()Lcom/clevertap/android/sdk/inbox/d;",
        "",
        "N",
        "()V",
        "L",
        "R",
        "Landroid/graphics/drawable/Drawable;",
        "K",
        "()Landroid/graphics/drawable/Drawable;",
        "S",
        "T",
        "O",
        "P",
        "Q",
        "U",
        "Ll/gtm;",
        "a",
        "Ll/gtm;",
        "handle",
        "Landroid/graphics/Rect;",
        "b",
        "Landroid/graphics/Rect;",
        "rect",
        "Landroidx/recyclerview/widget/RecyclerView$t;",
        "c",
        "Landroidx/recyclerview/widget/RecyclerView$t;",
        "onScrollListener",
        "Landroidx/recyclerview/widget/RecyclerView$q;",
        "d",
        "Landroidx/recyclerview/widget/RecyclerView$q;",
        "onChildAttachStateChangeListener",
        "e",
        "Lcom/clevertap/android/sdk/inbox/d;",
        "playingHolder",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final a:Ll/gtm;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Landroid/graphics/Rect;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final c:Landroidx/recyclerview/widget/RecyclerView$t;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final d:Landroidx/recyclerview/widget/RecyclerView$q;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private e:Lcom/clevertap/android/sdk/inbox/d;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 62
    sget-object p1, Ll/xel0;->d:Lcom/clevertap/android/sdk/video/VideoLibraryIntegrated;

    sget-object v0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 63
    new-instance p1, Ll/qpx;

    invoke-direct {p1}, Ll/qpx;-><init>()V

    goto :goto_0

    .line 64
    :cond_0
    new-instance p1, Ll/z9f;

    invoke-direct {p1}, Ll/z9f;-><init>()V

    .line 65
    :goto_0
    iput-object p1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 66
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->b:Landroid/graphics/Rect;

    .line 67
    new-instance p1, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$c;

    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$c;-><init>(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)V

    iput-object p1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->c:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 68
    new-instance p1, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$b;

    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$b;-><init>(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)V

    iput-object p1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->d:Landroidx/recyclerview/widget/RecyclerView$q;

    .line 69
    invoke-direct {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->N()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    sget-object p1, Ll/xel0;->d:Lcom/clevertap/android/sdk/video/VideoLibraryIntegrated;

    .line 11
    .line 12
    sget-object p2, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$a;->a:[I

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    aget p1, p2, p1

    .line 19
    .line 20
    const/4 p2, 0x1

    .line 21
    if-ne p1, p2, :cond_0

    .line 22
    .line 23
    new-instance p1, Ll/qpx;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/qpx;-><init>()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    new-instance p1, Ll/z9f;

    .line 30
    .line 31
    invoke-direct {p1}, Ll/z9f;-><init>()V

    .line 32
    .line 33
    .line 34
    :goto_0
    iput-object p1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 35
    .line 36
    new-instance p1, Landroid/graphics/Rect;

    .line 37
    .line 38
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->b:Landroid/graphics/Rect;

    .line 42
    .line 43
    new-instance p1, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$c;

    .line 44
    .line 45
    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$c;-><init>(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->c:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 49
    .line 50
    new-instance p1, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$b;

    .line 51
    .line 52
    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$b;-><init>(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->d:Landroidx/recyclerview/widget/RecyclerView$q;

    .line 56
    .line 57
    invoke-direct {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->N()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 71
    sget-object p1, Ll/xel0;->d:Lcom/clevertap/android/sdk/video/VideoLibraryIntegrated;

    sget-object p2, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    .line 72
    new-instance p1, Ll/qpx;

    invoke-direct {p1}, Ll/qpx;-><init>()V

    goto :goto_0

    .line 73
    :cond_0
    new-instance p1, Ll/z9f;

    invoke-direct {p1}, Ll/z9f;-><init>()V

    .line 74
    :goto_0
    iput-object p1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 75
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->b:Landroid/graphics/Rect;

    .line 76
    new-instance p1, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$c;

    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$c;-><init>(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)V

    iput-object p1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->c:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 77
    new-instance p1, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$b;

    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$b;-><init>(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)V

    iput-object p1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->d:Landroidx/recyclerview/widget/RecyclerView$q;

    .line 78
    invoke-direct {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->N()V

    return-void
.end method

.method public static E(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)Ljava/lang/Float;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/gtm;->c()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/gtm;->b()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static F(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;Ljava/lang/String;ZZ)Ljava/lang/Void;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, p0, p1, p2, p3}, Ll/gtm;->f(Landroid/content/Context;Ljava/lang/String;ZZ)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public static final synthetic G(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->K()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic H(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic I(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)Lcom/clevertap/android/sdk/inbox/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->e:Lcom/clevertap/android/sdk/inbox/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic J(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->R()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final K()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/wbc0;->a:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Ll/c5d0;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method private final L()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->e:Lcom/clevertap/android/sdk/inbox/d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inbox/d;->n()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private final M()Lcom/clevertap/android/sdk/inbox/d;
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v1

    .line 16
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-virtual {v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move v2, v1

    .line 30
    :goto_1
    const/4 v3, 0x0

    .line 31
    if-gt v0, v2, :cond_8

    .line 32
    .line 33
    move v4, v0

    .line 34
    move v5, v1

    .line 35
    move-object v6, v3

    .line 36
    :goto_2
    sub-int v7, v4, v0

    .line 37
    .line 38
    invoke-virtual {p0, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    if-nez v7, :cond_2

    .line 43
    .line 44
    goto :goto_5

    .line 45
    :cond_2
    invoke-virtual {v7}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    instance-of v8, v7, Lcom/clevertap/android/sdk/inbox/d;

    .line 50
    .line 51
    if-eqz v8, :cond_3

    .line 52
    .line 53
    check-cast v7, Lcom/clevertap/android/sdk/inbox/d;

    .line 54
    .line 55
    goto :goto_3

    .line 56
    :cond_3
    move-object v7, v3

    .line 57
    :goto_3
    if-eqz v7, :cond_6

    .line 58
    .line 59
    invoke-virtual {v7}, Lcom/clevertap/android/sdk/inbox/d;->m()Z

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    if-nez v8, :cond_4

    .line 64
    .line 65
    goto :goto_5

    .line 66
    :cond_4
    iget-object v8, v7, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 67
    .line 68
    iget-object v9, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->b:Landroid/graphics/Rect;

    .line 69
    .line 70
    invoke-virtual {v8, v9}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 71
    .line 72
    .line 73
    move-result v8

    .line 74
    if-eqz v8, :cond_5

    .line 75
    .line 76
    iget-object v8, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->b:Landroid/graphics/Rect;

    .line 77
    .line 78
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    goto :goto_4

    .line 83
    :cond_5
    move v8, v1

    .line 84
    :goto_4
    if-le v8, v5, :cond_6

    .line 85
    .line 86
    move-object v6, v7

    .line 87
    move v5, v8

    .line 88
    :cond_6
    :goto_5
    if-eq v4, v2, :cond_7

    .line 89
    .line 90
    add-int/lit8 v4, v4, 0x1

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_7
    return-object v6

    .line 94
    :cond_8
    return-object v3
.end method

.method private final N()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    new-instance v2, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$initialize$1;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$initialize$1;-><init>(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    new-instance v3, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$initialize$2;

    .line 16
    .line 17
    invoke-direct {v3, p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$initialize$2;-><init>(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0, v1, v2, v3}, Ll/gtm;->d(Landroid/content/Context;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    new-instance v2, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$initialize$3;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView$initialize$3;-><init>(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v0, v1, v2}, Ll/gtm;->e(Landroid/content/Context;Lkotlin/jvm/functions/Function0;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->S()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private final R()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->e:Lcom/clevertap/android/sdk/inbox/d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inbox/d;->o()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private final S()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->c:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->d:Landroidx/recyclerview/widget/RecyclerView$q;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$q;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->c:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->d:Landroidx/recyclerview/widget/RecyclerView$q;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$q;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private final T()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/gtm;->pause()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->e:Lcom/clevertap/android/sdk/inbox/d;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inbox/d;->p()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public final O()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ll/gtm;->setPlayWhenReady(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final P()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->N()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->Q()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final Q()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->M()Lcom/clevertap/android/sdk/inbox/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->T()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->e:Lcom/clevertap/android/sdk/inbox/d;

    .line 12
    .line 13
    if-eqz v1, :cond_4

    .line 14
    .line 15
    iget-object v2, v1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 16
    .line 17
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 18
    .line 19
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_4

    .line 24
    .line 25
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->b:Landroid/graphics/Rect;

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v2, 0x0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->b:Landroid/graphics/Rect;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    move v0, v2

    .line 44
    :goto_0
    const/16 v3, 0x190

    .line 45
    .line 46
    const/4 v4, 0x1

    .line 47
    if-lt v0, v3, :cond_2

    .line 48
    .line 49
    move v0, v4

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    move v0, v2

    .line 52
    :goto_1
    if-eqz v0, :cond_3

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inbox/d;->s()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    iget-object p0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 61
    .line 62
    invoke-interface {p0, v4}, Ll/gtm;->setPlayWhenReady(Z)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    iget-object p0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 67
    .line 68
    invoke-interface {p0, v2}, Ll/gtm;->setPlayWhenReady(Z)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_4
    invoke-direct {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->T()V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->N()V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 79
    .line 80
    invoke-interface {v1}, Ll/gtm;->b()F

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    new-instance v2, Ll/b1y;

    .line 85
    .line 86
    invoke-direct {v2, p0}, Ll/b1y;-><init>(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)V

    .line 87
    .line 88
    .line 89
    new-instance v3, Ll/c1y;

    .line 90
    .line 91
    invoke-direct {v3, p0}, Ll/c1y;-><init>(Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;)V

    .line 92
    .line 93
    .line 94
    iget-object v4, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 95
    .line 96
    invoke-interface {v4}, Ll/gtm;->a()Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/clevertap/android/sdk/inbox/d;->d(FLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function3;Landroid/view/View;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-eqz v1, :cond_5

    .line 105
    .line 106
    iput-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->e:Lcom/clevertap/android/sdk/inbox/d;

    .line 107
    .line 108
    :cond_5
    return-void
.end method

.method public final U()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->a:Ll/gtm;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/gtm;->pause()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->e:Lcom/clevertap/android/sdk/inbox/d;

    .line 8
    .line 9
    return-void
.end method
