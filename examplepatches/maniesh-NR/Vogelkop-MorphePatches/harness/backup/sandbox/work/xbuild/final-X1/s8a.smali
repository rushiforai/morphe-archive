.class public final Ls8a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp4l;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ls8a;->a:B

    iput-object p1, p0, Ls8a;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lm4l;)V
    .registers 2

    iget-byte p1, p0, Ls8a;->a:B

    iget-object p0, p0, Ls8a;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_14

    check-cast p0, Lz5l;

    invoke-virtual {p0}, Lz5l;->a()V

    return-void

    :pswitch_d
    check-cast p0, Lv8a;

    invoke-virtual {p0}, Lv8a;->a()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final b()V
    .registers 2

    iget-byte v0, p0, Ls8a;->a:B

    iget-object p0, p0, Ls8a;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_14

    check-cast p0, Lz5l;

    invoke-virtual {p0}, Lz5l;->a()V

    return-void

    :pswitch_d
    check-cast p0, Lv8a;

    invoke-virtual {p0}, Lv8a;->a()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
