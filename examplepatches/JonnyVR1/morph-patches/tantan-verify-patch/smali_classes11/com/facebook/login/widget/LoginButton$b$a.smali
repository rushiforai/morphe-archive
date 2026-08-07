.class public Lcom/facebook/login/widget/LoginButton$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/login/widget/LoginButton$b;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/facebook/internal/d;

.field public final synthetic b:Lcom/facebook/login/widget/LoginButton$b;


# direct methods
.method public constructor <init>(Lcom/facebook/login/widget/LoginButton$b;Lcom/facebook/internal/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/login/widget/LoginButton$b$a;->b:Lcom/facebook/login/widget/LoginButton$b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/facebook/login/widget/LoginButton$b$a;->a:Lcom/facebook/internal/d;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/ztb;->d(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/facebook/login/widget/LoginButton$b$a;->b:Lcom/facebook/login/widget/LoginButton$b;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/facebook/login/widget/LoginButton$b;->b:Lcom/facebook/login/widget/LoginButton;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/facebook/login/widget/LoginButton$b$a;->a:Lcom/facebook/internal/d;

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/facebook/login/widget/LoginButton;->m(Lcom/facebook/login/widget/LoginButton;Lcom/facebook/internal/d;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    invoke-static {v0, p0}, Ll/ztb;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
