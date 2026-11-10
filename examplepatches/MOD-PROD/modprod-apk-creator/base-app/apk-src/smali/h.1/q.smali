.class public final Lh/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ActionProvider$VisibilityListener;


# instance fields
.field public a:LC/j;

.field public final b:Landroid/view/ActionProvider;

.field public final synthetic c:Lh/u;


# direct methods
.method public constructor <init>(Lh/u;Landroid/view/ActionProvider;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh/q;->c:Lh/u;

    iput-object p2, p0, Lh/q;->b:Landroid/view/ActionProvider;

    return-void
.end method


# virtual methods
.method public final onActionProviderVisibilityChanged(Z)V
    .locals 1

    iget-object p1, p0, Lh/q;->a:LC/j;

    if-eqz p1, :cond_0

    iget-object p1, p1, LC/j;->b:Ljava/lang/Object;

    check-cast p1, Lh/p;

    iget-object p1, p1, Lh/p;->n:Lh/n;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lh/n;->h:Z

    invoke-virtual {p1, v0}, Lh/n;->p(Z)V

    :cond_0
    return-void
.end method
