.class public final Lfm3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/CollapsibleActionView;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lfm3;->a:B

    iput-object p1, p0, Lfm3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a()V
    .registers 1

    return-void
.end method

.method private final b()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final onActionViewCollapsed()V
    .registers 1

    iget-byte p0, p0, Lfm3;->a:B

    return-void
.end method

.method public final onActionViewExpanded()V
    .registers 4

    iget-byte v0, p0, Lfm3;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lfm3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_48

    check-cast p0, Loy;

    iget-object v0, p0, Loy;->i:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/ActionBarSearchView;

    if-eqz v0, :cond_24

    iget-object v2, p0, Loy;->c:Ljava/lang/Object;

    check-cast v2, Lshf;

    invoke-virtual {v2}, Lshf;->q()V

    iget-object v2, v2, Lshf;->a:Ljava/lang/Object;

    check-cast v2, Lesi;

    if-eqz v2, :cond_20

    iget-object v2, v2, Lesi;->a:Ljava/lang/String;

    goto :goto_21

    :cond_20
    const/4 v2, 0x0

    :goto_21
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    :cond_24
    iget-object v0, p0, Loy;->i:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/ActionBarSearchView;

    if-eqz v0, :cond_34

    new-instance v1, Lyhe;

    const/16 v2, 0x13

    invoke-direct {v1, p0, v2}, Lyhe;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    :cond_34
    return-void

    :pswitch_35
    check-cast p0, Lim3;

    iget-object v0, p0, Lim3;->H:Lcom/opera/android/custom_views/ActionBarSearchView;

    iget-object p0, p0, Lim3;->x:Lgn3;

    iget-object p0, p0, Lgn3;->y:Lrm3;

    invoke-virtual {p0}, Lshf;->q()V

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0, v1}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    return-void

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_35
    .end packed-switch
.end method
