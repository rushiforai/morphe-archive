.class public final synthetic Lyoc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lzoc;


# direct methods
.method public synthetic constructor <init>(Lzoc;B)V
    .registers 3

    iput-byte p2, p0, Lyoc;->a:B

    iput-object p1, p0, Lyoc;->b:Lzoc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lyoc;->a:B

    iget-object p0, p0, Lyoc;->b:Lzoc;

    packed-switch v0, :pswitch_data_e

    iget-object p0, p0, Lzoc;->j:Lwmc;

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lzoc;->j:Lwmc;

    return-object p0

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
