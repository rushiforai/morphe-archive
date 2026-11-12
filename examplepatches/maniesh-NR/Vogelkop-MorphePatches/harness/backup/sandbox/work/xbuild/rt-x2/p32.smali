.class public final Lp32;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbag;


# instance fields
.field public final synthetic a:Lq32;

.field public final synthetic b:Ljava/io/File;

.field public final synthetic c:Lcom/opera/api/Callback;


# direct methods
.method public constructor <init>(Lq32;Ljava/io/File;Lcom/opera/api/Callback;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp32;->a:Lq32;

    iput-object p2, p0, Lp32;->b:Ljava/io/File;

    iput-object p3, p0, Lp32;->c:Lcom/opera/api/Callback;

    return-void
.end method


# virtual methods
.method public final s()V
    .registers 2

    iget-object p0, p0, Lp32;->c:Lcom/opera/api/Callback;

    sget-object v0, Lm32;->a:Lm32;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final t()V
    .registers 4

    new-instance v0, Ln32;

    const/4 v1, 0x1

    iget-object v2, p0, Lp32;->c:Lcom/opera/api/Callback;

    invoke-direct {v0, v2, v1}, Ln32;-><init>(Lcom/opera/api/Callback;B)V

    iget-object v1, p0, Lp32;->a:Lq32;

    iget-object p0, p0, Lp32;->b:Ljava/io/File;

    invoke-virtual {v1, p0, v0}, Lq32;->b(Ljava/io/File;Ljava/lang/Runnable;)V

    return-void
.end method
