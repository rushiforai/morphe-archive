.class public final Lil9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public a:Z

.field public final synthetic b:B

.field public final synthetic c:Lll9;


# direct methods
.method public synthetic constructor <init>(Lll9;B)V
    .registers 3

    iput-byte p2, p0, Lil9;->b:B

    iput-object p1, p0, Lil9;->c:Lll9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-byte v0, p0, Lil9;->b:B

    iget-object p0, p0, Lil9;->c:Lll9;

    packed-switch v0, :pswitch_data_28

    iget-object p0, p0, Lll9;->c:Lqim;

    invoke-virtual {p0}, Lqim;->a()V

    return-void

    :pswitch_d
    iget-object p0, p0, Lll9;->c:Lqim;

    invoke-virtual {p0}, Lqim;->d()Z

    move-result v0

    invoke-virtual {p0, v0}, Lqim;->e(Z)V

    return-void

    :pswitch_17
    invoke-virtual {p0}, Lll9;->a()V

    iget v0, p0, Lll9;->h:I

    if-gtz v0, :cond_27

    iget v0, p0, Lll9;->i:I

    if-gtz v0, :cond_27

    iget-object p0, p0, Lll9;->c:Lqim;

    invoke-virtual {p0}, Lqim;->a()V

    :cond_27
    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_17
        :pswitch_d
    .end packed-switch
.end method

.method public final run()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lil9;->a:Z

    invoke-virtual {p0}, Lil9;->a()V

    return-void
.end method
