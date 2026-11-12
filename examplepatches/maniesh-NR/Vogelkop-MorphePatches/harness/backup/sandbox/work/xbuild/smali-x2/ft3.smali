.class public final synthetic Lft3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqim;


# direct methods
.method public synthetic constructor <init>(Lqim;B)V
    .registers 3

    iput-byte p2, p0, Lft3;->a:B

    iput-object p1, p0, Lft3;->b:Lqim;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lft3;->a:B

    iget-object p0, p0, Lft3;->b:Lqim;

    packed-switch v0, :pswitch_data_10

    iget-object p0, p0, Lqim;->c:Lz77;

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lqim;->g:Loz3;

    return-object p0

    :pswitch_d
    iget-object p0, p0, Lqim;->g:Loz3;

    return-object p0

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method
