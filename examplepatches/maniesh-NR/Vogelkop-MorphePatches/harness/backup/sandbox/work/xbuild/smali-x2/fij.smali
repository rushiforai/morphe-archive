.class public final Lfij;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Lltg;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ljava/lang/String;ILltg;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfij;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lfij;->b:Ljava/lang/String;

    iput p3, p0, Lfij;->c:I

    iput-object p4, p0, Lfij;->d:Lltg;

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 5

    iget-object v0, p0, Lfij;->b:Ljava/lang/String;

    const-string v1, "DEFAULT"

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-object v0, p0, Lfij;->a:Lcom/opera/android/BrowserActivity;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {v0}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v0

    new-instance v1, Lagb;

    const/16 v2, 0x19

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method
