.class public final synthetic Lfto;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln1p;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lfto;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .registers 2

    iget-byte p0, p0, Lfto;->a:B

    packed-switch p0, :pswitch_data_e

    check-cast p1, Lt5p;

    sget-object p0, Lcbp;->b:Landroid/app/Application;

    return-void

    :pswitch_a
    check-cast p1, Lt0i;

    return-void

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
