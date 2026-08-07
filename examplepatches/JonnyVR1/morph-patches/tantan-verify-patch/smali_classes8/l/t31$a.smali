.class public Ll/t31$a;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/t31;-><init>(Lcom/facebook/drawee/view/DraweeView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/t31;


# direct methods
.method public constructor <init>(Ll/t31;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t31$a;->a:Ll/t31;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/t31$a;->a:Ll/t31;

    .line 5
    .line 6
    invoke-static {p1}, Ll/t31;->i(Ll/t31;)Landroid/view/View$OnLongClickListener;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/t31$a;->a:Ll/t31;

    .line 13
    .line 14
    invoke-static {p1}, Ll/t31;->i(Ll/t31;)Landroid/view/View$OnLongClickListener;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/t31$a;->a:Ll/t31;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {p1, v0}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/t31$a;->a:Ll/t31;

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    iput-boolean p1, p0, Ll/t31;->z:Z

    .line 31
    .line 32
    invoke-static {p0}, Ll/t31;->h(Ll/t31;)Ll/i5e;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p1}, Ll/i5e;->c(Z)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method
