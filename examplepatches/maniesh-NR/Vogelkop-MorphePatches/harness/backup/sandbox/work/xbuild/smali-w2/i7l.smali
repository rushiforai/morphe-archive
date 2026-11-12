.class public final synthetic Li7l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lq7l;

.field public final synthetic c:Lm7l;


# direct methods
.method public synthetic constructor <init>(Lq7l;Lm7l;B)V
    .registers 4

    iput-byte p3, p0, Li7l;->a:B

    iput-object p1, p0, Li7l;->b:Lq7l;

    iput-object p2, p0, Li7l;->c:Lm7l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Li7l;->a:B

    iget-object v1, p0, Li7l;->c:Lm7l;

    iget-object p0, p0, Li7l;->b:Lq7l;

    packed-switch v0, :pswitch_data_20

    check-cast p1, Lkotlin/Unit;

    invoke-virtual {p0, v1}, Lq7l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_11
    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of p1, p1, Lq0i;

    if-eqz p1, :cond_1a

    const/4 v1, 0x0

    :cond_1a
    invoke-virtual {p0, v1}, Lq7l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
