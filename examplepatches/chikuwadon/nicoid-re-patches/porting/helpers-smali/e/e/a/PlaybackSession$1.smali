.class Le/e/a/PlaybackSession$1;
.super Ljava/lang/Object;
.source "PlaybackSession.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/PlaybackSession;->styleDialog(Landroid/app/AlertDialog;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$tint:Landroid/content/res/ColorStateList;


# direct methods
.method constructor <init>(Landroid/content/res/ColorStateList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 52
    iput-object p1, p0, Le/e/a/PlaybackSession$1;->val$tint:Landroid/content/res/ColorStateList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 5

    .line 52
    const/4 p2, 0x0

    :goto_1
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getChildCount()I

    move-result p3

    if-ge p2, p3, :cond_19

    invoke-virtual {p1, p2}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object p3

    instance-of p4, p3, Landroid/widget/CheckedTextView;

    if-eqz p4, :cond_16

    check-cast p3, Landroid/widget/CheckedTextView;

    iget-object p4, p0, Le/e/a/PlaybackSession$1;->val$tint:Landroid/content/res/ColorStateList;

    invoke-virtual {p3, p4}, Landroid/widget/CheckedTextView;->setCheckMarkTintList(Landroid/content/res/ColorStateList;)V

    :cond_16
    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_19
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 3

    .line 52
    return-void
.end method
