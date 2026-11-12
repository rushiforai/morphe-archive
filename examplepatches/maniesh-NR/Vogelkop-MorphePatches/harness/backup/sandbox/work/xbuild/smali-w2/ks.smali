.class public final Lks;
.super Lqr;
.source "SourceFile"


# instance fields
.field public final c:Lbs;

.field public final d:Z

.field public final e:Lkotlin/jvm/functions/Function0;


# direct methods
.method public constructor <init>(Lbs;ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .registers 5

    invoke-direct {p0, p3}, Lqr;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lks;->c:Lbs;

    iput-boolean p2, p0, Lks;->d:Z

    iput-object p4, p0, Lks;->e:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/d;
    .registers 5

    new-instance v0, Les;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lks;->e:Lkotlin/jvm/functions/Function0;

    invoke-interface {v2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v1, v2}, Lj14;->B(Landroid/content/Context;Z)Ltta;

    move-result-object v1

    iget-boolean v2, p0, Lks;->d:Z

    iget-object p0, p0, Lks;->c:Lbs;

    invoke-direct {v0, v1, v2, p0}, Les;-><init>(Ltta;ZLbs;)V

    invoke-virtual {v0, p1}, Les;->I(Landroidx/recyclerview/widget/RecyclerView;)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-object v0
.end method
