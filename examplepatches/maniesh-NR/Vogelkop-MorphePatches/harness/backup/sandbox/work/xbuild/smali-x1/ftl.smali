.class public final synthetic Lftl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lltl;

.field public final synthetic b:Landroid/view/LayoutInflater;

.field public final synthetic c:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Lltl;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lftl;->a:Lltl;

    iput-object p2, p0, Lftl;->b:Landroid/view/LayoutInflater;

    iput-object p3, p0, Lftl;->c:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Lktl;

    iget-object v0, p0, Lftl;->a:Lltl;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, p1}, Ltcc;->a(Lmdc;)V

    iget-object v0, p1, Lktl;->a:Ljtl;

    iget-object v1, p0, Lftl;->b:Landroid/view/LayoutInflater;

    iget-object p0, p0, Lftl;->c:Landroid/view/ViewGroup;

    invoke-interface {v0, v1, p0}, Ljtl;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La5n;

    iput-object p0, p1, Lktl;->b:La5n;

    return-void
.end method
