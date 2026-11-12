.class public final synthetic Lcs8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lhq8;


# direct methods
.method public synthetic constructor <init>(Lns8;Landroid/content/Context;Lhq8;B)V
    .registers 5

    iput-byte p4, p0, Lcs8;->a:B

    iput-object p2, p0, Lcs8;->b:Landroid/content/Context;

    iput-object p3, p0, Lcs8;->c:Lhq8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lcs8;->a:B

    iget-object v0, p0, Lcs8;->c:Lhq8;

    iget-object p0, p0, Lcs8;->b:Landroid/content/Context;

    packed-switch p1, :pswitch_data_72

    sget-object p1, Lp6l;->a:Lp6l;

    invoke-virtual {v0, p1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    const-string v0, "clipboard"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    if-eqz v0, :cond_39

    invoke-virtual {v0, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x21

    if-ge p1, v0, :cond_39

    const p1, 0x7f1404dd

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_39
    return-void

    :pswitch_3a
    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p1

    invoke-virtual {v0}, Lhq8;->j()Z

    move-result v1

    if-eqz v1, :cond_5a

    check-cast v0, Ltq8;

    check-cast p1, Lcom/opera/android/favorites/e;

    new-instance p0, Lrqd;

    const/4 v1, 0x6

    invoke-direct {p0, v1}, Lrqd;-><init>(B)V

    invoke-virtual {p1, v0, p0}, Lcom/opera/android/favorites/e;->j(Ltq8;Llr8;)V

    goto :goto_71

    :cond_5a
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p0

    invoke-virtual {v0}, Lhq8;->h()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lp6l;->a:Lp6l;

    invoke-virtual {v0, v1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lnr8;->b(Ljava/lang/String;Ljava/lang/String;)J

    :goto_71
    return-void

    :pswitch_data_72
    .packed-switch 0x0
        :pswitch_3a
    .end packed-switch
.end method
