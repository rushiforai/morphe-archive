.class public final Ll/wug0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vrg0;


# instance fields
.field public final synthetic a:Ll/wyg0;


# direct methods
.method public constructor <init>(Ll/wyg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wug0;->a:Ll/wyg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/gfg0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wug0;->a:Ll/wyg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wyg0;->m:Ll/bfg0;

    .line 4
    .line 5
    if-eqz p0, :cond_3

    .line 6
    .line 7
    const-string p1, "ProxySudFSTAPPImpl"

    .line 8
    .line 9
    const-string p2, "onGameLoadCompleted"

    .line 10
    .line 11
    invoke-static {p1, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    sget-object p1, Ll/dhg0;->F:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1, p2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/bfg0;->b:Ll/dhg0;

    .line 20
    .line 21
    iget-object p1, p1, Ll/dhg0;->w:Ll/iug0;

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    iput-boolean p2, p1, Ll/iug0;->h:Z

    .line 25
    .line 26
    iget-object p3, p1, Ll/iug0;->j:Ltech/sud/base/utils/SudStopwatch;

    .line 27
    .line 28
    invoke-virtual {p3}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 29
    .line 30
    .line 31
    iget-object p3, p1, Ll/iug0;->k:Ltech/sud/base/utils/SudStopwatch;

    .line 32
    .line 33
    invoke-virtual {p3}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 34
    .line 35
    .line 36
    iget-object p3, p1, Ll/iug0;->l:Ltech/sud/base/utils/SudStopwatch;

    .line 37
    .line 38
    invoke-virtual {p3}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ll/iug0;->a()V

    .line 42
    .line 43
    .line 44
    iget-object p3, p1, Ll/iug0;->a:Ll/ukg0;

    .line 45
    .line 46
    const/4 p4, 0x0

    .line 47
    if-eqz p3, :cond_0

    .line 48
    .line 49
    iput p4, p3, Ll/ukg0;->e:I

    .line 50
    .line 51
    :cond_0
    if-eqz p3, :cond_1

    .line 52
    .line 53
    const-string v0, "success"

    .line 54
    .line 55
    iput-object v0, p3, Ll/ukg0;->f:Ljava/lang/String;

    .line 56
    .line 57
    :cond_1
    invoke-virtual {p1}, Ll/iug0;->h()V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/bfg0;->b:Ll/dhg0;

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/dhg0;->a()V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/bfg0;->b:Ll/dhg0;

    .line 66
    .line 67
    iget-boolean p1, p0, Ll/dhg0;->j:Z

    .line 68
    .line 69
    if-eqz p1, :cond_2

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    iput-boolean p2, p0, Ll/dhg0;->j:Z

    .line 73
    .line 74
    const/4 p1, 0x3

    .line 75
    const/16 p2, 0x64

    .line 76
    .line 77
    invoke-virtual {p0, p1, p4, p2, p4}, Ll/dhg0;->b(IIIZ)V

    .line 78
    .line 79
    .line 80
    :cond_3
    :goto_0
    const-string p0, "{\"ret_code\":0, \"ret_msg\":\"success\"}"

    .line 81
    .line 82
    invoke-virtual {p5, p0}, Ll/gfg0;->success(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
