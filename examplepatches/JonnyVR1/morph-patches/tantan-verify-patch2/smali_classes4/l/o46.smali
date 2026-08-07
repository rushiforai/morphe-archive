.class public abstract Ll/o46;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$s;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/o46$a;
    }
.end annotation


# instance fields
.field public a:Ll/lmj;

.field public b:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o46;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    new-instance v0, Ll/lmj;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v1, Ll/o46$a;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-direct {v1, p0, v2}, Ll/o46$a;-><init>(Ll/o46;Ll/p46;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, p1, v1}, Ll/lmj;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/o46;->a:Ll/lmj;

    .line 22
    .line 23
    return-void
.end method

.method public static bridge synthetic b(Ll/o46;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o46;->b:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method


# virtual methods
.method public a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o46;->a:Ll/lmj;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/lmj;->a(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o46;->a:Ll/lmj;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/lmj;->a(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public abstract d(Landroidx/recyclerview/widget/RecyclerView$e0;)V
.end method

.method public e(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract f(Landroidx/recyclerview/widget/RecyclerView$e0;)V
.end method
