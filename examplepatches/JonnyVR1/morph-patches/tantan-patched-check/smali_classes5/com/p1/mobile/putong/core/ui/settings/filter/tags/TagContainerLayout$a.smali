.class public Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;
.super Landroid/database/DataSetObserver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;Ll/k1i0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 3
    .line 4
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->a(Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;)Ll/j1i0;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Ll/j1i0;->a()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->a(Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;)Ll/j1i0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 21
    .line 22
    invoke-virtual {v1, v2, v0}, Ll/j1i0;->c(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 27
    .line 28
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void
.end method

.method public onChanged()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/database/DataSetObserver;->onChanged()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;->a()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInvalidated()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/database/DataSetObserver;->onInvalidated()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;->a()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
