.class public final synthetic Lk25;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Liu2;

.field public final synthetic c:Ls25;


# direct methods
.method public synthetic constructor <init>(Liu2;Ls25;B)V
    .registers 4

    iput-byte p3, p0, Lk25;->a:B

    iput-object p1, p0, Lk25;->b:Liu2;

    iput-object p2, p0, Lk25;->c:Ls25;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lk25;->a:B

    iget-object v1, p0, Lk25;->c:Ls25;

    iget-object p0, p0, Lk25;->b:Liu2;

    check-cast p1, Ljava/lang/Integer;

    packed-switch v0, :pswitch_data_5a

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_1b

    iget-object p1, v1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const v0, 0x7f141058

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_2c

    :cond_1b
    iget-object v1, v1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f12001b

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v1, v2, v0, p1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_2c
    invoke-virtual {p0, p1}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_30
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_40

    iget-object p1, v1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const v0, 0x7f141043

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_55

    :cond_40
    iget-object v0, v1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const v2, 0x7f120001

    invoke-virtual {v0, v2, v1, p1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_55
    invoke-virtual {p0, p1}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_30
    .end packed-switch
.end method
