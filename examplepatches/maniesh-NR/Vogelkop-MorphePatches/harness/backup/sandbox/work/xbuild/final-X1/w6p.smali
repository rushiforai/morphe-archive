.class public final Lw6p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# instance fields
.field public a:Z

.field public final synthetic b:Lo7p;


# direct methods
.method public constructor <init>(Lo7p;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw6p;->b:Lo7p;

    return-void
.end method


# virtual methods
.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 5

    iget-boolean p1, p0, Lw6p;->a:Z

    const/4 v0, 0x1

    if-nez p1, :cond_1d

    iput-boolean v0, p0, Lw6p;->a:Z

    iget-object p1, p0, Lw6p;->b:Lo7p;

    iget-object p1, p1, Lpxo;->e:Lbap;

    iget-boolean p1, p1, Lbap;->d:Z

    if-eqz p1, :cond_1d

    iget-object p1, p0, Lw6p;->b:Lo7p;

    iget-object p1, p1, Lpxo;->i:Lp7p;

    if-eqz p1, :cond_1d

    sget-object v1, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/4 v1, 0x0

    const/16 v2, 0x3fb

    invoke-virtual {p1, v2, v1}, Lp7p;->g(ILjava/lang/String;)V

    :cond_1d
    iget-object p0, p0, Lw6p;->b:Lo7p;

    invoke-virtual {p0, v0}, Lo7p;->i(Z)V

    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    iget-object p0, p0, Lw6p;->b:Lo7p;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lo7p;->i(Z)V

    return-void
.end method
