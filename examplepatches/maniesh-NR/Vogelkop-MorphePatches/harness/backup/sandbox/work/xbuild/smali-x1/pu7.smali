.class public final Lpu7;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lkf;


# direct methods
.method public constructor <init>(Lkf;)V
    .registers 3

    iget-object v0, p1, Lkf;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lpu7;->b:Lkf;

    return-void
.end method
