.class public final Lpq2;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lvs;

.field public final c:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final d:Loq2;

.field public final e:I

.field public f:Lru2;


# direct methods
.method public constructor <init>(Lvs;Lcom/opera/android/browser/chromium/ChromiumContent;Loq2;I)V
    .registers 6

    iget-object v0, p1, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lpq2;->b:Lvs;

    iput-object p2, p0, Lpq2;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p3, p0, Lpq2;->d:Loq2;

    iput p4, p0, Lpq2;->e:I

    new-instance p1, Lgf;

    const/16 p2, 0x10

    invoke-direct {p1, p0, p2}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
