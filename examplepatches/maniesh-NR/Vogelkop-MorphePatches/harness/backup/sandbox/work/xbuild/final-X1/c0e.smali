.class public final synthetic Lc0e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ld0e;


# direct methods
.method public synthetic constructor <init>(Ld0e;B)V
    .registers 3

    iput-byte p2, p0, Lc0e;->a:B

    iput-object p1, p0, Lc0e;->b:Ld0e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lc0e;->a:B

    iget-object p0, p0, Lc0e;->b:Ld0e;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Ljava/util/LinkedHashSet;

    invoke-virtual {p0}, Ld0e;->Y()V

    return-void

    :pswitch_d
    check-cast p1, Leyj;

    invoke-virtual {p0}, Ld0e;->X()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
