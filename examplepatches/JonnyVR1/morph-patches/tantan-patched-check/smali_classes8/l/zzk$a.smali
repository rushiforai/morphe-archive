.class public Ll/zzk$a;
.super Landroidx/recyclerview/widget/GridLayoutManager$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zzk;->G(Landroidx/recyclerview/widget/RecyclerView$o;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/GridLayoutManager;

.field public final synthetic b:Ll/zzk;


# direct methods
.method public constructor <init>(Ll/zzk;Landroidx/recyclerview/widget/GridLayoutManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zzk$a;->b:Ll/zzk;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zzk$a;->a:Landroidx/recyclerview/widget/GridLayoutManager;

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
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-object v1, p0, Ll/zzk$a;->b:Ll/zzk;

    .line 5
    .line 6
    invoke-virtual {v1}, Ll/zzk;->A()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    move v1, v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v1, 0x0

    .line 15
    :goto_0
    iget-object v2, p0, Ll/zzk$a;->b:Ll/zzk;

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/zzk;->getItemCount()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    sub-int/2addr v2, v0

    .line 22
    if-ne p1, v2, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Ll/zzk$a;->b:Ll/zzk;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/zzk;->z()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    if-eqz v1, :cond_2

    .line 34
    .line 35
    :goto_1
    iget-object p0, p0, Ll/zzk$a;->a:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->m()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_2
    return v0
.end method
