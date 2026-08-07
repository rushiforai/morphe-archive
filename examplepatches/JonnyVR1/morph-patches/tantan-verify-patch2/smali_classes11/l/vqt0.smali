.class public final synthetic Ll/vqt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xqt0;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/xqt0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vqt0;->a:Ll/xqt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vqt0;->b:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    sget-object v0, Ll/oct0;->e:Ll/xvw0;

    .line 2
    .line 3
    new-instance v1, Ll/wqt0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/vqt0;->a:Ll/xqt0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/vqt0;->b:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-direct {v1, v2, p0}, Ll/wqt0;-><init>(Ll/xqt0;Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
