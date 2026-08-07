.class Ll/g410$l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o410$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g410;-><init>(Ll/uow;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/g410;


# direct methods
.method public constructor <init>(Ll/g410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g410$l;->a:Ll/g410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g410$l;->a:Ll/g410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/g410;->m(Ll/g410;)Ll/bfj;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/g410$l;->a:Ll/g410;

    .line 10
    .line 11
    invoke-static {v0}, Ll/g410;->q(Ll/g410;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/g410$l;->a:Ll/g410;

    .line 18
    .line 19
    invoke-static {v0}, Ll/g410;->m(Ll/g410;)Ll/bfj;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/bfj;->b()Ll/zej;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/g410$l;->a:Ll/g410;

    .line 30
    .line 31
    invoke-static {v0}, Ll/g410;->m(Ll/g410;)Ll/bfj;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/bfj;->b()Ll/zej;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/wej;->releaseFrameBuffer()V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Ll/g410$l;->a:Ll/g410;

    .line 43
    .line 44
    invoke-static {v0}, Ll/g410;->m(Ll/g410;)Ll/bfj;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/bfj;->a()Ll/gfj;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object v0, p0, Ll/g410$l;->a:Ll/g410;

    .line 55
    .line 56
    invoke-static {v0}, Ll/g410;->m(Ll/g410;)Ll/bfj;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/bfj;->a()Ll/gfj;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/gfj;->releaseFrameBuffer()V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object v0, p0, Ll/g410$l;->a:Ll/g410;

    .line 68
    .line 69
    iget-object v0, v0, Ll/g410;->g:Ll/rsy;

    .line 70
    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/ogk;->releaseFrameBuffer()V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Ll/g410$l;->a:Ll/g410;

    .line 77
    .line 78
    iget-object p0, p0, Ll/g410;->g:Ll/rsy;

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/wej;->reInitialize()V

    .line 81
    .line 82
    .line 83
    :cond_2
    return-void
.end method
