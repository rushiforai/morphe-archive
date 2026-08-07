.class public Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout$a;
.super Ll/cf60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cf60;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;Ll/l0r;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;)V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

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

.method public getCount()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;->b(Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;->a(Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;)Ll/g0r;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/g0r;->b()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    div-int v1, v0, v1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;->a(Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;)Ll/g0r;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/g0r;->b()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    rem-int/2addr v0, p0

    .line 34
    if-lez v0, :cond_0

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    :goto_0
    add-int/2addr v1, p0

    .line 40
    return v1
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;->a(Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;)Ll/g0r;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ll/g0r;->c()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->setRowSize(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;->b(Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->e(Ljava/util/List;I)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    if-ne p1, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
