.class public final Ll/zii$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zii$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zii;->i(Ljava/lang/String;Ljava/lang/String;)Ljava/io/OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "l/zii$i",
        "Ll/zii$g;",
        "",
        "onClose",
        "()V",
        "facebook-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ll/zii;

.field public final synthetic c:Ljava/io/File;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLl/zii;Ljava/io/File;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/zii$i;->a:J

    .line 2
    .line 3
    iput-object p3, p0, Ll/zii$i;->b:Ll/zii;

    .line 4
    .line 5
    iput-object p4, p0, Ll/zii$i;->c:Ljava/io/File;

    .line 6
    .line 7
    iput-object p5, p0, Ll/zii$i;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onClose()V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/zii$i;->a:J

    .line 2
    .line 3
    iget-object v2, p0, Ll/zii$i;->b:Ll/zii;

    .line 4
    .line 5
    invoke-static {v2}, Ll/zii;->c(Ll/zii;)Ljava/util/concurrent/atomic/AtomicLong;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-gez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/zii$i;->c:Ljava/io/File;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Ll/zii$i;->b:Ll/zii;

    .line 24
    .line 25
    iget-object v1, p0, Ll/zii$i;->d:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p0, p0, Ll/zii$i;->c:Ljava/io/File;

    .line 28
    .line 29
    invoke-static {v0, v1, p0}, Ll/zii;->e(Ll/zii;Ljava/lang/String;Ljava/io/File;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
