.class public Ll/f4x$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f4x;->G0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/data/Envelope;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/f4x;


# direct methods
.method public constructor <init>(Ll/f4x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f4x$d;->a:Ll/f4x;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f4x$d;->a:Ll/f4x;

    .line 2
    .line 3
    invoke-static {v0}, Ll/f4x;->x0(Ll/f4x;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/f4x$d;->a:Ll/f4x;

    .line 10
    .line 11
    invoke-static {v0}, Ll/f4x;->y0(Ll/f4x;)Ll/iam;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->H:Lrx/subjects/a;

    .line 18
    .line 19
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 25
    .line 26
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 35
    .line 36
    iget-object v0, p0, Ll/f4x$d;->a:Ll/f4x;

    .line 37
    .line 38
    invoke-static {v0}, Ll/f4x;->z0(Ll/f4x;)Ll/iam;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-static {p1}, Ll/n3x;->f(Ljava/util/List;)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iget-object p0, p0, Ll/f4x$d;->a:Ll/f4x;

    .line 53
    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    invoke-static {p0}, Ll/f4x;->A0(Ll/f4x;)Ll/iam;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->w()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    invoke-static {p0}, Ll/f4x;->C0(Ll/f4x;)Ll/iam;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->q(Ljava/util/List;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f4x$d;->a(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
