.class public final Ll/kqs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v4z0;


# instance fields
.field public a:Z

.field public final synthetic b:Z

.field public final synthetic c:Ll/har0;

.field public final synthetic d:Ljava/util/Map;

.field public final synthetic e:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ll/mqs0;ZLl/har0;Ljava/util/Map;Ljava/util/Map;)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Ll/kqs0;->b:Z

    .line 2
    .line 3
    iput-object p3, p0, Ll/kqs0;->c:Ll/har0;

    .line 4
    .line 5
    iput-object p4, p0, Ll/kqs0;->d:Ljava/util/Map;

    .line 6
    .line 7
    iput-object p5, p0, Ll/kqs0;->e:Ljava/util/Map;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Ll/kqs0;->a:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/kqs0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/kqs0;->b:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/kqs0;->c:Ll/har0;

    .line 12
    .line 13
    check-cast v0, Ll/ggu0;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/ggu0;->zzs()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Ll/kqs0;->a:Z

    .line 20
    .line 21
    iget-object v0, p0, Ll/kqs0;->d:Ljava/util/Map;

    .line 22
    .line 23
    iget-object v1, p0, Ll/kqs0;->e:Ljava/util/Map;

    .line 24
    .line 25
    const-string v2, "event_id"

    .line 26
    .line 27
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/kqs0;->c:Ll/har0;

    .line 41
    .line 42
    iget-object p0, p0, Ll/kqs0;->d:Ljava/util/Map;

    .line 43
    .line 44
    check-cast p1, Ll/kts0;

    .line 45
    .line 46
    const-string v0, "openIntentAsync"

    .line 47
    .line 48
    invoke-interface {p1, v0, p0}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public final e(I)V
    .locals 0

    .line 1
    return-void
.end method
