.class public final Lzs2;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final c:Lor2;

.field public d:Lru2;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lor2;Lole;)V
    .registers 5

    iget-object v0, p2, Lor2;->c:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lzs2;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p2, p0, Lzs2;->c:Lor2;

    new-instance p1, Lnf;

    const/16 p2, 0x9

    invoke-direct {p1, p0, p3, p2}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lys2;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p3, p2}, Lys2;-><init>(Landroidx/recyclerview/widget/i;Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method
