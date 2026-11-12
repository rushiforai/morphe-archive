.class public final Leac;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final a:Lr9c;

.field public final b:Lk6l;

.field public final c:Ldu3;

.field public final d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Lr9c;Lk6l;Ldu3;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leac;->a:Lr9c;

    iput-object p2, p0, Leac;->b:Lk6l;

    iput-object p3, p0, Leac;->c:Ldu3;

    iget-boolean p1, p1, Lr9c;->a:Z

    iput-boolean p1, p0, Leac;->d:Z

    if-eqz p1, :cond_12

    invoke-virtual {p2, p0}, Lk6l;->a(La2l;)Lf6l;

    :cond_12
    return-void
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->n0()Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Leac;->X()V

    :cond_b
    return-void
.end method

.method public final G(Lb2l;)V
    .registers 2

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->n0()Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Leac;->X()V

    :cond_b
    return-void
.end method

.method public final W(Landroid/content/Intent;)V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Leac;->e:Z

    if-eqz p1, :cond_17

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_17

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.intent.action.MAIN"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_45

    :cond_17
    iget-boolean p1, p0, Leac;->d:Z

    if-eqz p1, :cond_45

    iget-object p1, p0, Leac;->b:Lk6l;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_45

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->n0()Z

    move-result p1

    if-eqz p1, :cond_2d

    invoke-virtual {p0}, Leac;->X()V

    return-void

    :cond_2d
    iget-object p1, p0, Leac;->c:Ldu3;

    invoke-virtual {p1}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_45

    iget-object p0, p0, Leac;->a:Lr9c;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "User resumed app on web page"

    invoke-static {p0}, Lcom/leanplum/Leanplum;->trackLocal(Ljava/lang/String;)V

    :cond_45
    return-void
.end method

.method public final X()V
    .registers 2

    iget-boolean v0, p0, Leac;->e:Z

    if-eqz v0, :cond_1c

    iget-object v0, p0, Leac;->c:Ldu3;

    invoke-virtual {v0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Leac;->a:Lr9c;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "User entered start page"

    invoke-static {p0}, Lcom/leanplum/Leanplum;->trackLocal(Ljava/lang/String;)V

    :cond_1c
    return-void
.end method
