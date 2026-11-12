.class public final synthetic Lqrn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsrn;


# direct methods
.method public synthetic constructor <init>(Lsrn;B)V
    .registers 3

    iput-byte p2, p0, Lqrn;->a:B

    iput-object p1, p0, Lqrn;->b:Lsrn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lqrn;->a:B

    iget-object p0, p0, Lqrn;->b:Lsrn;

    packed-switch v0, :pswitch_data_1a

    iget-object p0, p0, Lsrn;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    return-object p0

    :pswitch_e
    iget-object p0, p0, Lsrn;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lwxe;->J(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
