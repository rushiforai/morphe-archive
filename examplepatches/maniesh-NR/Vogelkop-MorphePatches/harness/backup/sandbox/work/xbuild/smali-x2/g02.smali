.class public final synthetic Lg02;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ll02;


# direct methods
.method public synthetic constructor <init>(Ll02;B)V
    .registers 3

    iput-byte p2, p0, Lg02;->a:B

    iput-object p1, p0, Lg02;->b:Ll02;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lg02;->a:B

    iget-object p0, p0, Lg02;->b:Ll02;

    packed-switch v0, :pswitch_data_26

    new-instance v0, Lghj;

    iget-object v1, p0, Ll02;->a:Lji;

    iget-object v1, v1, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v1

    iget-object v2, p0, Ll02;->b:Lyv3;

    iget-object p0, p0, Ll02;->c:Lyv3;

    invoke-direct {v0, v1, v2, p0}, Lghj;-><init>(Ldb;Lyv3;Lyv3;)V

    return-object v0

    :pswitch_19
    new-instance v0, Lg02;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lg02;-><init>(Ll02;B)V

    invoke-static {v0}, Lioh;->k(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lghj;

    return-object p0

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
