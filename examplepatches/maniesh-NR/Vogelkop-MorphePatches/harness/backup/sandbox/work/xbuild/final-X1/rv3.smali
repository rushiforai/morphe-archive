.class public final Lrv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw7l;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lrv3;->a:B

    iput-object p1, p0, Lrv3;->b:Ljava/lang/Object;

    iput-object p2, p0, Lrv3;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final c(ILb8l;)V
    .registers 3

    return-void
.end method


# virtual methods
.method public final a(ILdyg;)V
    .registers 5

    iget-byte v0, p0, Lrv3;->a:B

    iget-object v1, p0, Lrv3;->c:Ljava/lang/Object;

    iget-object p0, p0, Lrv3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_38

    check-cast p0, Lw7l;

    invoke-interface {p0, p1, p2}, Lw7l;->a(ILdyg;)V

    check-cast v1, Lc8l;

    iget-object p0, v1, Lc8l;->g:Li7f;

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :goto_17
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_27

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lw7l;

    invoke-interface {p0, p1, p2}, Lw7l;->a(ILdyg;)V

    goto :goto_17

    :cond_27
    return-void

    :pswitch_28
    instance-of p1, p2, Ls7l;

    if-eqz p1, :cond_32

    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_37

    :cond_32
    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    :goto_37
    return-void

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_28
    .end packed-switch
.end method

.method public final b(ILb8l;)V
    .registers 4

    iget-byte v0, p0, Lrv3;->a:B

    packed-switch v0, :pswitch_data_28

    iget-object v0, p0, Lrv3;->b:Ljava/lang/Object;

    check-cast v0, Lw7l;

    invoke-interface {v0, p1, p2}, Lw7l;->b(ILb8l;)V

    iget-object p0, p0, Lrv3;->c:Ljava/lang/Object;

    check-cast p0, Lc8l;

    iget-object p0, p0, Lc8l;->g:Li7f;

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :goto_17
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_27

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lw7l;

    invoke-interface {p0, p1, p2}, Lw7l;->b(ILb8l;)V

    goto :goto_17

    :cond_27
    :pswitch_27
    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
