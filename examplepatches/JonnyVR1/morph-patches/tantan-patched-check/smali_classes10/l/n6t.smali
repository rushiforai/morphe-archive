.class public Ll/n6t;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/n6t$a;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/n6t;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/o6t;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ll/n6t;-><init>()V

    return-void
.end method

.method public static a()Ll/n6t;
    .locals 5

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/n6t$a;->a()Ll/n6t;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v1, v1, Ll/n6t;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/n6t$a;->a()Ll/n6t;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v1, v1, Ll/n6t;->b:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 24
    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    :cond_0
    invoke-static {}, Ll/n6t$a;->a()Ll/n6t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 32
    .line 33
    const-string v3, "live_sider_anim_show_count"

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    invoke-direct {v2, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;-><init>(Ljava/lang/String;Z)V

    .line 37
    .line 38
    .line 39
    iput-object v2, v1, Ll/n6t;->b:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 40
    .line 41
    invoke-static {}, Ll/n6t$a;->a()Ll/n6t;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v0, v1, Ll/n6t;->a:Ljava/lang/String;

    .line 46
    .line 47
    :cond_1
    invoke-static {}, Ll/n6t$a;->a()Ll/n6t;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    return-object v0
.end method


# virtual methods
.method public b(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6t;->b:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->b(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6t;->b:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->c()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6t;->b:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->d()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6t;->b:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
