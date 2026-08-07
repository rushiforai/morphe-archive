.class Ll/e410$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/e410;->c(Ll/uow;)V
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
    iput-object p1, p0, Ll/e410$b;->b:Ll/e410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/e410$b;->a:Ll/uow;

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
    iget-object v0, p0, Ll/e410$b;->b:Ll/e410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/e410;->E0(Ll/e410;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 22
    .line 23
    instance-of v2, v1, Ll/grx;

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Ll/e410$b;->b:Ll/e410;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/g410;->j0()Ll/g510;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    move-object v2, v1

    .line 36
    check-cast v2, Ll/grx;

    .line 37
    .line 38
    iget-object v3, p0, Ll/e410$b;->a:Ll/uow;

    .line 39
    .line 40
    iget v4, v3, Ll/tow;->m:I

    .line 41
    .line 42
    iget v3, v3, Ll/tow;->n:I

    .line 43
    .line 44
    invoke-virtual {v2, v4, v3}, Ll/zej;->setRenderSize(II)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Ll/e410$b;->b:Ll/e410;

    .line 48
    .line 49
    invoke-virtual {v2}, Ll/g410;->j0()Ll/g510;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget-object v3, p0, Ll/e410$b;->a:Ll/uow;

    .line 54
    .line 55
    invoke-interface {v1, v2, v3}, Lcom/momo/pipline/MomoInterface/MomoCodec;->Y(Ll/g510;Ll/uow;)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Ll/e410$b;->b:Ll/e410;

    .line 59
    .line 60
    invoke-virtual {v2}, Ll/g410;->j0()Ll/g510;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2, v1}, Ll/g510;->B(Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Ll/e410$b;->b:Ll/e410;

    .line 68
    .line 69
    invoke-virtual {v1}, Ll/g410;->j0()Ll/g510;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object v2, p0, Ll/e410$b;->a:Ll/uow;

    .line 74
    .line 75
    iget v2, v2, Ll/uow;->E0:I

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Ll/g510;->I(I)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const/4 v0, 0x1

    .line 86
    invoke-virtual {p0, v0}, Ll/sej;->f(Z)V

    .line 87
    .line 88
    .line 89
    return-void
.end method
