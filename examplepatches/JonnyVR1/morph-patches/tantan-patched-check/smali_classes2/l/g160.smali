.class public final synthetic Ll/g160;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/concurrent/futures/CallbackToFutureAdapter$b;


# instance fields
.field public final synthetic a:Ljava/util/concurrent/Executor;

.field public final synthetic b:Ll/tej0;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lkotlin/jvm/functions/Function0;

.field public final synthetic e:Ll/s120;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/Executor;Ll/tej0;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Ll/s120;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g160;->a:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Ll/g160;->b:Ll/tej0;

    iput-object p3, p0, Ll/g160;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/g160;->d:Lkotlin/jvm/functions/Function0;

    iput-object p5, p0, Ll/g160;->e:Ll/s120;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/concurrent/futures/CallbackToFutureAdapter$a;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/g160;->a:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Ll/g160;->b:Ll/tej0;

    iget-object v2, p0, Ll/g160;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/g160;->d:Lkotlin/jvm/functions/Function0;

    iget-object v4, p0, Ll/g160;->e:Ll/s120;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Landroidx/work/OperationKt;->a(Ljava/util/concurrent/Executor;Ll/tej0;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Ll/s120;Landroidx/concurrent/futures/CallbackToFutureAdapter$a;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
