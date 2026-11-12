.class public final synthetic Lwxh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lisd;


# direct methods
.method public synthetic constructor <init>(Lisd;B)V
    .registers 3

    iput-byte p2, p0, Lwxh;->a:B

    iput-object p1, p0, Lwxh;->b:Lisd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lwxh;->a:B

    iget-object p0, p0, Lwxh;->b:Lisd;

    packed-switch v0, :pswitch_data_26

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Leof;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Leof;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_11
    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Leof;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Leof;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_1b
    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Leof;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Leof;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_11
    .end packed-switch
.end method
