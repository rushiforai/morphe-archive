.class public final Lblk;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final a:Lode;

.field public final b:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lode;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lblk;->a:Lode;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lblk;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 2

    iget-object p1, p0, Lblk;->a:Lode;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Lh0d;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    sget-object v0, Ld59;->f:Ld59;

    iget-object p0, p0, Lblk;->b:Landroid/content/Context;

    if-eqz p1, :cond_26

    const/4 v1, 0x1

    if-eq p1, v1, :cond_26

    const/4 v2, 0x2

    if-ne p1, v2, :cond_22

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Le59;->c(Ld59;Z)V

    return-void

    :cond_22
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_26
    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Le59;->c(Ld59;Z)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lblk;->a:Lode;

    invoke-virtual {p1, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method
