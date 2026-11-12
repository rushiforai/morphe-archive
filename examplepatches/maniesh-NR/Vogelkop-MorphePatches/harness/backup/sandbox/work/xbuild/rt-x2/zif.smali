.class public final synthetic Lzif;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/autofill/OperaAutofillService;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/autofill/OperaAutofillService;B)V
    .registers 3

    iput-byte p2, p0, Lzif;->a:B

    iput-object p1, p0, Lzif;->b:Lcom/opera/android/autofill/OperaAutofillService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lzif;->a:B

    iget-object p0, p0, Lzif;->b:Lcom/opera/android/autofill/OperaAutofillService;

    packed-switch v0, :pswitch_data_1c

    sget v0, Lcom/opera/android/autofill/OperaAutofillService;->d:I

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    return-object p0

    :pswitch_12
    sget v0, Lcom/opera/android/autofill/OperaAutofillService;->d:I

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lxu2;

    return-object p0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
