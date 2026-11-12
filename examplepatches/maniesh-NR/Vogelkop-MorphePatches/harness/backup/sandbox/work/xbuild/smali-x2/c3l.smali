.class public final synthetic Lc3l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lj1c;


# direct methods
.method public synthetic constructor <init>(Lj1c;B)V
    .registers 3

    iput-byte p2, p0, Lc3l;->a:B

    iput-object p1, p0, Lc3l;->b:Lj1c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lc3l;->a:B

    iget-object p0, p0, Lc3l;->b:Lj1c;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Landroid/util/Size;

    invoke-virtual {p0}, Lj1c;->a()V

    return-void

    :pswitch_d
    check-cast p1, Landroid/content/res/Configuration;

    invoke-virtual {p0}, Lj1c;->a()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
