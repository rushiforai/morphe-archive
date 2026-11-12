.class public final synthetic Luy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lysd;


# instance fields
.field public final synthetic a:Lwy;


# direct methods
.method public synthetic constructor <init>(Lwy;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luy;->a:Lwy;

    return-void
.end method


# virtual methods
.method public final l(I)V
    .registers 5

    iget-object p0, p0, Luy;->a:Lwy;

    iget-object v0, p0, Lwy;->q:Lw7h;

    iget-object v1, p0, Lwy;->h:Li3j;

    const/4 v2, 0x3

    invoke-static {p1, v2}, Lj7c;->a(II)Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Li3j;->m()V

    :cond_10
    const/4 v2, 0x2

    invoke-static {p1, v2}, Lj7c;->a(II)Z

    move-result v2

    if-eqz v2, :cond_21

    iget-object v2, v0, Lw7h;->g:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    iget-object v2, v0, Lw7h;->h:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    :cond_21
    const/4 v2, 0x1

    invoke-static {p1, v2}, Lj7c;->a(II)Z

    move-result p1

    if-eqz p1, :cond_71

    iget-object p0, p0, Lwy;->f:Lzy9;

    invoke-virtual {p0}, Lzy9;->I()V

    iget-object p0, v0, Lw7h;->g:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_37
    :goto_37
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_37

    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    goto :goto_37

    :cond_4d
    iget-object p0, v0, Lw7h;->h:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_57
    :goto_57
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_6d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_57

    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    goto :goto_57

    :cond_6d
    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Li3j;->q(Z)V

    :cond_71
    return-void
.end method
