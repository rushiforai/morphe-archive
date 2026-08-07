.class public final Ll/wdy$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ldy$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wdy;->p(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0007*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J/\u0010\t\u001a\u00020\u00082\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\u000b\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "l/wdy$d",
        "Ll/ldy$a;",
        "Lcom/p1/mobile/putong/data/User;",
        "clickedUser",
        "",
        "liked",
        "superLike",
        "fromButton",
        "",
        "p",
        "(Lcom/p1/mobile/putong/data/User;ZZZ)V",
        "o",
        "(Z)V",
        "n",
        "()Z",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/wdy;

.field public final synthetic b:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Ll/wdy;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wdy$d;->a:Ll/wdy;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wdy$d;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public n()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdy$d;->a:Ll/wdy;

    .line 2
    .line 3
    invoke-static {p0}, Ll/wdy;->c(Ll/wdy;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public o(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdy$d;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/data/User;ZZZ)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/wdy$d;->a:Ll/wdy;

    .line 5
    .line 6
    invoke-static {p0}, Ll/wdy;->e(Ll/wdy;)Ll/idy;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p4}, Ll/idy;->E(Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
