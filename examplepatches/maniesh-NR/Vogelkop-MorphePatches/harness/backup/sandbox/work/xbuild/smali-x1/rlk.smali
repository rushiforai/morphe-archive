.class public final synthetic Lrlk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lslk;


# direct methods
.method public synthetic constructor <init>(Lslk;B)V
    .registers 3

    iput-byte p2, p0, Lrlk;->a:B

    iput-object p1, p0, Lrlk;->b:Lslk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lrlk;->a:B

    iget-object p0, p0, Lrlk;->b:Lslk;

    check-cast p1, Lwvg;

    packed-switch v0, :pswitch_data_12

    invoke-virtual {p0}, Lslk;->c()V

    return-void

    :pswitch_d
    invoke-virtual {p0}, Lslk;->c()V

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
