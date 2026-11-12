.class public abstract Lvf5;
.super Landroidx/fragment/app/i;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\'\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lvf5;",
        "Landroidx/fragment/app/i;",
        "<init>",
        "()V",
        "catalog"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroidx/fragment/app/i;-><init>()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/fragment/app/i;->setShowsDialog(Z)V

    return-void
.end method


# virtual methods
.method public abstract g0(Lkotlin/jvm/functions/Function0;Lih5;I)V
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 5

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    new-instance p2, Lch5;

    new-instance p3, Ltpj;

    invoke-direct {p3, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    invoke-direct {p2, p3}, Lch5;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2}, Ld4;->m()V

    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    const/4 p3, -0x1

    invoke-direct {p1, p3, p3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Luf5;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p3}, Luf5;-><init>(Lvf5;B)V

    new-instance p0, Lue5;

    const p3, -0x6b3c402e

    const/4 v0, 0x1

    invoke-direct {p0, p3, p1, v0}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-virtual {p2, p0}, Lch5;->o(Lkotlin/jvm/functions/Function2;)V

    return-object p2
.end method
