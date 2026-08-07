.class public Ll/ywu$b;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ywu;->k()Ll/r0u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ll/ywu;


# direct methods
.method public constructor <init>(Ll/ywu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ywu$b;->this$0:Ll/ywu;

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
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object p1, p0, Ll/ywu$b;->this$0:Ll/ywu;

    .line 8
    .line 9
    invoke-static {p1}, Ll/ywu;->f(Ll/ywu;)Ll/rwu;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Ll/ywu$b;->this$0:Ll/ywu;

    .line 16
    .line 17
    invoke-static {p0}, Ll/ywu;->f(Ll/ywu;)Ll/rwu;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/rwu;->H2()V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method
