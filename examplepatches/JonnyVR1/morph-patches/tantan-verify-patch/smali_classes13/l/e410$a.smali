.class Ll/e410$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dpl$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/e410;->C0(Ll/dpl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/e410;


# direct methods
.method public constructor <init>(Ll/e410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e410$a;->a:Ll/e410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C(Ll/oxd0;)Ll/oxd0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e410$a;->a:Ll/e410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/e410;->Q(Ll/e410;)Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/e410$a;->a:Ll/e410;

    .line 10
    .line 11
    invoke-static {v0}, Ll/e410;->Q(Ll/e410;)Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1}, Ll/oxd0;->c()[B

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/immomo/mediacore/audio/audio_Indicator;->putAudioData([B)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/e410$a;->a:Ll/e410;

    .line 23
    .line 24
    invoke-static {v0}, Ll/e410;->R(Ll/e410;)Ll/dpl$a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/e410$a;->a:Ll/e410;

    .line 31
    .line 32
    invoke-static {v0}, Ll/e410;->R(Ll/e410;)Ll/dpl$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0, p1}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-object v0, p0, Ll/e410$a;->a:Ll/e410;

    .line 40
    .line 41
    iget-object v0, v0, Ll/e410;->C:Ll/dpl$a;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-interface {v0, p1}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-object p0, p0, Ll/e410$a;->a:Ll/e410;

    .line 49
    .line 50
    invoke-static {p0}, Ll/e410;->T(Ll/e410;)Ll/o410;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, p1}, Ll/o410;->C(Ll/oxd0;)Ll/oxd0;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method
