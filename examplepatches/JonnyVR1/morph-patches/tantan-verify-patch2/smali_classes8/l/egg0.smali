.class public final Ll/egg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ltech/sud/gip/core/GameInfo;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/hhg0;


# direct methods
.method public constructor <init>(Ll/hhg0;ILtech/sud/gip/core/GameInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/egg0;->d:Ll/hhg0;

    .line 2
    .line 3
    iput p2, p0, Ll/egg0;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/egg0;->b:Ltech/sud/gip/core/GameInfo;

    .line 6
    .line 7
    iput-object p4, p0, Ll/egg0;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/egg0;->d:Ll/hhg0;

    .line 2
    .line 3
    iget v1, p0, Ll/egg0;->a:I

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-object v1, v0, Ll/hhg0;->f:Ll/uyg0;

    .line 8
    .line 9
    iget-wide v2, v0, Ll/hhg0;->a:J

    .line 10
    .line 11
    iget-object v0, p0, Ll/egg0;->b:Ltech/sud/gip/core/GameInfo;

    .line 12
    .line 13
    iget-object v1, v1, Ll/uyg0;->o:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/egg0;->d:Ll/hhg0;

    .line 23
    .line 24
    iget-object v0, v0, Ll/hhg0;->e:Ltech/sud/gip/core/ISudListenerGetMGInfo;

    .line 25
    .line 26
    iget-object p0, p0, Ll/egg0;->b:Ltech/sud/gip/core/GameInfo;

    .line 27
    .line 28
    invoke-interface {v0, p0}, Ltech/sud/gip/core/ISudListenerGetMGInfo;->onSuccess(Ltech/sud/gip/core/GameInfo;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object v1, v0, Ll/hhg0;->f:Ll/uyg0;

    .line 33
    .line 34
    iget-wide v2, v0, Ll/hhg0;->a:J

    .line 35
    .line 36
    iget-object v0, v1, Ll/uyg0;->o:Ljava/util/HashMap;

    .line 37
    .line 38
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ltech/sud/gip/core/GameInfo;

    .line 47
    .line 48
    iget-object v1, p0, Ll/egg0;->d:Ll/hhg0;

    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object p0, v1, Ll/hhg0;->e:Ltech/sud/gip/core/ISudListenerGetMGInfo;

    .line 53
    .line 54
    invoke-interface {p0, v0}, Ltech/sud/gip/core/ISudListenerGetMGInfo;->onSuccess(Ltech/sud/gip/core/GameInfo;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    iget-object v0, v1, Ll/hhg0;->e:Ltech/sud/gip/core/ISudListenerGetMGInfo;

    .line 59
    .line 60
    iget v1, p0, Ll/egg0;->a:I

    .line 61
    .line 62
    iget-object p0, p0, Ll/egg0;->c:Ljava/lang/String;

    .line 63
    .line 64
    invoke-interface {v0, v1, p0}, Ltech/sud/gip/core/ISudListenerGetMGInfo;->onFailure(ILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
