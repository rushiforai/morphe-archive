.class public final Lmdo;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lq5g;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lq5g;)V
    .registers 3

    iget-object v0, p1, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lmdo;->b:Lq5g;

    return-void
.end method
