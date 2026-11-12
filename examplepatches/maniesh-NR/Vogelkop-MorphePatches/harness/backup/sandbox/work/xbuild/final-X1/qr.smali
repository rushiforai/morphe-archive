.class public abstract Lqr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Lkotlin/jvm/functions/Function0;

.field public b:Landroidx/recyclerview/widget/d;


# direct methods
.method public constructor <init>(Lkotlin/jvm/functions/Function0;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqr;->a:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public abstract a(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/d;
.end method

.method public final b(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Landroidx/fragment/app/Fragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p1

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    iget-object v0, p0, Lqr;->b:Landroidx/recyclerview/widget/d;

    if-nez v0, :cond_20

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    iget-object p1, p0, Lqr;->a:Lkotlin/jvm/functions/Function0;

    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Lqr;->a(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/d;

    move-result-object p1

    iput-object p1, p0, Lqr;->b:Landroidx/recyclerview/widget/d;

    return-object p1

    :cond_20
    return-object v0
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lqr;->b:Landroidx/recyclerview/widget/d;

    return-void
.end method
