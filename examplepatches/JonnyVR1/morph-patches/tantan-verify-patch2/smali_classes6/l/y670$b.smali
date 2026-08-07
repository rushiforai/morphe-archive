.class public Ll/y670$b;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/y670;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:Ll/y670;


# direct methods
.method public constructor <init>(Ll/y670;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y670$b;->b:Ll/y670;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Ll/y670$b;->a:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/y670$b;->b:Ll/y670;

    .line 5
    .line 6
    iget-object p1, p1, Ll/y670;->d:Ll/v670;

    .line 7
    .line 8
    iget p0, p0, Ll/y670$b;->a:I

    .line 9
    .line 10
    invoke-virtual {p1, p2, p0}, Ll/v670;->H1(II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    return-void
.end method
