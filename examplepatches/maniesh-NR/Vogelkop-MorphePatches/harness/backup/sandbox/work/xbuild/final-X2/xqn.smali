.class public final Lxqn;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lb7k;


# direct methods
.method public constructor <init>(Lb7k;)V
    .registers 3

    iget-object v0, p1, Lb7k;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lxqn;->b:Lb7k;

    return-void
.end method
