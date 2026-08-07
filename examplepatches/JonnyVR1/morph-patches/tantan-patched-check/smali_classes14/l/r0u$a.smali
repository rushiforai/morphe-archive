.class public Ll/r0u$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r0u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/r0u;


# direct methods
.method public constructor <init>(Ll/r0u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r0u$a;->a:Ll/r0u;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    invoke-static {p1}, Ll/xrc0;->d(Landroidx/recyclerview/widget/RecyclerView;)Ll/yem0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ll/yem0;->a()Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/r0u$a;->a:Ll/r0u;

    .line 17
    .line 18
    invoke-static {p0}, Ll/r0u;->z0(Ll/r0u;)Lrx/subjects/b;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget p2, p1, Ll/yem0;->c:I

    .line 23
    .line 24
    iget p1, p1, Ll/yem0;->d:I

    .line 25
    .line 26
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/live/base/util/IntSet;->interval(II)Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method
