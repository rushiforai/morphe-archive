.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$a;
.super Landroidx/recyclerview/widget/RecyclerView$i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;->setRealAdapter(Ll/vnh0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$i;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView$i;->onChanged()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;->E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;->F(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
