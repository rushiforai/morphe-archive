.class public final Lyu2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lyhe;

.field public final b:Z


# direct methods
.method public constructor <init>(Lhjf;)V
    .registers 3

    new-instance v0, Lyhe;

    invoke-direct {v0, p1}, Lyhe;-><init>(Lhjf;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lyu2;->a:Lyhe;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v0, "android.software.autofill"

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lyu2;->b:Z

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 3

    invoke-virtual {p0}, Lyu2;->b()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_18

    iget-object p0, p0, Lyu2;->a:Lyhe;

    :try_start_9
    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/autofill/AutofillManager;

    if-eqz p0, :cond_14

    invoke-virtual {p0}, Landroid/view/autofill/AutofillManager;->hasEnabledAutofillServices()Z

    move-result p0
    :try_end_13
    .catchall {:try_start_9 .. :try_end_13} :catchall_14

    goto :goto_15

    :catchall_14
    :cond_14
    move p0, v1

    :goto_15
    if-eqz p0, :cond_18

    const/4 v1, 0x1

    :cond_18
    return v1
.end method

.method public final b()Z
    .registers 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    const/4 v2, 0x0

    if-lt v0, v1, :cond_1c

    iget-boolean v0, p0, Lyu2;->b:Z

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lyu2;->a:Lyhe;

    :try_start_d
    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/autofill/AutofillManager;

    if-eqz p0, :cond_18

    invoke-virtual {p0}, Landroid/view/autofill/AutofillManager;->isAutofillSupported()Z

    move-result p0
    :try_end_17
    .catchall {:try_start_d .. :try_end_17} :catchall_18

    goto :goto_19

    :catchall_18
    :cond_18
    move p0, v2

    :goto_19
    if-eqz p0, :cond_1c

    const/4 v2, 0x1

    :cond_1c
    return v2
.end method
