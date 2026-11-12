.class public final synthetic Lcu1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldu1;


# direct methods
.method public synthetic constructor <init>(Ldu1;B)V
    .registers 3

    iput-byte p2, p0, Lcu1;->a:B

    iput-object p1, p0, Lcu1;->b:Ldu1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lcu1;->a:B

    iget-object p0, p0, Lcu1;->b:Ldu1;

    packed-switch v0, :pswitch_data_18

    iget-object p0, p0, Ldu1;->a:Li3j;

    const-string v0, "startup#core"

    invoke-virtual {p0, v0}, Li3j;->p(Ljava/lang/String;)J

    return-void

    :pswitch_f
    iget-object p0, p0, Ldu1;->a:Li3j;

    const-string v0, "startup#fps"

    invoke-virtual {p0, v0}, Li3j;->p(Ljava/lang/String;)J

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
