.class public Landroidx/appcompat/widget/AbsActionBarView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jml0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/AbsActionBarView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public final synthetic c:Landroidx/appcompat/widget/AbsActionBarView;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/AbsActionBarView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/AbsActionBarView$a;->c:Landroidx/appcompat/widget/AbsActionBarView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Landroidx/appcompat/widget/AbsActionBarView$a;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Ll/hml0;I)Landroidx/appcompat/widget/AbsActionBarView$a;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AbsActionBarView$a;->c:Landroidx/appcompat/widget/AbsActionBarView;

    .line 2
    .line 3
    iput-object p1, v0, Landroidx/appcompat/widget/AbsActionBarView;->f:Ll/hml0;

    .line 4
    .line 5
    iput p2, p0, Landroidx/appcompat/widget/AbsActionBarView$a;->b:I

    .line 6
    .line 7
    return-object p0
.end method

.method public onAnimationCancel(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Landroidx/appcompat/widget/AbsActionBarView$a;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Landroidx/appcompat/widget/AbsActionBarView$a;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Landroidx/appcompat/widget/AbsActionBarView$a;->c:Landroidx/appcompat/widget/AbsActionBarView;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p1, Landroidx/appcompat/widget/AbsActionBarView;->f:Ll/hml0;

    .line 10
    .line 11
    iget p0, p0, Landroidx/appcompat/widget/AbsActionBarView$a;->b:I

    .line 12
    .line 13
    invoke-static {p1, p0}, Landroidx/appcompat/widget/AbsActionBarView;->b(Landroidx/appcompat/widget/AbsActionBarView;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onAnimationStart(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Landroidx/appcompat/widget/AbsActionBarView$a;->c:Landroidx/appcompat/widget/AbsActionBarView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Landroidx/appcompat/widget/AbsActionBarView;->a(Landroidx/appcompat/widget/AbsActionBarView;I)V

    .line 5
    .line 6
    .line 7
    iput-boolean v0, p0, Landroidx/appcompat/widget/AbsActionBarView$a;->a:Z

    .line 8
    .line 9
    return-void
.end method
