.class public final Llv5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lhra;

.field public final b:Ljava/util/List;


# direct methods
.method public constructor <init>(Lhra;Ljava/util/List;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llv5;->a:Lhra;

    iput-object p2, p0, Llv5;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Lqlk;)V
    .registers 7

    new-instance v0, Lcom/opera/android/browser/chromium/OperaBrowserContext;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/opera/android/browser/chromium/OperaBrowserContext;-><init>(Z)V

    iget-object v1, p0, Llv5;->a:Lhra;

    iget-object v1, v1, Lhra;->h:Ljava/lang/String;

    new-instance v2, Lz;

    invoke-direct {v2, p1}, Lz;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Llv5;->b:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_15
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_2b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v2}, Lz;->b()Lyqd;

    move-result-object v3

    iget-boolean v4, v0, Lcom/opera/android/browser/chromium/OperaBrowserContext;->a:Z

    invoke-static {v4, v1, p1, v3}, LJ/N;->MtwtLBqE(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_15

    :cond_2b
    invoke-virtual {v2}, Lz;->e()V

    return-void
.end method
