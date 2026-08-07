.class public Lcom/p1/mobile/putong/core/newui/loveletter/a$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/loveletter/a;-><init>(Ll/few;Lv/VRecyclerView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/loveletter/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/loveletter/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$a;->a:Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/loveletter/a$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/loveletter/a$a;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$a;->a:Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->J(Lcom/p1/mobile/putong/core/newui/loveletter/a;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->Q(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$a;->a:Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->J(Lcom/p1/mobile/putong/core/newui/loveletter/a;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$a;->a:Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 5
    .line 6
    if-nez p2, :cond_1

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->K(Lcom/p1/mobile/putong/core/newui/loveletter/a;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$a;->a:Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->J(Lcom/p1/mobile/putong/core/newui/loveletter/a;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/a$a;->a:Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/loveletter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    new-instance p2, Ll/mew;

    .line 29
    .line 30
    invoke-direct {p2, p0}, Ll/mew;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/a$a;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, p2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void

    .line 37
    :cond_1
    const/4 p0, 0x1

    .line 38
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->K(Lcom/p1/mobile/putong/core/newui/loveletter/a;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
