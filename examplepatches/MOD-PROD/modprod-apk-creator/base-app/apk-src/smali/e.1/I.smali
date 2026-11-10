.class public final Le/I;
.super Lz/i;
.source "SourceFile"


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Le/K;


# direct methods
.method public synthetic constructor <init>(Le/K;I)V
    .locals 0

    iput p2, p0, Le/I;->a:I

    iput-object p1, p0, Le/I;->b:Le/K;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    const/4 v0, 0x0

    iget-object v1, p0, Le/I;->b:Le/K;

    iget v2, p0, Le/I;->a:I

    packed-switch v2, :pswitch_data_0

    iput-object v0, v1, Le/K;->G:Lg/j;

    iget-object v0, v1, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_0
    iget-boolean v2, v1, Le/K;->C:Z

    if-eqz v2, :cond_0

    iget-object v2, v1, Le/K;->u:Landroid/view/View;

    if-eqz v2, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationY(F)V

    iget-object v2, v1, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationY(F)V

    :cond_0
    iget-object v2, v1, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/ActionBarContainer;->setVisibility(I)V

    iget-object v2, v1, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/ActionBarContainer;->setTransitioning(Z)V

    iput-object v0, v1, Le/K;->G:Lg/j;

    iget-object v2, v1, Le/K;->y:LG/a;

    if-eqz v2, :cond_1

    iget-object v3, v1, Le/K;->x:Le/J;

    invoke-virtual {v2, v3}, LG/a;->b(Lg/a;)V

    iput-object v0, v1, Le/K;->x:Le/J;

    iput-object v0, v1, Le/K;->y:LG/a;

    :cond_1
    iget-object v0, v1, Le/K;->q:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    if-eqz v0, :cond_2

    sget-object v1, Ly/K;->a:Ljava/util/WeakHashMap;

    invoke-static {v0}, Ly/y;->c(Landroid/view/View;)V

    :cond_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
