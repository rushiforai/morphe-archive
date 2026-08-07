.class public final Ll/tpg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gkg0;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/pvg0;


# direct methods
.method public constructor <init>(Ll/pvg0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tpg0;->b:Ll/pvg0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/tpg0;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "processor onCompleted mgId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/tpg0;->b:Ll/pvg0;

    .line 9
    .line 10
    iget-object v1, v1, Ll/pvg0;->a:Ll/sgg0;

    .line 11
    .line 12
    iget-wide v1, v1, Ll/sgg0;->b:J

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "SudDownloadTask"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ll/rmg0;

    .line 27
    .line 28
    invoke-direct {v0, p0, p1}, Ll/rmg0;-><init>(Ll/tpg0;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
