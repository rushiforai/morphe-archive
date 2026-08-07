.class public Ll/pio$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bio$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pio;->T()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/pio;


# direct methods
.method public constructor <init>(Ll/pio;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pio$b;->a:Ll/pio;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lcom/p1/mobile/putong/data/User;ZZZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pio$b;->a:Ll/pio;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3, p5}, Ll/pio;->y(Ll/pio;Landroid/view/View;Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->i4()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public o(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/pio$b;->a:Ll/pio;

    .line 2
    .line 3
    iget-object p1, p1, Ll/pio;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/pio$b;->a:Ll/pio;

    .line 12
    .line 13
    iget-object p0, p0, Ll/pio;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
