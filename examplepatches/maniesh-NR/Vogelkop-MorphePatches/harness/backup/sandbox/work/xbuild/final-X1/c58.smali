.class public final synthetic Lc58;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf58;

.field public final synthetic c:Lm7l;


# direct methods
.method public synthetic constructor <init>(Lf58;Lm7l;B)V
    .registers 4

    iput-byte p3, p0, Lc58;->a:B

    iput-object p1, p0, Lc58;->b:Lf58;

    iput-object p2, p0, Lc58;->c:Lm7l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lc58;->a:B

    iget-object v1, p0, Lc58;->c:Lm7l;

    iget-object p0, p0, Lc58;->b:Lf58;

    check-cast p1, Losk;

    packed-switch v0, :pswitch_data_1c

    iget-object p0, p0, Lf58;->b:Lnb2;

    invoke-virtual {p0, p1, v1}, Lkfo;->Q(Losk;Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    iget-object p0, p0, Lf58;->c:Lli3;

    invoke-virtual {p0, p1, v1}, Lz4o;->X(Losk;Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
