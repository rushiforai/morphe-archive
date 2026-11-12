.class public final synthetic Le01;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lflb;


# direct methods
.method public synthetic constructor <init>(Lflb;B)V
    .registers 3

    iput-byte p2, p0, Le01;->a:B

    iput-object p1, p0, Le01;->b:Lflb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Le01;->a:B

    iget-object p0, p0, Le01;->b:Lflb;

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0}, Lflb;->i()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lflb;->i()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
