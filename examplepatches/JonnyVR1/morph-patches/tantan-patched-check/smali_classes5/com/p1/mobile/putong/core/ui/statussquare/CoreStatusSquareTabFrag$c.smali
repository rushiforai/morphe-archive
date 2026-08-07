.class public Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$c;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->g4(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$c;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

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
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$c;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->j5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$c;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->d5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Ljava/lang/Runnable;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
