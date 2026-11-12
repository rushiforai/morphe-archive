.class public final Lcom/opera/android/account/push/AccountPushManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public final a:Lkze;

.field public final b:Le3j;

.field public final c:Landroid/util/SparseArray;

.field public d:J


# direct methods
.method public constructor <init>(Le3j;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lkze;

    sget-object v1, Lsb;->a:Lsb;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/opera/android/account/push/AccountPushManager;->a:Lkze;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/opera/android/account/push/AccountPushManager;->c:Landroid/util/SparseArray;

    iput-object p1, p0, Lcom/opera/android/account/push/AccountPushManager;->b:Le3j;

    new-instance p1, Lc4;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lc4;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lcak;->d:Lavj;

    const/4 p0, 0x1

    invoke-static {p0, p1}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final a(I)Lode;
    .registers 8

    iget-object v0, p0, Lcom/opera/android/account/push/AccountPushManager;->c:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v1

    if-gez v1, :cond_2a

    new-instance v1, Lode;

    invoke-direct {v1}, Lekc;-><init>()V

    iget-wide v2, p0, Lcom/opera/android/account/push/AccountPushManager;->d:J

    const-wide/16 v4, 0x0

    cmp-long p0, v2, v4

    if-eqz p0, :cond_26

    cmp-long p0, v2, v4

    if-nez p0, :cond_1b

    const/4 p0, 0x0

    goto :goto_1f

    :cond_1b
    invoke-static {v2, v3, p1}, LJ/N;->M8mBEqh7(JI)Z

    move-result p0

    :goto_1f
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v1, p0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_26
    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-object v1

    :cond_2a
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lode;

    return-object p0
.end method

.method public final o(Z)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/account/push/AccountPushManager;->b:Le3j;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    const/16 p1, 0x1d

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    if-nez p0, :cond_14

    const-string p0, ""

    goto :goto_18

    :cond_14
    iget-object p0, p0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast p0, Ljava/lang/String;

    :goto_18
    sget-object p1, Lcak;->d:Lavj;

    const/4 p1, 0x1

    invoke-static {p1}, Lavj;->b(I)Z

    move-result p1

    if-nez p1, :cond_22

    return-void

    :cond_22
    invoke-static {p0}, LJ/N;->Mk$Aqih3(Ljava/lang/Object;)V

    return-void
.end method

.method public final onDestroyed()V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/account/push/AccountPushManager;->b:Le3j;

    invoke-virtual {v0, p0}, Lno7;->p(Lmo7;)V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/opera/android/account/push/AccountPushManager;->d:J

    iget-object p0, p0, Lcom/opera/android/account/push/AccountPushManager;->a:Lkze;

    sget-object v0, Lsb;->c:Lsb;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final onSenderRegistrationStateChanged(IZ)V
    .registers 3

    invoke-virtual {p0, p1}, Lcom/opera/android/account/push/AccountPushManager;->a(I)Lode;

    move-result-object p0

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
