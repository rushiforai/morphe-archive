.class public final Lcom/opera/android/autofill/AddressEditorManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/autofill/AddressEditorManager$RegionsReceiver;
    }
.end annotation


# instance fields
.field public final a:Lnrl;

.field public b:Z

.field public c:J


# direct methods
.method public constructor <init>(Lhjf;)V
    .registers 5

    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/autofill/AddressEditorManager;->a:Lnrl;

    new-instance v0, Lp1;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, p1, v2}, Lp1;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {p1, v0}, Lno7;->g(Lmo7;)V

    return-void
.end method

.method public static addComponent(Ljava/util/List;ILjava/lang/String;ZZ)V
    .registers 10
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lfw;",
            ">;I",
            "Ljava/lang/String;",
            "ZZ)V"
        }
    .end annotation

    invoke-static {}, Lew;->values()[Lew;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v1, :cond_11

    aget-object v3, v0, v2

    iget-byte v4, v3, Lew;->a:B

    if-eq v4, p1, :cond_12

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_11
    const/4 v3, 0x0

    :cond_12
    if-nez v3, :cond_15

    return-void

    :cond_15
    new-instance p1, Lfw;

    invoke-direct {p1, v3, p2, p3, p4}, Lfw;-><init>(Lew;Ljava/lang/String;ZZ)V

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static callRegionsReceiver(Lcom/opera/android/autofill/AddressEditorManager$RegionsReceiver;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .registers 6
    .param p0    # Lcom/opera/android/autofill/AddressEditorManager$RegionsReceiver;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Ljava/util/HashMap;

    array-length v1, p2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    invoke-static {v0, p2, p3}, Lcom/opera/android/autofill/AddressEditorManager;->fillMap(Ljava/util/Map;[Ljava/lang/String;[Ljava/lang/String;)V

    invoke-interface {p0, p1, v0}, Lcom/opera/android/autofill/AddressEditorManager$RegionsReceiver;->a(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static fillMap(Ljava/util/Map;[Ljava/lang/String;[Ljava/lang/String;)V
    .registers 6
    .param p0    # Ljava/util/Map;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_e

    aget-object v1, p1, v0

    aget-object v2, p2, v0

    invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_e
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lbq2;)V
    .registers 7

    iget-object v0, p0, Lcom/opera/android/autofill/AddressEditorManager;->a:Lnrl;

    iget-boolean v1, v0, Lnrl;->a:Z

    if-nez v1, :cond_10

    new-instance v1, Lk3;

    const/4 v2, 0x5

    invoke-direct {v1, p0, p1, p2, v2}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void

    :cond_10
    iget-wide v0, p0, Lcom/opera/android/autofill/AddressEditorManager;->c:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_20

    if-eqz p2, :cond_1f

    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    invoke-virtual {p2, p1, p0}, Lbq2;->a(Ljava/lang/String;Ljava/util/Map;)V

    :cond_1f
    return-void

    :cond_20
    invoke-static {v0, v1, p1, p2}, LJ/N;->M9Uqsbl$(JLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
