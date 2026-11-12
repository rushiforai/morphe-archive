.class public final synthetic Lky0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmy0;


# direct methods
.method public synthetic constructor <init>(Lmy0;B)V
    .registers 3

    iput-byte p2, p0, Lky0;->a:B

    iput-object p1, p0, Lky0;->b:Lmy0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lky0;->a:B

    iget-object p0, p0, Lky0;->b:Lmy0;

    packed-switch v0, :pswitch_data_1c

    check-cast p1, Li0a;

    iget-object p0, p0, Lmy0;->b:Lfd;

    invoke-virtual {p0}, Lfd;->c()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_11
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lmy0;->b:Lfd;

    invoke-virtual {p0}, Lfd;->c()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
