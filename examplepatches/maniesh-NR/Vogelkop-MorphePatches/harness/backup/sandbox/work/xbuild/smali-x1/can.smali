.class public Lcan;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Landroid/graphics/Rect;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public b:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcan;->c:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcan;->a:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 4

    iget-object p0, p0, Lcan;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_6
    :goto_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lban;

    iget-object v1, v0, Lban;->a:Landroid/view/View;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    iget-object v1, v0, Lban;->a:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    goto :goto_6

    :cond_26
    return-void
.end method

.method public final b(Z)V
    .registers 7

    iget-boolean v0, p0, Lcan;->b:Z

    if-eq v0, p1, :cond_23

    iput-boolean p1, p0, Lcan;->b:Z

    iget-object p1, p0, Lcan;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_d
    :goto_d
    if-ge v1, v0, :cond_23

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lban;

    iget-boolean v3, p0, Lcan;->b:Z

    iget-boolean v4, v2, Lban;->e:Z

    if-eq v4, v3, :cond_d

    iput-boolean v3, v2, Lban;->e:Z

    invoke-virtual {v2}, Lban;->a()V

    goto :goto_d

    :cond_23
    return-void
.end method

.method public final c(Landroid/view/View;Ly9n;)V
    .registers 5

    new-instance v0, Lban;

    iget-boolean v1, p0, Lcan;->b:Z

    invoke-direct {v0, p1, v1, p2}, Lban;-><init>(Landroid/view/View;ZLy9n;)V

    iget-object p0, p0, Lcan;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final d()V
    .registers 4

    iget-boolean v0, p0, Lcan;->b:Z

    if-eqz v0, :cond_19

    iget-object p0, p0, Lcan;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_b
    if-ge v1, v0, :cond_19

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lban;

    invoke-virtual {v2}, Lban;->a()V

    goto :goto_b

    :cond_19
    return-void
.end method
