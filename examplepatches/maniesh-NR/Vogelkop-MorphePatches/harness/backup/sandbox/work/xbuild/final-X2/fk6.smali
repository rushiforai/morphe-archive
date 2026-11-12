.class public final synthetic Lfk6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;IIB)V
    .registers 5

    iput-byte p4, p0, Lfk6;->a:B

    iput-object p1, p0, Lfk6;->d:Ljava/lang/Object;

    iput p2, p0, Lfk6;->b:I

    iput p3, p0, Lfk6;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lfk6;->a:B

    iget v1, p0, Lfk6;->c:I

    iget v2, p0, Lfk6;->b:I

    iget-object p0, p0, Lfk6;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1a

    check-cast p0, Lokhttp3/internal/http2/Http2Connection;

    invoke-static {p0, v2, v1}, Lokhttp3/internal/http2/Http2Connection$ReaderRunnable;->b(Lokhttp3/internal/http2/Http2Connection;II)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_12
    check-cast p0, Lgjf;

    invoke-virtual {p0, v2, v1}, Lgjf;->b(II)Lbcd;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
