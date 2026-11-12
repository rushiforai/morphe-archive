.class public final Lsy8;
.super Loy8;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;B)V
    .registers 5

    const/4 v0, 0x1

    packed-switch p3, :pswitch_data_10

    const-string p3, "ui_click"

    invoke-direct {p0, p3, p1, p2, v0}, Loy8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V

    return-void

    :pswitch_a
    const-string p3, "ui_impression"

    invoke-direct {p0, p3, p1, p2, v0}, Loy8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V

    return-void

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method
