.class public final synthetic Lejn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lfjn;


# direct methods
.method public synthetic constructor <init>(Lfjn;B)V
    .registers 3

    iput-byte p2, p0, Lejn;->a:B

    iput-object p1, p0, Lejn;->b:Lfjn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lejn;->a:B

    iget-object p0, p0, Lejn;->b:Lfjn;

    packed-switch v0, :pswitch_data_16

    iget-object p0, p0, Lfjn;->a:Landroid/content/Context;

    invoke-static {p0}, Li0l;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_e
    iget-object p0, p0, Lfjn;->a:Landroid/content/Context;

    invoke-static {p0}, Li0l;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
