.class public abstract Lk88;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lxtb;

.field public static final b:Lke6;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lk88;

    const-string v2, "esimDataDataStore"

    const-string v3, "getEsimDataDataStore(Landroid/content/Context;)Landroidx/datastore/core/DataStore;"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-array v1, v4, [Lxtb;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    sput-object v1, Lk88;->a:[Lxtb;

    sget-object v0, Lj88;->a:Lj88;

    sget-object v1, Lvml;->e:Lwjh;

    iget-object v1, v1, Lwjh;->d:Ljava/lang/Object;

    check-cast v1, Ljg8;

    invoke-static {}, Lzch;->a()Lcsk;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/coroutines/e;->a(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v1

    invoke-static {v1}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object v1

    const-string v2, "esim_data.pb"

    invoke-static {v2, v0, v1}, Luup;->n(Ljava/lang/String;Lu2j;La64;)Lke6;

    move-result-object v0

    sput-object v0, Lk88;->b:Lke6;

    return-void
.end method
