.class public Ll/snf$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/atl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/snf;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/snf;


# direct methods
.method public constructor <init>(Ll/snf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/snf$a;->a:Ll/snf;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public B(IIILjava/lang/String;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/snf$a;->a:Ll/snf;

    .line 2
    .line 3
    iget-object p3, p2, Ll/snf;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Ll/snf;->f(Ll/snf;)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    sub-int/2addr p2, p1

    .line 12
    const/4 p4, 0x0

    .line 13
    const/4 p5, 0x0

    .line 14
    invoke-virtual {p3, p4, p5, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/snf$a;->a:Ll/snf;

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/snf;->g(Ll/snf;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public s0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/snf$a;->a:Ll/snf;

    .line 2
    .line 3
    iget-object p0, p0, Ll/snf;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 4
    .line 5
    if-eqz p0, :cond_3

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->DRAGGING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->SCROLL_ANIM:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 20
    .line 21
    if-ne p1, v0, :cond_2

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    :cond_2
    :goto_0
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1, v1}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 26
    .line 27
    .line 28
    :cond_3
    return-void
.end method
