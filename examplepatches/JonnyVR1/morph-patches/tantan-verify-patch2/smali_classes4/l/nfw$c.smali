.class public Ll/nfw$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nfw;->n0(Lcom/p1/mobile/putong/core/data/GreetingItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/nfw;


# direct methods
.method public constructor <init>(Ll/nfw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nfw$c;->a:Ll/nfw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nfw$c;->a:Ll/nfw;

    .line 2
    .line 3
    invoke-static {v0}, Ll/nfw;->k0(Ll/nfw;)Ll/iam;

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
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    const-string p0, "\u4fdd\u5b58\u5931\u8d25"

    .line 19
    .line 20
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->s2:Ll/hlg;

    .line 27
    .line 28
    iget-object p1, p1, Ll/hlg;->S:Lrx/subjects/b;

    .line 29
    .line 30
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/nfw$c;->a:Ll/nfw;

    .line 36
    .line 37
    invoke-static {p0}, Ll/nfw;->l0(Ll/nfw;)Ll/iam;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Ll/qfw;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/qfw;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nfw$c;->a(Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
