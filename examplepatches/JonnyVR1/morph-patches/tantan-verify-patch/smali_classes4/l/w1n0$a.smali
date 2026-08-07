.class public Ll/w1n0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ga1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w1n0;->a(Ll/pcj;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/pcj;

.field public final synthetic b:Ll/x20;


# direct methods
.method public constructor <init>(Ll/pcj;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/w1n0$a;->a:Ll/pcj;

    .line 2
    .line 3
    iput-object p2, p0, Ll/w1n0$a;->b:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w1n0$a;->b:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 0

    .line 1
    invoke-virtual {p5}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->isHighLevelBusiness()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    invoke-virtual {p5}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/w1n0$a;->b:Ll/x20;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p4, p0, Ll/w1n0$a;->a:Ll/pcj;

    .line 21
    .line 22
    invoke-interface {p4}, Ll/pcj;->call()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p4

    .line 26
    check-cast p4, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result p4

    .line 32
    if-eqz p4, :cond_1

    .line 33
    .line 34
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0, p1, p2, p3}, Ll/pb1;->g(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object p0, p0, Ll/w1n0$a;->b:Ll/x20;

    .line 43
    .line 44
    invoke-interface {p0}, Ll/x20;->call()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public success()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w1n0$a;->a:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/w1n0$a;->b:Ll/x20;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
