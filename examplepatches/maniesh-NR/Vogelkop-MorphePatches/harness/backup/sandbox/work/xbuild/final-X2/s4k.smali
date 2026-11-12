.class public final synthetic Ls4k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/Lazy;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/Lazy;B)V
    .registers 3

    iput-byte p2, p0, Ls4k;->a:B

    iput-object p1, p0, Ls4k;->b:Lcom/opera/android/Lazy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Ls4k;->a:B

    iget-object p0, p0, Ls4k;->b:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    packed-switch v0, :pswitch_data_12

    check-cast p0, Lu4l;

    return-object p0

    :pswitch_e
    check-cast p0, Llg;

    return-object p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
