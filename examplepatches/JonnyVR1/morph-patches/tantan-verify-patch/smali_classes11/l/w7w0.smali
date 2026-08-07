.class public final synthetic Ll/w7w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public final synthetic a:Ll/yew0;

.field public final synthetic b:Ll/fbv0;


# direct methods
.method public synthetic constructor <init>(Ll/yew0;Ll/fbv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/w7w0;->a:Ll/yew0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/w7w0;->b:Ll/fbv0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 6

    .line 1
    check-cast p1, Ll/nit0;

    .line 2
    .line 3
    const-string v0, "u"

    .line 4
    .line 5
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    move-object v4, p2

    .line 10
    check-cast v4, Ljava/lang/String;

    .line 11
    .line 12
    if-nez v4, :cond_0

    .line 13
    .line 14
    const-string p0, "URL missing from httpTrack GMSG."

    .line 15
    .line 16
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-interface {p1}, Ll/nit0;->c()Ll/q6w0;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iget-boolean p2, p2, Ll/q6w0;->j0:Z

    .line 25
    .line 26
    if-nez p2, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/w7w0;->a:Ll/yew0;

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, v4, p1}, Ll/yew0;->c(Ljava/lang/String;Ll/cew0;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget-object p0, p0, Ll/w7w0;->b:Ll/fbv0;

    .line 36
    .line 37
    new-instance v0, Ll/hbv0;

    .line 38
    .line 39
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-interface {p2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 44
    .line 45
    .line 46
    move-result-wide v1

    .line 47
    check-cast p1, Ll/zjt0;

    .line 48
    .line 49
    invoke-interface {p1}, Ll/zjt0;->h()Ll/t6w0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object v3, p1, Ll/t6w0;->b:Ljava/lang/String;

    .line 54
    .line 55
    const/4 v5, 0x2

    .line 56
    invoke-direct/range {v0 .. v5}, Ll/hbv0;-><init>(JLjava/lang/String;Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/fbv0;->g(Ll/hbv0;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
