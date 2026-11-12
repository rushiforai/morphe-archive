.class public final synthetic Lsnl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkol;


# direct methods
.method public synthetic constructor <init>(Lkol;B)V
    .registers 3

    iput-byte p2, p0, Lsnl;->a:B

    iput-object p1, p0, Lsnl;->b:Lkol;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lsnl;->a:B

    iget-object p0, p0, Lsnl;->b:Lkol;

    packed-switch v0, :pswitch_data_1c

    check-cast p1, Lqjn;

    iget-object p1, p0, Lkol;->e:Lhol;

    iget-object p1, p1, Lhol;->b:Lbwg;

    instance-of p1, p1, Lcol;

    if-eqz p1, :cond_15

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lkol;->g(Z)V

    :cond_15
    return-void

    :pswitch_16
    check-cast p1, Lcyj;

    invoke-virtual {p0}, Lkol;->h()V

    return-void

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
