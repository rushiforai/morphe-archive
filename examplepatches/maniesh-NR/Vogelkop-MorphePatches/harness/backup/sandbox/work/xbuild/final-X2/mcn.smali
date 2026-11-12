.class public final synthetic Lmcn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Locn;


# direct methods
.method public synthetic constructor <init>(Locn;B)V
    .registers 3

    iput-byte p2, p0, Lmcn;->a:B

    iput-object p1, p0, Lmcn;->b:Locn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lmcn;->a:B

    iget-object p0, p0, Lmcn;->b:Locn;

    packed-switch v0, :pswitch_data_54

    iget-object v0, p0, Locn;->a:Lncn;

    iget-object v1, v0, Lf3d;->a:Lp2d;

    if-eqz v1, :cond_38

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_1f

    iget-object v0, p0, Locn;->h:Lk2d;

    if-eqz v0, :cond_1b

    invoke-virtual {p0, v0}, Locn;->S(Lk2d;)V

    goto :goto_38

    :cond_1b
    invoke-virtual {p0}, Locn;->R()V

    goto :goto_38

    :cond_1f
    iget-object p0, p0, Locn;->b:Lesg;

    iget-object p0, p0, Lesg;->b:Ljava/lang/Object;

    check-cast p0, Lncn;

    iget-object v0, p0, Lf3d;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lf3d;->b:Lp3d;

    invoke-virtual {v0}, Lp3d;->cancel()V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v0

    if-nez v0, :cond_38

    const/4 v0, 0x1

    iput v0, p0, Lf3d;->E:I

    :cond_38
    :goto_38
    return-void

    :pswitch_39
    iget-object v0, p0, Locn;->h:Lk2d;

    sget-object v1, Locn;->j:Lk2d;

    sget-object v2, Locn;->l:Lk2d;

    if-ne v0, v1, :cond_4c

    iget v0, p0, Locn;->g:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_48

    sget-object v2, Locn;->k:Lk2d;

    :cond_48
    invoke-virtual {p0, v2}, Locn;->S(Lk2d;)V

    goto :goto_53

    :cond_4c
    if-ne v0, v2, :cond_53

    sget-object v0, Locn;->m:Lk2d;

    invoke-virtual {p0, v0}, Locn;->S(Lk2d;)V

    :cond_53
    :goto_53
    return-void

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_39
    .end packed-switch
.end method
