.class public abstract Ll/lbl0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private errorHandler:Ll/x20;

.field private failedTrace:Ll/b30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b30<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private nextChecker:Ll/lbl0;

.field private successTrace:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private trackType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/lbl0;->trackType:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "current checker execute:"

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/lbl0;->f()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "videoChat"

    .line 20
    .line 21
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Ll/lbl0;->d(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public c(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/lbl0;->d(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "videoChat"

    .line 2
    .line 3
    const-string v1, "current checker execute error"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/lbl0;->failedTrace:Ll/b30;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/lbl0;->trackType:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/lbl0;->f()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v0, v1, v2, p1, p2}, Ll/b30;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Ll/lbl0;->errorHandler:Ll/x20;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-interface {p0}, Ll/x20;->call()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lbl0;->successTrace:Ll/z20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/lbl0;->trackType:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/lbl0;->f()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v0, v1, v2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/lbl0;->nextChecker:Ll/lbl0;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Ll/lbl0;->trackType:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/lbl0;->nextChecker:Ll/lbl0;

    .line 27
    .line 28
    iget-object v1, p0, Ll/lbl0;->trackType:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/lbl0;->j(Ljava/lang/String;)Ll/lbl0;

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p0, p0, Ll/lbl0;->nextChecker:Ll/lbl0;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method public abstract f()Ljava/lang/String;
.end method

.method public g(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lbl0;->trackType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public h(Ll/x20;)Ll/lbl0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lbl0;->errorHandler:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ll/lbl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lbl0;->nextChecker:Ll/lbl0;

    .line 2
    .line 3
    return-void
.end method

.method public j(Ljava/lang/String;)Ll/lbl0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lbl0;->trackType:Ljava/lang/String;

    .line 2
    .line 3
    new-instance p1, Ll/jbl0;

    .line 4
    .line 5
    invoke-direct {p1}, Ll/jbl0;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/lbl0;->successTrace:Ll/z20;

    .line 9
    .line 10
    new-instance p1, Ll/kbl0;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/kbl0;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/lbl0;->failedTrace:Ll/b30;

    .line 16
    .line 17
    return-object p0
.end method
