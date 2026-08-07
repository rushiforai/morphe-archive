.class public final Ll/pxd0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pxd0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/pxd0$a<",
        "+TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Lcom/google/gson/Gson;

.field public final b:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final c:Ll/wyd0;

.field public final d:Ll/pxd0$a;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public e:Ll/pxd0$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;Ll/pxd0$a;ZLjava/lang/String;)V
    .locals 2
    .param p3    # Ll/pxd0$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            "TT;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/gson/Gson;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pxd0;->a:Lcom/google/gson/Gson;

    .line 10
    .line 11
    new-instance v1, Ll/wyd0;

    .line 12
    .line 13
    invoke-virtual {v0, p3}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-direct {v1, p2, v0, p4, p5}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/pxd0;->c:Ll/wyd0;

    .line 21
    .line 22
    iput-object p3, p0, Ll/pxd0;->d:Ll/pxd0$a;

    .line 23
    .line 24
    iput-object p2, p0, Ll/pxd0;->f:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p1, p0, Ll/pxd0;->b:Ljava/lang/Class;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final a()Ll/pxd0$a;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pxd0;->e:Ll/pxd0$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/pxd0;->c:Ll/wyd0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/pxd0;->d:Ll/pxd0$a;

    .line 21
    .line 22
    invoke-interface {v0}, Ll/pxd0$a;->nullCheck()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/pxd0;->d:Ll/pxd0$a;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    iget-object v1, p0, Ll/pxd0;->a:Lcom/google/gson/Gson;

    .line 29
    .line 30
    iget-object v2, p0, Ll/pxd0;->b:Ljava/lang/Class;

    .line 31
    .line 32
    invoke-virtual {v1, v0, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/pxd0$a;

    .line 37
    .line 38
    invoke-interface {v0}, Ll/pxd0$a;->nullCheck()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/pxd0;->e:Ll/pxd0$a;

    .line 42
    .line 43
    return-object v0
.end method

.method public final b(Ll/pxd0$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/pxd0$a;->trimAndCopy()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/pxd0$a;

    .line 6
    .line 7
    iget-object v0, p0, Ll/pxd0;->a:Lcom/google/gson/Gson;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object p1, p0, Ll/pxd0;->e:Ll/pxd0$a;

    .line 14
    .line 15
    iget-object p0, p0, Ll/pxd0;->c:Ll/wyd0;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method
