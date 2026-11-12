.class public final Lyu4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lhw3;

.field public final b:La64;

.field public final c:La64;

.field public final d:Lb59;

.field public e:Lmfj;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lhw3;Ldx5;Ljg8;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lyu4;->a:Lhw3;

    invoke-static {p4}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object p3

    iput-object p3, p0, Lyu4;->b:La64;

    invoke-static {p5}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object p3

    iput-object p3, p0, Lyu4;->c:La64;

    const/4 p3, 0x0

    new-array p3, p3, [Lbg1;

    const-string p4, "ai-chat-suggestion"

    invoke-static {p1, p2, p4, p3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lyu4;->d:Lb59;

    return-void
.end method
