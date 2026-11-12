.class public final Lby8;
.super Lzx8;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lmsh;B)V
    .registers 4

    const/4 v0, 0x0

    packed-switch p2, :pswitch_data_10

    const-string p2, "click"

    invoke-direct {p0, p1, p2, v0}, Lzx8;-><init>(Lmsh;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :pswitch_a
    const-string p2, "share"

    invoke-direct {p0, p1, p2, v0}, Lzx8;-><init>(Lmsh;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :pswitch_data_10
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method
