.class public Ll/bf60;
.super Ll/lb2;
.source "SourceFile"


# static fields
.field public static final h:[Ljava/lang/String;


# instance fields
.field public final e:Lv/VRecyclerView;

.field public final f:Lv/VRecyclerView;

.field public final g:Lv/VRecyclerView;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->C0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 10
    .line 11
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->k7:I

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 18
    .line 19
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->x4:I

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/bf60;->h:[Ljava/lang/String;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lv/VRecyclerView;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bf60;->e:Lv/VRecyclerView;

    .line 10
    .line 11
    new-instance v0, Lv/VRecyclerView;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/bf60;->f:Lv/VRecyclerView;

    .line 17
    .line 18
    new-instance v0, Lv/VRecyclerView;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/bf60;->g:Lv/VRecyclerView;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    sget-object p0, Ll/bf60;->h:[Ljava/lang/String;

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object p0, Ll/bf60;->h:[Ljava/lang/String;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p2, v0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p2, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/bf60;->e:Lv/VRecyclerView;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/bf60;->g:Lv/VRecyclerView;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    iget-object p0, p0, Ll/bf60;->f:Lv/VRecyclerView;

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public q()Lv/VRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bf60;->e:Lv/VRecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Lv/VRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bf60;->g:Lv/VRecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Lv/VRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bf60;->f:Lv/VRecyclerView;

    .line 2
    .line 3
    return-object p0
.end method
