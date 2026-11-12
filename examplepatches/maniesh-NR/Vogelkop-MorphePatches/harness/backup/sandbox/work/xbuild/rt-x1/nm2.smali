.class public final Lnm2;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;B)V
    .registers 3

    iput-byte p2, p0, Lnm2;->c:B

    iput-object p1, p0, Lnm2;->d:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 4

    iget-byte v0, p0, Lnm2;->c:B

    iget-object p0, p0, Lnm2;->d:Ljava/lang/String;

    packed-switch v0, :pswitch_data_24

    const/16 v0, 0x9c4

    invoke-static {p1, p0, v0}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p0

    return-object p0

    :pswitch_e
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f1401f9

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p1, p0, v0}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
