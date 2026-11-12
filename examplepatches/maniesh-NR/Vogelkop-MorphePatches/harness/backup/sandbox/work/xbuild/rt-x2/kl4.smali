.class public final Lkl4;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lcq3;

.field public final c:Lil4;

.field public final d:Lil4;

.field public final e:Lnv6;

.field public f:Lcom/opera/android/suggestion/Suggestion;

.field public g:I


# direct methods
.method public constructor <init>(Lcq3;Lil4;Lil4;Lnv6;)V
    .registers 6

    iget-object v0, p1, Lcq3;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/suggestion/ChatSuggestionView;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lkl4;->b:Lcq3;

    iput-object p2, p0, Lkl4;->c:Lil4;

    iput-object p3, p0, Lkl4;->d:Lil4;

    iput-object p4, p0, Lkl4;->e:Lnv6;

    new-instance p1, Lyk4;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Llb4;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Llb4;-><init>(Ljava/lang/Object;B)V

    iput-object p1, v0, Lcom/opera/android/suggestion/ChatSuggestionView;->h:Llb4;

    new-instance p1, Ljl4;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Ljl4;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lw9n;

    invoke-direct {p0, v0, p1}, Lw9n;-><init>(Landroid/view/View;Lx9n;)V

    return-void
.end method
