.class public Ll/mk30$d;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mk30;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/mk30;


# direct methods
.method public constructor <init>(Ll/mk30;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mk30$d;->a:Ll/mk30;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/mk30$d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mk30$d;->b()V

    return-void
.end method

.method private synthetic b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mk30$d;->a:Ll/mk30;

    .line 2
    .line 3
    invoke-static {v0}, Ll/mk30;->l(Ll/mk30;)Ll/mk30$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/mk30$d;->a:Ll/mk30;

    .line 8
    .line 9
    invoke-static {v1}, Ll/mk30;->s(Ll/mk30;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/mk30$e;->N(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/mk30$d;->a:Ll/mk30;

    .line 17
    .line 18
    invoke-static {p0}, Ll/mk30;->s(Ll/mk30;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_1

    .line 5
    .line 6
    iget-object p1, p0, Ll/mk30$d;->a:Ll/mk30;

    .line 7
    .line 8
    iget p2, p1, Ll/mk30;->p:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Ll/mk30;->B(I)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Ll/mk30$d;->a:Ll/mk30;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/mk30;->K()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Ll/mk30$d;->a:Ll/mk30;

    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-static {p1, p2}, Ll/mk30;->u(Ll/mk30;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/mk30$d;->a:Ll/mk30;

    .line 28
    .line 29
    invoke-static {p1}, Ll/mk30;->s(Ll/mk30;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Ll/mk30$d;->a:Ll/mk30;

    .line 40
    .line 41
    invoke-static {p1}, Ll/mk30;->k(Ll/mk30;)Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance p2, Ll/nk30;

    .line 46
    .line 47
    invoke-direct {p2, p0}, Ll/nk30;-><init>(Ll/mk30$d;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, p2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_1

    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    return-void

    .line 10
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/mk30$d;->a:Ll/mk30;

    .line 11
    .line 12
    invoke-static {p1}, Ll/mk30;->m(Ll/mk30;)Landroid/os/CountDownTimer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/os/CountDownTimer;->cancel()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/mk30$d;->a:Ll/mk30;

    .line 20
    .line 21
    invoke-static {p1}, Ll/mk30;->v(Ll/mk30;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/mk30$d;->a:Ll/mk30;

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    invoke-static {p0, p1}, Ll/mk30;->u(Ll/mk30;Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
