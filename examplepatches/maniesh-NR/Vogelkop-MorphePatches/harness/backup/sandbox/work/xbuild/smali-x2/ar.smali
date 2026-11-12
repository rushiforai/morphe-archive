.class public final synthetic Lar;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldr;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ldr;ZB)V
    .registers 4

    iput-byte p3, p0, Lar;->a:B

    iput-object p1, p0, Lar;->b:Ldr;

    iput-boolean p2, p0, Lar;->c:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lar;->a:B

    iget-boolean v1, p0, Lar;->c:Z

    iget-object p0, p0, Lar;->b:Ldr;

    packed-switch v0, :pswitch_data_10

    iput-boolean v1, p0, Ldr;->e:Z

    return-void

    :pswitch_c
    iput-boolean v1, p0, Ldr;->f:Z

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
