.class public Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;
.super Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;
.source "SourceFile"


# static fields
.field public static h:I

.field public static i:Ll/byd0;


# instance fields
.field public f:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "last_timestamp_show_state_guide_remaining_state_square_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->i:Ll/byd0;

    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->f:Ll/h80;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->f:Ll/h80;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/SquareRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->f:Ll/h80;

    return-void
.end method

.method public static bridge synthetic Y(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->g:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public T(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->f:Ll/h80;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p4}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public W(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->f:Ll/h80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->f:Ll/h80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Z(I)Z
    .locals 2

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->h:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    add-int/2addr p0, v0

    .line 5
    sput p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->h:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-gt p0, p1, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->i:Ll/byd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Long;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 20
    .line 21
    .line 22
    move-result-wide p0

    .line 23
    invoke-static {p0, p1}, Ll/pzi0;->D(J)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    return v1

    .line 30
    :cond_1
    return v0
.end method

.method public final a0(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Landroid/view/View;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p2

    .line 8
    :cond_0
    instance-of v0, p2, Landroid/view/ViewGroup;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    check-cast p2, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    if-ge v2, v0, :cond_4

    .line 21
    .line 22
    invoke-virtual {p2, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {p1, v3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-eqz v4, :cond_1

    .line 31
    .line 32
    move-object v1, v3

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    instance-of v4, v3, Landroid/view/ViewGroup;

    .line 35
    .line 36
    if-eqz v4, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->a0(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    .line 43
    .line 44
    return-object v1

    .line 45
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_4
    return-object v1
.end method

.method public getData()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->getAdapter()Ll/tr2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/f0g0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tr2;->F()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->getAdapter()Ll/tr2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/f0g0;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/f0g0;->K(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setReferSource(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
