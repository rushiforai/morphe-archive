.class public Ll/etj0$a;
.super Landroidx/recyclerview/widget/GridLayoutManager$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/etj0;->e(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/etj0;


# direct methods
.method public constructor <init>(Ll/etj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/etj0$a;->a:Ll/etj0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/etj0$a;->a:Ll/etj0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/etj0;->h:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->O4()Ll/lsj0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Ll/lsj0;->getItemViewType(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/etj0$a;->a:Ll/etj0;

    .line 16
    .line 17
    iget-object p0, p0, Ll/etj0;->j:Landroidx/recyclerview/widget/GridLayoutManager;

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
