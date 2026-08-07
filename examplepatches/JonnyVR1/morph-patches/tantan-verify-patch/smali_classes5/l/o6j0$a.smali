.class public final Ll/o6j0$a;
.super Landroidx/recyclerview/widget/GridLayoutManager$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/o6j0;->y()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0004\u001a\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0004\u0010\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "l/o6j0$a",
        "Landroidx/recyclerview/widget/GridLayoutManager$c;",
        "",
        "position",
        "f",
        "(I)I",
        "b_core_intlGmsRelease"
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
.field public final synthetic a:Ll/o6j0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;


# direct methods
.method public constructor <init>(Ll/o6j0;Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o6j0$a;->a:Ll/o6j0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/o6j0$a;->b:Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$c;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o6j0$a;->a:Ll/o6j0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/o6j0;->k()Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksTabFrag;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksTabFrag;->X4()Ll/v6j0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/v6j0;->getItemViewType(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/o6j0$a;->b:Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->m()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method
