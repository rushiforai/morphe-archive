.class public final synthetic Ljll;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhjf;


# direct methods
.method public synthetic constructor <init>(Lhjf;B)V
    .registers 3

    iput-byte p2, p0, Ljll;->a:B

    iput-object p1, p0, Ljll;->b:Lhjf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Ljll;->a:B

    iget-object p0, p0, Ljll;->b:Lhjf;

    packed-switch v0, :pswitch_data_1a

    invoke-static {p0}, Lozk;->b(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_10
    invoke-virtual {p0}, Lhjf;->E()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
