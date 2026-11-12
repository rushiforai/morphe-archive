.class public final Lq6n;
.super Lz6n;
.source "SourceFile"


# instance fields
.field public final b:Lq5g;


# direct methods
.method public constructor <init>(Lq5g;)V
    .registers 3

    iget-object v0, p1, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lq6n;->b:Lq5g;

    return-void
.end method
