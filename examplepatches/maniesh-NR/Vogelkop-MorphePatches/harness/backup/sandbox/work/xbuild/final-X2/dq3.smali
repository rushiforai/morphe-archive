.class public abstract Ldq3;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/ArrayList;

.field public static final b:Ljava/util/Set;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    sget-object v0, Lpc;->C:Lh58;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lw4;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3}, Lw4;-><init>(Ljava/lang/Object;B)V

    :cond_10
    :goto_10
    invoke-virtual {v2}, Lw4;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-virtual {v2}, Lw4;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lpc;

    iget-boolean v3, v3, Lpc;->b:Z

    if-eqz v3, :cond_10

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_10

    :cond_25
    sput-object v1, Ldq3;->a:Ljava/util/ArrayList;

    sget-object v0, Lpc;->k:Lpc;

    sget-object v1, Lpc;->l:Lpc;

    filled-new-array {v0, v1}, [Lpc;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Ldq3;->b:Ljava/util/Set;

    return-void
.end method

.method public static a(Lfw3;)Ljava/util/List;
    .registers 5

    sget-object v0, Lpc;->d:Lpc;

    sget-object v1, Lpc;->f:Lpc;

    iget-object p0, p0, Lfw3;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyk6;

    iget-object p0, p0, Lyk6;->u:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_21

    sget-object p0, Lpc;->w:Lpc;

    goto :goto_23

    :cond_21
    sget-object p0, Lpc;->i:Lpc;

    :goto_23
    sget-object v2, Lpc;->k:Lpc;

    sget-object v3, Lpc;->l:Lpc;

    filled-new-array {v0, v1, p0, v2, v3}, [Lpc;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
