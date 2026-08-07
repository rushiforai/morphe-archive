.class public final synthetic Ll/jpr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lkotlinx/coroutines/o;


# direct methods
.method public synthetic constructor <init>(Lkotlinx/coroutines/o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jpr;->a:Lkotlinx/coroutines/o;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpr;->a:Lkotlinx/coroutines/o;

    invoke-static {p0}, Landroidx/work/ListenableFutureKt;->e(Lkotlinx/coroutines/o;)V

    return-void
.end method
