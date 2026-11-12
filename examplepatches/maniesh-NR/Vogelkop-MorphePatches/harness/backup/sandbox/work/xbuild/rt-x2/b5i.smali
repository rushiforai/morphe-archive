.class public final synthetic Lb5i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lke7;
.implements Lurg;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:D


# direct methods
.method public synthetic constructor <init>(DB)V
    .registers 4

    iput-byte p3, p0, Lb5i;->a:B

    iput-wide p1, p0, Lb5i;->b:D

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d(D)D
    .registers 7

    iget-byte v0, p0, Lb5i;->a:B

    packed-switch v0, :pswitch_data_24

    const-wide/16 v0, 0x0

    cmpg-double v2, p1, v0

    if-gez v2, :cond_c

    move-wide p1, v0

    :cond_c
    iget-wide v0, p0, Lb5i;->b:D

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p0

    return-wide p0

    :pswitch_13
    const-wide/16 v0, 0x0

    cmpg-double v2, p1, v0

    if-gez v2, :cond_1a

    move-wide p1, v0

    :cond_1a
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    iget-wide v2, p0, Lb5i;->b:D

    div-double/2addr v0, v2

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p0

    return-wide p0

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method

.method public final test(Ljava/lang/Object;)Z
    .registers 4

    check-cast p1, Lkqm;

    if-eqz p1, :cond_c

    iget-wide v0, p1, Lkqm;->h:D

    iget-wide p0, p0, Lb5i;->b:D

    cmpg-double p0, v0, p0

    if-gez p0, :cond_e

    :cond_c
    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method
