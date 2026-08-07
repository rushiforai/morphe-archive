.class public Ll/vwv$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vwv$a;->a(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/vwv$a;


# direct methods
.method public constructor <init>(Ll/vwv$a;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/vwv$a$a;->b:Ll/vwv$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/vwv$a$a;->a:Ljava/lang/String;

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
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vwv$a$a;->b:Ll/vwv$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vwv$a;->a:Ll/vwv;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vwv;->c:Ll/l0m;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/vwv$a$a;->b:Ll/vwv$a;

    .line 14
    .line 15
    iget-object v0, v0, Ll/vwv$a;->a:Ll/vwv;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/vwv;->j()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/vwv$a$a;->b:Ll/vwv$a;

    .line 21
    .line 22
    iget-object v0, v0, Ll/vwv$a;->a:Ll/vwv;

    .line 23
    .line 24
    invoke-static {v0}, Ll/vwv;->Y(Ll/vwv;)Ll/a0m;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ll/vwv$a$a;->b:Ll/vwv$a;

    .line 35
    .line 36
    iget-object v0, v0, Ll/vwv$a;->a:Ll/vwv;

    .line 37
    .line 38
    invoke-static {v0}, Ll/vwv;->Y(Ll/vwv;)Ll/a0m;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-interface {v0, v1}, Ll/k4m;->k(Z)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object v0, p0, Ll/vwv$a$a;->b:Ll/vwv$a;

    .line 47
    .line 48
    iget-object v0, v0, Ll/vwv$a;->a:Ll/vwv;

    .line 49
    .line 50
    iget-object v0, v0, Ll/vwv;->c:Ll/l0m;

    .line 51
    .line 52
    invoke-interface {v0}, Ll/l0m;->j()V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Ll/vwv$a$a;->b:Ll/vwv$a;

    .line 56
    .line 57
    iget-object v0, v0, Ll/vwv$a;->a:Ll/vwv;

    .line 58
    .line 59
    invoke-static {v0}, Ll/vwv;->Y(Ll/vwv;)Ll/a0m;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    iget-object v0, p0, Ll/vwv$a$a;->b:Ll/vwv$a;

    .line 70
    .line 71
    iget-object v0, v0, Ll/vwv$a;->a:Ll/vwv;

    .line 72
    .line 73
    invoke-static {v0}, Ll/vwv;->Y(Ll/vwv;)Ll/a0m;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-object p0, p0, Ll/vwv$a$a;->a:Ljava/lang/String;

    .line 78
    .line 79
    invoke-interface {v0, p0}, Ll/l4m$a;->a(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-void
.end method
