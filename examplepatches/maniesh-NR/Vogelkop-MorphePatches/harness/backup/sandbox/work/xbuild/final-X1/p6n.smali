.class public final Lp6n;
.super Lz6n;
.source "SourceFile"


# instance fields
.field public final b:Lcq3;


# direct methods
.method public constructor <init>(Lcq3;)V
    .registers 3

    iget-object v0, p1, Lcq3;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/LineHeaderTextView;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lp6n;->b:Lcq3;

    return-void
.end method
