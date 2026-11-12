.class public final synthetic Lewd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lfwd;


# direct methods
.method public synthetic constructor <init>(Lfwd;B)V
    .registers 3

    iput-byte p2, p0, Lewd;->a:B

    iput-object p1, p0, Lewd;->b:Lfwd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-byte v0, p0, Lewd;->a:B

    iget-object p0, p0, Lewd;->b:Lfwd;

    packed-switch v0, :pswitch_data_46

    new-instance v0, Lghf;

    iget-object v1, p0, Ldwd;->d:Lhb9;

    check-cast v1, Lkb9;

    iget-object v1, v1, Lkb9;->e:Ljava/lang/String;

    new-instance v2, Li4d;

    new-instance v3, Lu5f;

    const/16 v4, 0xb

    invoke-direct {v3, v1, v4}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-direct {v2, v3}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-direct {v0, v2}, Lghf;-><init>(Li4d;)V

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    return-void

    :pswitch_28
    iget-object v0, p0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "clipboard"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    if-eqz v0, :cond_45

    iget-object p0, p0, Ldwd;->d:Lhb9;

    check-cast p0, Lkb9;

    iget-object p0, p0, Lkb9;->e:Ljava/lang/String;

    invoke-static {p0, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    :cond_45
    return-void

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_28
    .end packed-switch
.end method
