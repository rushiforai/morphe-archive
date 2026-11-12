.class public final synthetic Lhs6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljs6;


# direct methods
.method public synthetic constructor <init>(Ljs6;B)V
    .registers 3

    iput-byte p2, p0, Lhs6;->a:B

    iput-object p1, p0, Lhs6;->b:Ljs6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lhs6;->a:B

    iget-object p0, p0, Lhs6;->b:Ljs6;

    packed-switch v0, :pswitch_data_1c

    iget-object p0, p0, Ljs6;->g:Ljava/lang/Object;

    check-cast p0, Lxoc;

    sget-object v0, Ltg0;->b:Ltg0;

    invoke-virtual {p0, v0}, Lxoc;->a(Ltg0;)V

    return-void

    :pswitch_11
    iget-object p0, p0, Ljs6;->g:Ljava/lang/Object;

    check-cast p0, Lxoc;

    sget-object v0, Ltg0;->e:Ltg0;

    invoke-virtual {p0, v0}, Lxoc;->a(Ltg0;)V

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
