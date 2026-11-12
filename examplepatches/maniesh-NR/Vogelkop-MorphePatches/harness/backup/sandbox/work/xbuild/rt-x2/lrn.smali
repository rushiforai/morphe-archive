.class public final Llrn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public final synthetic a:Lmrn;

.field public final synthetic b:Lrn9;


# direct methods
.method public constructor <init>(Lmrn;Lrn9;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llrn;->a:Lmrn;

    iput-object p2, p0, Llrn;->b:Lrn9;

    return-void
.end method


# virtual methods
.method public final b(Lhjm;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    iget-object p0, p0, Llrn;->b:Lrn9;

    if-eqz p1, :cond_15

    const/4 v0, 0x1

    if-ne p1, v0, :cond_11

    sget-object p1, Lkf0;->e:Lkf0;

    invoke-virtual {p0, p1}, Lrn9;->J(Lkf0;)V

    return-void

    :cond_11
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_15
    sget-object p1, Lkf0;->b:Lkf0;

    invoke-virtual {p0, p1}, Lrn9;->J(Lkf0;)V

    return-void
.end method

.method public final d()V
    .registers 2

    iget-object p0, p0, Llrn;->b:Lrn9;

    sget-object v0, Lkf0;->d:Lkf0;

    invoke-virtual {p0, v0}, Lrn9;->J(Lkf0;)V

    return-void
.end method

.method public final g(Llz3;)V
    .registers 3

    iget-object p0, p0, Llrn;->a:Lmrn;

    iget-object p0, p0, Lmrn;->a:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljbn;

    iget-object p0, p0, Ljbn;->d:Lumk;

    iget-object p0, p0, Lumk;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "hintShown"

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    return-void
.end method
