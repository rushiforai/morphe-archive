.class public final synthetic Leu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/BooleanSupplier;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Leu3;->a:B

    iput-object p1, p0, Leu3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getAsBoolean()Z
    .registers 5

    iget-byte v0, p0, Leu3;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Leu3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_50

    check-cast p0, Ldbl;

    invoke-virtual {p0}, Ldbl;->t()Z

    move-result p0

    return p0

    :pswitch_10
    check-cast p0, Lmrk;

    iget-object p0, p0, Lmrk;->i:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_20

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result v2

    :cond_20
    return v2

    :pswitch_21
    check-cast p0, Lkwf;

    iget-object p0, p0, Lkwf;->n:Lswf;

    sget-object v0, Lqwf;->c:Lqwf;

    iget-object p0, p0, Lswf;->f:Ljava/util/HashSet;

    invoke-virtual {p0, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v1

    return p0

    :pswitch_2f
    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object v0

    sget-object v3, Le7j;->c:Le7j;

    if-eq v0, v3, :cond_4e

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    const/16 v0, 0x258

    if-lt p0, v0, :cond_4e

    move v1, v2

    :cond_4e
    return v1

    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_21
        :pswitch_10
    .end packed-switch
.end method
