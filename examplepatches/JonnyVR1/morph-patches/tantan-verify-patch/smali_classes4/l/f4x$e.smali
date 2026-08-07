.class public Ll/f4x$e;
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
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/f4x;


# direct methods
.method public constructor <init>(Ll/f4x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f4x$e;->a:Ll/f4x;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f4x$e;->a:Ll/f4x;

    .line 2
    .line 3
    invoke-static {v0}, Ll/f4x;->D0(Ll/f4x;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/f4x$e;->a:Ll/f4x;

    .line 10
    .line 11
    invoke-static {v0}, Ll/f4x;->p0(Ll/f4x;)Ll/iam;

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
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 29
    .line 30
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 31
    .line 32
    const v0, 0x9d6e

    .line 33
    .line 34
    .line 35
    if-ne p1, v0, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Ll/f4x$e;->a:Ll/f4x;

    .line 38
    .line 39
    invoke-static {p0}, Ll/f4x;->q0(Ll/f4x;)Ll/iam;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->w()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const v0, 0x9d6f

    .line 50
    .line 51
    .line 52
    if-ne p1, v0, :cond_1

    .line 53
    .line 54
    iget-object p0, p0, Ll/f4x$e;->a:Ll/f4x;

    .line 55
    .line 56
    invoke-static {p0}, Ll/f4x;->r0(Ll/f4x;)Ll/iam;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->v()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    const v0, 0x9d70

    .line 67
    .line 68
    .line 69
    if-ne p1, v0, :cond_2

    .line 70
    .line 71
    const-string p1, "\u5a5a\u604b\u8d44\u6599\u672a\u901a\u8fc7\u5ba1\u6838"

    .line 72
    .line 73
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    iget-object p0, p0, Ll/f4x$e;->a:Ll/f4x;

    .line 77
    .line 78
    invoke-static {p0}, Ll/f4x;->s0(Ll/f4x;)Ll/iam;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->s()V

    .line 85
    .line 86
    .line 87
    :cond_3
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Throwable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f4x$e;->a(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
