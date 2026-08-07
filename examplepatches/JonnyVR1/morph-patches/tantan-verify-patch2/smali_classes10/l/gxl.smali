.class public abstract Ll/gxl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l4f$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/gxl$g;,
        Ll/gxl$j;,
        Ll/gxl$h;,
        Ll/gxl$a;,
        Ll/gxl$b;,
        Ll/gxl$c;,
        Ll/gxl$f;,
        Ll/gxl$d;,
        Ll/gxl$e;,
        Ll/gxl$i;
    }
.end annotation


# instance fields
.field public a:Ll/l4f;

.field public b:I

.field public c:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ljava/lang/Throwable;


# direct methods
.method public varargs constructor <init>(Ll/l4f;ILcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;[Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gxl;->a:Ll/l4f;

    .line 5
    .line 6
    iput p2, p0, Ll/gxl;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/gxl;->c:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 9
    .line 10
    array-length p1, p4

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    aget-object p1, p4, p1

    .line 15
    .line 16
    iput-object p1, p0, Ll/gxl;->d:Ljava/lang/Throwable;

    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gxl;->a:Ll/l4f;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/l4f;->b(Ll/l4f$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gxl;->c:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/gxl;->f()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/gxl;->c:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 6
    .line 7
    const-string v2, ","

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/gxl;->c:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 23
    .line 24
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;->a()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :cond_0
    iget-object v1, p0, Ll/gxl;->d:Ljava/lang/Throwable;

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/gxl;->d:Ljava/lang/Throwable;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_1
    return-object v0
.end method

.method public d()Ljava/lang/Throwable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gxl;->d:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/gxl;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public f()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Ll/gxl;->b:I

    .line 2
    .line 3
    const/16 v0, 0xc

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/16 v0, 0xd

    .line 8
    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    packed-switch p0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    const-string p0, "NA"

    .line 15
    .line 16
    return-object p0

    .line 17
    :pswitch_0
    const-string p0, "AuthError"

    .line 18
    .line 19
    return-object p0

    .line 20
    :pswitch_1
    const-string p0, "AuthSuccess"

    .line 21
    .line 22
    return-object p0

    .line 23
    :pswitch_2
    const-string p0, "Disconnected"

    .line 24
    .line 25
    return-object p0

    .line 26
    :pswitch_3
    const-string p0, "ConnectError"

    .line 27
    .line 28
    return-object p0

    .line 29
    :pswitch_4
    const-string p0, "Connected"

    .line 30
    .line 31
    return-object p0

    .line 32
    :pswitch_5
    const-string p0, "Connecting"

    .line 33
    .line 34
    return-object p0

    .line 35
    :pswitch_6
    const-string p0, "Idle"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    const-string p0, "KeepAliveError"

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_1
    const-string p0, "IOError"

    .line 42
    .line 43
    return-object p0

    .line 44
    nop

    .line 45
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
