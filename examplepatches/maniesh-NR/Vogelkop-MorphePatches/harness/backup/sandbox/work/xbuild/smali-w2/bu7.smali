.class public final Lbu7;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lov0;


# direct methods
.method public constructor <init>(Lov0;)V
    .registers 3

    iget-object v0, p1, Lov0;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lbu7;->b:Lov0;

    return-void
.end method
