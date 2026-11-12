.class public final synthetic Lqpk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrpk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Leyi;


# direct methods
.method public synthetic constructor <init>(Leyi;B)V
    .registers 3

    iput-byte p2, p0, Lqpk;->a:B

    iput-object p1, p0, Lqpk;->b:Leyi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(DILjava/lang/Object;)Look;
    .registers 12

    iget-byte p1, p0, Lqpk;->a:B

    iget-object p0, p0, Lqpk;->b:Leyi;

    packed-switch p1, :pswitch_data_4e

    check-cast p4, Lrca;

    iget-object p0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p0, Lepk;

    iget-object p1, p4, Lrca;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lepk;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Ljava/lang/String;

    new-instance v0, Look;

    iget-object v3, p4, Lrca;->b:Ljava/lang/String;

    iget-object v4, p4, Lrca;->a:Ljava/lang/String;

    iget-boolean p0, p4, Lrca;->c:Z

    if-eqz p0, :cond_24

    const/4 p0, 0x5

    :goto_21
    move v1, p0

    move v2, p3

    goto :goto_26

    :cond_24
    const/4 p0, 0x4

    goto :goto_21

    :goto_26
    invoke-direct/range {v0 .. v5}, Look;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :pswitch_2a
    move v2, p3

    check-cast p4, Lrca;

    iget-object p0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p0, Lepk;

    iget-object p1, p4, Lrca;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lepk;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Ljava/lang/String;

    new-instance v1, Look;

    iget-object v4, p4, Lrca;->b:Ljava/lang/String;

    iget-object v5, p4, Lrca;->a:Ljava/lang/String;

    iget-boolean p0, p4, Lrca;->c:Z

    if-eqz p0, :cond_48

    const/4 p0, 0x2

    :goto_45
    move v3, v2

    move v2, p0

    goto :goto_4a

    :cond_48
    const/4 p0, 0x1

    goto :goto_45

    :goto_4a
    invoke-direct/range {v1 .. v6}, Look;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_2a
    .end packed-switch
.end method
