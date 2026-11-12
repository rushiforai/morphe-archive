.class public final Lfvc;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/custom_views/StylingTextView;

.field public c:Lbre;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 3

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    const v0, 0x7f0a03a5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    iput-object p1, p0, Lfvc;->b:Lcom/opera/android/custom_views/StylingTextView;

    return-void
.end method
