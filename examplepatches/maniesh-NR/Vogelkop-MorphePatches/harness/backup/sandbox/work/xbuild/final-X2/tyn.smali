.class public final Ltyn;
.super Liz4;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/LinkedHashMap;

.field public b:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public c:Lrpf;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Ltyn;->a:Ljava/util/LinkedHashMap;

    iput-object p1, p0, Ltyn;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1, p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    return-void
.end method


# virtual methods
.method public final M()V
    .registers 6

    iget-object v0, p0, Ltyn;->c:Lrpf;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lrpf;->a()V

    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Ltyn;->c:Lrpf;

    iget-object v1, p0, Ltyn;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_16
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcej;

    sget-object v4, Lhjm;->b:Lhjm;

    invoke-virtual {v3, v4}, Lcej;->finish(Lhjm;)V

    goto :goto_16

    :cond_28
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->clear()V

    iget-object v1, p0, Ltyn;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v1, :cond_32

    invoke-virtual {v1, p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->y(Liz4;)V

    :cond_32
    iput-object v0, p0, Ltyn;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    return-void
.end method

.method public final j(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2

    invoke-virtual {p0}, Ltyn;->M()V

    return-void
.end method
