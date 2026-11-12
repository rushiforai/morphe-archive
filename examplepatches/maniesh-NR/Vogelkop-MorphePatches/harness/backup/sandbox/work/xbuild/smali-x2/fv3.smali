.class public final synthetic Lfv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldcj;
.implements Ln5o;


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;Ljava/lang/String;)V
    .registers 3

    iput-object p1, p0, Lfv3;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lfv3;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljjm;Ljava/lang/String;)V
    .registers 4

    if-eqz p2, :cond_5e

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p1, p0, Lfv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p1

    iget-object p2, p1, Lfqe;->a:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object p2

    invoke-virtual {p2}, Lfue;->d()V

    iget-object p2, p2, Lfue;->a:Lcue;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    const/4 v0, 0x1

    if-eq p2, v0, :cond_2a

    const/4 p1, 0x0

    goto :goto_2e

    :cond_2a
    invoke-virtual {p1}, Lfqe;->c()Luqe;

    move-result-object p1

    :goto_2e
    if-eqz p1, :cond_5e

    iget-object p0, p0, Lfv3;->b:Ljava/lang/String;

    invoke-virtual {p1, p0, v0}, Luqe;->e(Ljava/lang/String;Z)Lmsh;

    move-result-object p0

    if-eqz p0, :cond_5e

    iget-object p1, p1, Luqe;->h:Luy8;

    iget-object p2, p1, Luy8;->r:Ljava/util/Set;

    iget-object v0, p0, Lmsh;->v:Lp12;

    iget-object v0, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5e

    instance-of p2, p0, Lure;

    const/4 v0, 0x2

    if-eqz p2, :cond_56

    new-instance p2, Lby8;

    invoke-direct {p2, p0, v0}, Lby8;-><init>(Lmsh;B)V

    invoke-virtual {p1, p2}, Luy8;->e(Lzx8;)V

    return-void

    :cond_56
    new-instance p2, Lby8;

    invoke-direct {p2, p0, v0}, Lby8;-><init>(Lmsh;B)V

    invoke-virtual {p1, p2}, Luy8;->c(Ldy8;)V

    :cond_5e
    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Lkotlin/Unit;

    new-instance p1, Lnhj;

    invoke-direct {p1}, Lnhj;-><init>()V

    iget-object v0, p0, Lfv3;->a:Lcom/opera/android/BrowserActivity;

    iput-object v0, p1, Lnhj;->a:Landroid/content/Context;

    const-string v1, "ariaWidgetShortcut"

    iput-object v1, p1, Lnhj;->b:Ljava/lang/String;

    iget-object p0, p0, Lfv3;->b:Ljava/lang/String;

    iput-object p0, p1, Lnhj;->e:Ljava/lang/CharSequence;

    const p0, 0x7f110006

    invoke-static {p0, v0}, Landroidx/core/graphics/drawable/IconCompat;->c(ILandroid/content/Context;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object p0

    iput-object p0, p1, Lnhj;->h:Landroidx/core/graphics/drawable/IconCompat;

    invoke-static {v0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p0

    const-string v1, "com.opera.android.action.AI_ASSISTANT_FROM_SHORTCUT_WIDGET"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    filled-new-array {p0}, [Landroid/content/Intent;

    move-result-object p0

    iput-object p0, p1, Lnhj;->c:[Landroid/content/Intent;

    iget-object p0, p1, Lnhj;->e:Ljava/lang/CharSequence;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    const/4 v1, 0x0

    if-nez p0, :cond_4f

    iget-object p0, p1, Lnhj;->c:[Landroid/content/Intent;

    if-eqz p0, :cond_49

    array-length p0, p0

    if-eqz p0, :cond_49

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v0, p0}, Lphj;->C0(Landroid/content/ContextWrapper;Ljava/util/List;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_49
    const-string p0, "Shortcut must have an intent"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1

    :cond_4f
    const-string p0, "Shortcut must have a non-empty label"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1
.end method
