.class public Ll/hf70$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hf70;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/hf70;


# direct methods
.method public constructor <init>(Ll/hf70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hf70$a;->a:Ll/hf70;

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
    iget-object p1, p0, Ll/hf70$a;->a:Ll/hf70;

    .line 5
    .line 6
    iget-object p1, p1, Ll/hf70;->m:Ll/je70;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ll/je70;->Q0(I)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/cmg;->l0()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/hf70$a;->a:Ll/hf70;

    .line 18
    .line 19
    iget-object p1, p1, Ll/hf70;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->P4()V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Ll/hf70$a;->a:Ll/hf70;

    .line 25
    .line 26
    if-nez p2, :cond_2

    .line 27
    .line 28
    invoke-static {p1}, Ll/hf70;->H(Ll/hf70;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/hf70$a;->a:Ll/hf70;

    .line 32
    .line 33
    invoke-static {p1}, Ll/hf70;->F(Ll/hf70;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/cmg;->I()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Ll/hf70$a;->a:Ll/hf70;

    .line 43
    .line 44
    iget-object p1, p0, Ll/hf70;->m:Ll/je70;

    .line 45
    .line 46
    iget p1, p1, Ll/je70;->g:I

    .line 47
    .line 48
    const/16 p2, 0xc

    .line 49
    .line 50
    if-ne p1, p2, :cond_1

    .line 51
    .line 52
    invoke-static {p0}, Ll/hf70;->E(Ll/hf70;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void

    .line 56
    :cond_2
    const/4 p0, 0x0

    .line 57
    iput-boolean p0, p1, Ll/hf70;->D:Z

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/hf70;->H0()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hf70$a;->a:Ll/hf70;

    .line 2
    .line 3
    invoke-static {p0}, Ll/hf70;->G(Ll/hf70;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
