.class public final synthetic Lrvl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp8f;


# direct methods
.method public synthetic constructor <init>(Lp8f;B)V
    .registers 3

    iput-byte p2, p0, Lrvl;->a:B

    iput-object p1, p0, Lrvl;->b:Lp8f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lrvl;->a:B

    iget-object p0, p0, Lrvl;->b:Lp8f;

    packed-switch v0, :pswitch_data_16

    check-cast p1, Lv8k;

    invoke-virtual {p0}, Lp8f;->a()V

    return-void

    :pswitch_d
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lp8f;->a()V

    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
