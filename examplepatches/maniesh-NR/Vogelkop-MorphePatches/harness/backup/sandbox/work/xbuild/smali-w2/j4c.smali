.class public final Lj4c;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Lesk;


# direct methods
.method public synthetic constructor <init>(Lesk;B)V
    .registers 3

    iput-byte p2, p0, Lj4c;->e:B

    iput-object p1, p0, Lj4c;->f:Lesk;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lj4c;->e:B

    iget-object p0, p0, Lj4c;->f:Lesk;

    packed-switch v0, :pswitch_data_12

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_c
    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
