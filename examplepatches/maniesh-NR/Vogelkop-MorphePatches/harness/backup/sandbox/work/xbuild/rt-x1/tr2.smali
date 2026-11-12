.class public final Ltr2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Les2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lkotlin/jvm/functions/Function1;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Ltr2;->a:B

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Ltr2;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lwr2;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Ltr2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ltr2;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 3

    iget-byte v0, p0, Ltr2;->a:B

    iget-object p0, p0, Ltr2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_16

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_d
    check-cast p0, Lwr2;

    iget-object p0, p0, Lwr2;->r:Lbv1;

    invoke-virtual {p0, p1}, Lbv1;->H(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
