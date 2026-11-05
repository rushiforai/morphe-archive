.class public Le/e/a/v;
.super Ljava/lang/Object;
.source ""


# instance fields
.field public a:Landroid/view/View;

.field public b:Z

.field public c:Le/e/a/l3/b;

.field public d:Ljava/lang/String;

.field public e:Le/e/a/g0;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Le/e/a/g0;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    invoke-static {p1, v0}, Le/e/a/MiniSession225;->textureBacking(Landroid/content/Context;Z)Z

    move-result v0

    if-nez v0, :cond_1e

    invoke-static {}, Le/e/a/v0;->f()I

    move-result v0

    const/16 v1, 0x12

    if-eq v0, v1, :cond_1e

    new-instance v0, Le/e/a/t;

    invoke-direct {v0, p1, p0}, Le/e/a/t;-><init>(Landroid/content/Context;Le/e/a/v;)V

    iput-object v0, p0, Le/e/a/v;->a:Landroid/view/View;

    iget-object p1, p0, Le/e/a/v;->a:Landroid/view/View;

    check-cast p1, Le/e/a/t;

    goto :goto_29

    :cond_1e
    new-instance v0, Le/e/a/u;

    invoke-direct {v0, p1, p0}, Le/e/a/u;-><init>(Landroid/content/Context;Le/e/a/v;)V

    iput-object v0, p0, Le/e/a/v;->a:Landroid/view/View;

    iget-object p1, p0, Le/e/a/v;->a:Landroid/view/View;

    check-cast p1, Le/e/a/u;

    :goto_29
    iput-object p1, p0, Le/e/a/v;->c:Le/e/a/l3/b;

    iput-object p2, p0, Le/e/a/v;->e:Le/e/a/g0;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Le/e/a/g0;Ljava/lang/Float;Landroid/widget/LinearLayout;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v1, 0x12

    instance-of v0, p1, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-static {p1, v0}, Le/e/a/MiniSession225;->textureBacking(Landroid/content/Context;Z)Z

    move-result v0

    if-nez v0, :cond_1f

    invoke-static {}, Le/e/a/v0;->f()I

    move-result v0

    if-eq v0, v1, :cond_1f

    new-instance v0, Le/e/a/t;

    invoke-direct {v0, p1, p3, p0}, Le/e/a/t;-><init>(Landroid/content/Context;Ljava/lang/Float;Le/e/a/v;)V

    iput-object v0, p0, Le/e/a/v;->a:Landroid/view/View;

    iget-object p1, p0, Le/e/a/v;->a:Landroid/view/View;

    check-cast p1, Le/e/a/t;

    goto :goto_2a

    :cond_1f
    new-instance v0, Le/e/a/u;

    invoke-direct {v0, p1, p3, p0}, Le/e/a/u;-><init>(Landroid/content/Context;Ljava/lang/Float;Le/e/a/v;)V

    iput-object v0, p0, Le/e/a/v;->a:Landroid/view/View;

    iget-object p1, p0, Le/e/a/v;->a:Landroid/view/View;

    check-cast p1, Le/e/a/u;

    :goto_2a
    iput-object p1, p0, Le/e/a/v;->c:Le/e/a/l3/b;

    iget-object p1, p0, Le/e/a/v;->a:Landroid/view/View;

    invoke-virtual {p4, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iput-object p2, p0, Le/e/a/v;->e:Le/e/a/g0;

    return-void
.end method
