.class public final Li4l;
.super Ly1c;
.source "SourceFile"


# instance fields
.field public final g:Ltx7;

.field public final h:B


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/tabui2/TabGridLayoutManager;Lqsh;Ltx7;I)V
    .registers 6

    invoke-direct {p0, p1, p2, p3}, Ly1c;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/LinearLayoutManager;Lqsh;)V

    iput-object p4, p0, Li4l;->g:Ltx7;

    iput-byte p5, p0, Li4l;->h:B

    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 3

    iget-object v0, p0, Li4l;->g:Ltx7;

    iget-byte p0, p0, Li4l;->h:B

    invoke-virtual {v0, p1, p0}, Ltx7;->e(II)I

    move-result p0

    if-nez p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method
