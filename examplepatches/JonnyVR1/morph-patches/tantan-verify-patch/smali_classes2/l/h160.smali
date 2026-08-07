.class public final synthetic Ll/h160;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tej0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lkotlin/jvm/functions/Function0;

.field public final synthetic d:Ll/s120;

.field public final synthetic e:Landroidx/concurrent/futures/CallbackToFutureAdapter$a;


# direct methods
.method public synthetic constructor <init>(Ll/tej0;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Ll/s120;Landroidx/concurrent/futures/CallbackToFutureAdapter$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h160;->a:Ll/tej0;

    iput-object p2, p0, Ll/h160;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/h160;->c:Lkotlin/jvm/functions/Function0;

    iput-object p4, p0, Ll/h160;->d:Ll/s120;

    iput-object p5, p0, Ll/h160;->e:Landroidx/concurrent/futures/CallbackToFutureAdapter$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h160;->a:Ll/tej0;

    iget-object v1, p0, Ll/h160;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/h160;->c:Lkotlin/jvm/functions/Function0;

    iget-object v3, p0, Ll/h160;->d:Ll/s120;

    iget-object p0, p0, Ll/h160;->e:Landroidx/concurrent/futures/CallbackToFutureAdapter$a;

    invoke-static {v0, v1, v2, v3, p0}, Landroidx/work/OperationKt;->b(Ll/tej0;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Ll/s120;Landroidx/concurrent/futures/CallbackToFutureAdapter$a;)V

    return-void
.end method
