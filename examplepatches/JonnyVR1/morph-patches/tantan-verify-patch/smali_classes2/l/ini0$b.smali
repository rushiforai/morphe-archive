.class final Ll/ini0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ini0;->d(Ll/tni0;Ll/u26;Ll/ini0;Ljava/util/concurrent/Executor;Ll/hg4;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/tni0;

.field final synthetic b:Ll/u26;

.field final synthetic c:Ll/ini0;


# direct methods
.method public constructor <init>(Ll/hg4;Ll/tni0;Ll/u26;Ll/ini0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/ini0$b;->a:Ll/tni0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/ini0$b;->b:Ll/u26;

    .line 4
    .line 5
    iput-object p4, p0, Ll/ini0$b;->c:Ll/ini0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ini0$b;->b:Ll/u26;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ini0$b;->c:Ll/ini0;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ll/u26;->a(Ll/ini0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/ini0$b;->a:Ll/tni0;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ll/tni0;->d(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception v0

    .line 16
    iget-object p0, p0, Ll/ini0$b;->a:Ll/tni0;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/tni0;->c(Ljava/lang/Exception;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_1
    iget-object p0, p0, Ll/ini0$b;->a:Ll/tni0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/tni0;->b()V

    .line 25
    .line 26
    .line 27
    :goto_0
    return-void
.end method
