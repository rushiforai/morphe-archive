.class public final Ltj7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final a:Lb6h;

.field public final b:Landroidx/recyclerview/widget/i;


# direct methods
.method public constructor <init>(Lb6h;Landroidx/recyclerview/widget/i;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltj7;->a:Lb6h;

    iput-object p2, p0, Ltj7;->b:Landroidx/recyclerview/widget/i;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 p2, 0x0

    if-nez p1, :cond_2c

    iget-object p1, p0, Ltj7;->a:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lskb;

    iget-object v0, p1, Lskb;->f:Landroidx/recyclerview/widget/i;

    if-nez v0, :cond_2c

    iget-object v0, p1, Lskb;->h:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    if-nez v0, :cond_19

    move-object v0, v1

    :cond_19
    invoke-static {v0}, Lflb;->n(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_20

    return p2

    :cond_20
    iget-object p1, p1, Lskb;->g:Lflb;

    if-eqz p1, :cond_25

    move-object v1, p1

    :cond_25
    iget-object p0, p0, Ltj7;->b:Landroidx/recyclerview/widget/i;

    invoke-virtual {v1, p0}, Lflb;->s(Landroidx/recyclerview/widget/i;)V

    const/4 p0, 0x1

    return p0

    :cond_2c
    return p2
.end method
