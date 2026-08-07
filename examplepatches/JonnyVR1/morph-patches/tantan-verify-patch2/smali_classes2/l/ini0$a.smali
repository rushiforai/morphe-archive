.class Ll/ini0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u26;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ini0;->f(Ll/u26;Ljava/util/concurrent/Executor;Ll/hg4;)Ll/ini0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/u26<",
        "TTResult;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ll/tni0;

.field final synthetic b:Ll/u26;

.field final synthetic c:Ljava/util/concurrent/Executor;

.field final synthetic d:Ll/ini0;


# direct methods
.method public constructor <init>(Ll/ini0;Ll/tni0;Ll/u26;Ljava/util/concurrent/Executor;Ll/hg4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ini0$a;->d:Ll/ini0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ini0$a;->a:Ll/tni0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/ini0$a;->b:Ll/u26;

    .line 6
    .line 7
    iput-object p4, p0, Ll/ini0$a;->c:Ljava/util/concurrent/Executor;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/ini0;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/ini0$a;->b(Ll/ini0;)Ljava/lang/Void;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/ini0;)Ljava/lang/Void;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ini0<",
            "TTResult;>;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ini0$a;->a:Ll/tni0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ini0$a;->b:Ll/u26;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ini0$a;->c:Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v0, v1, p1, p0, v2}, Ll/ini0;->a(Ll/tni0;Ll/u26;Ll/ini0;Ljava/util/concurrent/Executor;Ll/hg4;)V

    .line 9
    .line 10
    .line 11
    return-object v2
.end method
