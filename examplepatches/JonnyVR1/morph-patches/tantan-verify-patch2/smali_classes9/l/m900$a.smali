.class public Ll/m900$a;
.super Landroidx/recyclerview/widget/RecyclerView$i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/m900;->W()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/m900;


# direct methods
.method public constructor <init>(Ll/m900;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m900$a;->a:Ll/m900;

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
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView$i;->onChanged()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/m900$a;->a:Ll/m900;

    .line 5
    .line 6
    invoke-static {v0}, Ll/m900;->K(Ll/m900;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/m900$a;->a:Ll/m900;

    .line 10
    .line 11
    iget-object v0, v0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/m900$a$a;

    .line 18
    .line 19
    invoke-direct {v1, p0, v0}, Ll/m900$a$a;-><init>(Ll/m900$a;Landroid/view/ViewTreeObserver;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
