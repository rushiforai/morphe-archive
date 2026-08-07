.class public Ll/nfw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nfw;->o0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/core/data/FateRadar;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/nfw;


# direct methods
.method public constructor <init>(Ll/nfw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nfw$a;->a:Ll/nfw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/FateRadar;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nfw$a;->a:Ll/nfw;

    .line 2
    .line 3
    invoke-static {v0}, Ll/nfw;->h0(Ll/nfw;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/qfw;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/qfw;->m()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FateRadar;->aiGreeting:Lcom/p1/mobile/putong/core/data/AiGreetingValue;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FateRadar;->aiGreeting:Lcom/p1/mobile/putong/core/data/AiGreetingValue;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AiGreetingValue;->value:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    iget-object p0, p0, Ll/nfw$a;->a:Ll/nfw;

    .line 37
    .line 38
    invoke-static {p0}, Ll/nfw;->i0(Ll/nfw;)Ll/iam;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ll/qfw;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/FateRadar;->aiGreeting:Lcom/p1/mobile/putong/core/data/AiGreetingValue;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiGreetingValue;->value:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/qfw;->s(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    const-string p0, "\u7f51\u7edc\u5f02\u5e38\uff01"

    .line 53
    .line 54
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nfw$a;->a(Lcom/p1/mobile/putong/core/data/FateRadar;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
