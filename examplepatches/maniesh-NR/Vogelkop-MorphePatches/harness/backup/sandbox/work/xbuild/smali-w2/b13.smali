.class public final Lb13;
.super Lq37;
.source "SourceFile"


# instance fields
.field public final c:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 4

    const/4 v0, 0x0

    new-array v0, v0, [I

    const/16 v1, 0xc

    invoke-direct {p0, v1, v0}, Lq37;-><init>(I[I)V

    iput-boolean p1, p0, Lb13;->c:Z

    return-void
.end method


# virtual methods
.method public final a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V
    .registers 8

    iget-boolean v0, p0, Lb13;->c:Z

    if-eqz v0, :cond_12

    if-eqz p3, :cond_12

    new-instance p0, Lfva;

    const-string p1, "Invalid deep link source: "

    invoke-static {p3, p1}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_12
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->l1:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfjn;

    invoke-virtual {v0}, Lfjn;->a()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-super/range {p0 .. p6}, Lq37;->a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V

    return-void

    :cond_2e
    new-instance p0, Lfva;

    const-string p1, "Not supported"

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;
    .registers 4

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->l1:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfjn;

    invoke-virtual {p0}, Lfjn;->a()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
