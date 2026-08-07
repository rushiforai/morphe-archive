.class public Ll/zrv$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zrv;->g()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ll/uxj0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/zrv;


# direct methods
.method public constructor <init>(Ll/zrv;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zrv$a;->a:Ll/zrv;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ll/uxj0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zrv$a;->a:Ll/zrv;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->d(Ll/zrv;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 7
    .line 8
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/zrv$a;->a()Ll/uxj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
