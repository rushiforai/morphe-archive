.class public final Lkdn;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lbt1;


# direct methods
.method public constructor <init>(Lbt1;Ltah;)V
    .registers 5

    iget-object v0, p1, Lbt1;->b:Landroid/widget/LinearLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lkdn;->b:Lbt1;

    iget-object p1, p1, Lbt1;->d:Lcom/opera/android/custom_views/StylingImageView;

    new-instance v0, Le73;

    const/16 v1, 0xe

    invoke-direct {v0, p0, p2, v1}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, v0}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v0, p1}, Le73;->a(Landroid/view/View;)V

    return-void
.end method
