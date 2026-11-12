.class public final Lr6n;
.super Lz6n;
.source "SourceFile"


# instance fields
.field public final b:Lvs;

.field public final c:Ltjn;


# direct methods
.method public constructor <init>(Lvs;Ltjn;)V
    .registers 4

    iget-object v0, p1, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lr6n;->b:Lvs;

    iput-object p2, p0, Lr6n;->c:Ltjn;

    return-void
.end method
