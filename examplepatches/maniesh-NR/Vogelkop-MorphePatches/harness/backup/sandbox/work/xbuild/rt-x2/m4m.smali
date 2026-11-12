.class public final synthetic Lm4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lala;


# direct methods
.method public synthetic constructor <init>(Lala;B)V
    .registers 3

    iput-byte p2, p0, Lm4m;->a:B

    iput-object p1, p0, Lm4m;->b:Lala;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 6

    iget-byte p1, p0, Lm4m;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lm4m;->b:Lala;

    const/4 v1, 0x1

    packed-switch p1, :pswitch_data_64

    iget-object p1, p0, Lala;->e:Ljava/lang/Object;

    check-cast p1, Ly0f;

    sget-object v2, Lrs0;->e:Lrs0;

    invoke-virtual {p1, v2}, Ly0f;->c(Lrs0;)V

    iget-object p1, p0, Lala;->i:Ljava/lang/Object;

    check-cast p1, Lz3m;

    iget-object v2, p0, Lala;->a:Ljava/lang/Object;

    check-cast v2, Lpt1;

    iget-object v2, v2, Lpt1;->g:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/BottomIndicatorButton;

    iget-object p0, p0, Lala;->g:Ljava/lang/Object;

    check-cast p0, Lr4m;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lj4m;

    invoke-direct {v3, p0, v0}, Lj4m;-><init>(Lr4m;B)V

    iput-object v3, p1, Lz3m;->o:Lcom/opera/api/Callback;

    const/4 p0, 0x0

    iput-object p0, p1, Lz3m;->p:Lszb;

    iput-boolean v1, p1, Lz3m;->q:Z

    invoke-virtual {p1, v2}, Lo73;->p(Landroid/view/View;)V

    return v1

    :pswitch_35
    iget-object p1, p0, Lala;->e:Ljava/lang/Object;

    check-cast p1, Ly0f;

    sget-object v2, Lrs0;->c:Lrs0;

    invoke-virtual {p1, v2}, Ly0f;->c(Lrs0;)V

    iget-object p1, p0, Lala;->i:Ljava/lang/Object;

    check-cast p1, Lz3m;

    iget-object v2, p0, Lala;->a:Ljava/lang/Object;

    check-cast v2, Lpt1;

    iget-object v2, v2, Lpt1;->c:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/BottomIndicatorButton;

    iget-object p0, p0, Lala;->g:Ljava/lang/Object;

    check-cast p0, Lr4m;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lj4m;

    invoke-direct {v3, p0, v1}, Lj4m;-><init>(Lr4m;B)V

    invoke-virtual {p0}, Lr4m;->W()Lszb;

    move-result-object p0

    iput-object v3, p1, Lz3m;->o:Lcom/opera/api/Callback;

    iput-object p0, p1, Lz3m;->p:Lszb;

    iput-boolean v0, p1, Lz3m;->q:Z

    invoke-virtual {p1, v2}, Lo73;->p(Landroid/view/View;)V

    return v1

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_35
    .end packed-switch
.end method
