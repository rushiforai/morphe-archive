.class Ll/e410$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/e410;->b(Ll/uow;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/uow;

.field final synthetic b:Ll/e410;


# direct methods
.method public constructor <init>(Ll/e410;Ll/uow;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/e410$c;->b:Ll/e410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/e410$c;->a:Ll/uow;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/e410$c;->b:Ll/e410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/e410;->F0(Ll/e410;)Ll/rsy;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/e410$c;->b:Ll/e410;

    .line 10
    .line 11
    invoke-static {v0}, Ll/e410;->G0(Ll/e410;)Ll/rsy;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/e410$c;->a:Ll/uow;

    .line 16
    .line 17
    iget v2, v1, Ll/tow;->u:I

    .line 18
    .line 19
    iget v1, v1, Ll/tow;->v:I

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/rsy;->setRenderSize(II)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/e410$c;->b:Ll/e410;

    .line 25
    .line 26
    invoke-static {v0}, Ll/e410;->H0(Ll/e410;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 45
    .line 46
    instance-of v2, v1, Ll/grx;

    .line 47
    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    iget-object v2, p0, Ll/e410$c;->b:Ll/e410;

    .line 51
    .line 52
    invoke-virtual {v2}, Ll/g410;->j0()Ll/g510;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    move-object v2, v1

    .line 59
    check-cast v2, Ll/grx;

    .line 60
    .line 61
    iget-object v3, p0, Ll/e410$c;->a:Ll/uow;

    .line 62
    .line 63
    iget v4, v3, Ll/tow;->m:I

    .line 64
    .line 65
    iget v3, v3, Ll/tow;->n:I

    .line 66
    .line 67
    invoke-virtual {v2, v4, v3}, Ll/zej;->setRenderSize(II)V

    .line 68
    .line 69
    .line 70
    iget-object v2, p0, Ll/e410$c;->b:Ll/e410;

    .line 71
    .line 72
    invoke-virtual {v2}, Ll/g410;->j0()Ll/g510;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    iget-object v3, p0, Ll/e410$c;->a:Ll/uow;

    .line 77
    .line 78
    invoke-interface {v1, v2, v3}, Lcom/momo/pipline/MomoInterface/MomoCodec;->Y(Ll/g510;Ll/uow;)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Ll/e410$c;->b:Ll/e410;

    .line 82
    .line 83
    invoke-virtual {v2}, Ll/g410;->j0()Ll/g510;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2, v1}, Ll/g510;->B(Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const/4 v0, 0x1

    .line 96
    invoke-virtual {p0, v0}, Ll/sej;->f(Z)V

    .line 97
    .line 98
    .line 99
    return-void
.end method
