.class public final synthetic Llvl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpvl;


# direct methods
.method public synthetic constructor <init>(Lpvl;B)V
    .registers 3

    iput-byte p2, p0, Llvl;->a:B

    iput-object p1, p0, Llvl;->b:Lpvl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Llvl;->a:B

    iget-object p0, p0, Llvl;->b:Lpvl;

    packed-switch v0, :pswitch_data_76

    check-cast p1, Lx43;

    iget-object p0, p0, Lz43;->h:Ljava/lang/Object;

    check-cast p0, Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_11
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly43;

    invoke-interface {v0, p1}, Ly43;->O(Lx43;)V

    goto :goto_11

    :cond_21
    return-void

    :pswitch_22
    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object p0, p0, Lz43;->h:Ljava/lang/Object;

    check-cast p0, Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_30
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_40

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly43;

    invoke-interface {v0, p1}, Ly43;->v(F)V

    goto :goto_30

    :cond_40
    return-void

    :pswitch_41
    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object v0, p0, Luul;->j:Lcom/opera/android/bar/TopToolbarContainer;

    iget-object p0, p0, Lz43;->h:Ljava/lang/Object;

    check-cast p0, Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_51
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_61

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ly43;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_51

    :cond_61
    const/4 p0, 0x0

    cmpl-float p0, p1, p0

    if-nez p0, :cond_6b

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/view/View;->setLongClickable(Z)V

    goto :goto_75

    :cond_6b
    const/high16 p0, 0x3f800000    # 1.0f

    cmpl-float p0, p1, p0

    if-nez p0, :cond_75

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/view/View;->setLongClickable(Z)V

    :cond_75
    :goto_75
    return-void

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_41
        :pswitch_22
    .end packed-switch
.end method
