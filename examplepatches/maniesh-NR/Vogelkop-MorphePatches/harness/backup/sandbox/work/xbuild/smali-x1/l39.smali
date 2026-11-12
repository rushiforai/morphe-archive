.class public final synthetic Ll39;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lm39;


# direct methods
.method public synthetic constructor <init>(Lm39;B)V
    .registers 3

    iput-byte p2, p0, Ll39;->a:B

    iput-object p1, p0, Ll39;->b:Lm39;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Ll39;->a:B

    iget-object p0, p0, Ll39;->b:Lm39;

    packed-switch v0, :pswitch_data_18

    invoke-static {p0}, Lm39;->d(Lm39;)Landroid/widget/inline/InlinePresentationSpec;

    move-result-object p0

    return-object p0

    :pswitch_c
    new-instance v0, Ls45;

    iget-object p0, p0, Lm39;->e:Landroid/service/autofill/FillRequest;

    invoke-virtual {p0}, Landroid/service/autofill/FillRequest;->getClientState()Landroid/os/Bundle;

    move-result-object p0

    invoke-direct {v0, p0}, Ls45;-><init>(Landroid/os/Bundle;)V

    return-object v0

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
