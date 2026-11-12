.class public final Lv5e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmzd;


# instance fields
.field public final a:Ljg8;

.field public final b:Landroid/content/Context;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljg8;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lv5e;->a:Ljg8;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lv5e;->b:Landroid/content/Context;

    new-instance p1, Lq4b;

    const/16 p2, 0x1a

    invoke-direct {p1, p0, p2}, Lq4b;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lv5e;->c:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lu45;)Ljava/lang/Object;
    .registers 5

    new-instance v0, Lbz1;

    const/4 v1, 0x0

    const/16 v2, 0x12

    invoke-direct {v0, v2, v1, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    iget-object p0, p0, Lv5e;->a:Ljg8;

    invoke-static {p0, v0, p1}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
