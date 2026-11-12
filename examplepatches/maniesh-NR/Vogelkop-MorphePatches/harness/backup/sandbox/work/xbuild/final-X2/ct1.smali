.class public final Lct1;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lbt1;

.field public final synthetic c:Ldt1;


# direct methods
.method public constructor <init>(Ldt1;Lbt1;)V
    .registers 3

    iput-object p1, p0, Lct1;->c:Ldt1;

    iget-object p1, p2, Lbt1;->b:Landroid/widget/LinearLayout;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lct1;->b:Lbt1;

    return-void
.end method
