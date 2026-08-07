.class public abstract Ll/emg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e5h;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/e5h<",
        "Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;

.field public b:Ll/vbh;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/dsl;)Landroidx/fragment/app/Fragment;
    .locals 0
    .param p1    # Ll/dsl;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Ll/emg;->e(Ll/dsl;)Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()Landroid/os/Bundle;
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "TAB_VALUE"

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/emg;->d()Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public abstract d()Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;
.end method

.method public e(Ll/dsl;)Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;
    .locals 1
    .param p1    # Ll/dsl;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/emg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;

    .line 6
    .line 7
    invoke-direct {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/emg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/emg;->f()Ll/zxh;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->m5(Ll/zxh;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/emg;->d()Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;->Like:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/FeedInteractionTab;

    .line 24
    .line 25
    if-ne p1, v0, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/emg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->l5(Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Ll/emg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;

    .line 34
    .line 35
    return-object p0
.end method

.method public f()Ll/zxh;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/emg;->b:Ll/vbh;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/emg$a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/emg$a;-><init>(Ll/emg;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/emg;->b:Ll/vbh;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/emg;->b:Ll/vbh;

    .line 13
    .line 14
    return-object p0
.end method

.method public abstract g()I
.end method

.method public h(Ljava/util/ArrayList;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/emg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->h5(Ljava/util/List;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/emg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->e5()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/emg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->f5()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public k(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/emg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/module/fragment/FeedInteractionTabFrag;->i5(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
