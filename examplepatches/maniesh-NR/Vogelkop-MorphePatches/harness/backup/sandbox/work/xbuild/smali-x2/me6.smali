.class public abstract Lme6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lxtb;

.field public static final b:Lfdk;

.field public static final c:Lcrb;

.field public static final d:Lke6;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lme6;

    const-string v2, "ntpDataStore"

    const-string v3, "getNtpDataStore(Landroid/content/Context;)Landroidx/datastore/core/DataStore;"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-array v1, v4, [Lxtb;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    sput-object v1, Lme6;->a:[Lxtb;

    new-instance v0, Lfdk;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lfdk;-><init>(Lv3f;Lebb;)V

    sput-object v0, Lme6;->b:Lfdk;

    new-instance v0, Ltb6;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ltb6;-><init>(B)V

    sget-object v1, Lrpb;->d:Lqpb;

    invoke-static {v1, v0}, Lphj;->o(Lrpb;Lkotlin/jvm/functions/Function1;)Lcrb;

    move-result-object v0

    sput-object v0, Lme6;->c:Lcrb;

    sget-object v0, Lad6;->a:Lad6;

    sget-object v1, Lvml;->e:Lwjh;

    iget-object v1, v1, Lwjh;->d:Ljava/lang/Object;

    check-cast v1, Ljg8;

    invoke-static {}, Lzch;->a()Lcsk;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/coroutines/e;->a(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v1

    invoke-static {v1}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object v1

    const-string v2, "ntp"

    invoke-static {v2, v0, v1}, Luup;->n(Ljava/lang/String;Lu2j;La64;)Lke6;

    move-result-object v0

    sput-object v0, Lme6;->d:Lke6;

    return-void
.end method
