.class public abstract Lyph;
.super Lgph;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;


# direct methods
.method public constructor <init>(Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyph;->a:Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 1

    invoke-virtual {p0}, Lyph;->j()V

    return-void
.end method

.method public final f(II)V
    .registers 3

    if-lez p1, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Lyph;->j()V

    return-void
.end method

.method public final h(II)V
    .registers 3

    if-lez p1, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Lyph;->j()V

    return-void
.end method

.method public j()V
    .registers 1

    iget-object p0, p0, Lyph;->a:Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    invoke-virtual {p0}, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->b()V

    return-void
.end method
