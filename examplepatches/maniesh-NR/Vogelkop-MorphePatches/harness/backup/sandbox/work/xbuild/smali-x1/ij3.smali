.class public final Lij3;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lech;

.field public final b:Lcj3;

.field public final c:Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;

.field public final d:Lf9d;

.field public final e:Lzyk;

.field public final f:Lkze;

.field public final g:Ljava/util/LinkedHashSet;

.field public final h:Lej3;


# direct methods
.method public constructor <init>(Lech;Lcj3;Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;Lf9d;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lij3;->a:Lech;

    iput-object p2, p0, Lij3;->b:Lcj3;

    iput-object p3, p0, Lij3;->c:Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;

    iput-object p4, p0, Lij3;->d:Lf9d;

    new-instance p1, Loc2;

    const/16 p2, 0xc

    invoke-direct {p1, p0, p2}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lij3;->e:Lzyk;

    new-instance p1, Lkze;

    new-instance p2, Lzie;

    sget-object p3, Ll08;->a:Ll08;

    invoke-direct {p2, p3, p3, p3, p3}, Lzie;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lij3;->f:Lkze;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lij3;->g:Ljava/util/LinkedHashSet;

    new-instance p1, Lej3;

    invoke-direct {p1, p0}, Lej3;-><init>(Lij3;)V

    iput-object p1, p0, Lij3;->h:Lej3;

    return-void
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 7

    iget-object v0, p0, Lij3;->h:Lej3;

    iget-object v1, p0, Lij3;->c:Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;

    iget-object v1, v1, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->c:Li7f;

    invoke-virtual {v1, v0}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object v0, p0, Lij3;->a:Lech;

    iget-object v0, v0, Lech;->b:Lxg;

    new-instance v1, Lfj3;

    invoke-direct {v1, p0}, Lfj3;-><init>(Lij3;)V

    new-instance v2, Lvme;

    const/16 v3, 0x13

    invoke-direct {v2, v3}, Lvme;-><init>(B)V

    invoke-static {v0, p1, v1, v2}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object v0, p0, Lij3;->b:Lcj3;

    iget-object v1, v0, Lcj3;->d:Ljze;

    new-instance v2, Lgj3;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lgj3;-><init>(Lij3;B)V

    new-instance v3, Lug;

    const/16 v4, 0xc

    invoke-direct {v3, v2, v4}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p1, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, v0, Lcj3;->e:Lkze;

    new-instance v1, Lgj3;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lgj3;-><init>(Lij3;B)V

    new-instance v2, Lug;

    invoke-direct {v2, v1, v4}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p1, v2}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, p0, Lij3;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lize;

    new-instance v1, Lgj3;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lgj3;-><init>(Lij3;B)V

    new-instance p0, Lug;

    invoke-direct {p0, v1, v4}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lij3;->h:Lej3;

    iget-object p0, p0, Lij3;->c:Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;

    iget-object p0, p0, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->c:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method
