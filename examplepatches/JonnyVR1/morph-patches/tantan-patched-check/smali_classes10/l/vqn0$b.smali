.class public Ll/vqn0$b;
.super Ll/jj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vqn0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/w8e;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/w8e;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/vqn0;


# direct methods
.method public constructor <init>(Ll/vqn0;Ll/w8e;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vqn0$b;->d:Ll/vqn0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/vqn0$b;->a:Ll/w8e;

    .line 4
    .line 5
    iput-object p3, p0, Ll/vqn0$b;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/vqn0$b;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/jj2;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ljava/io/File;)V
    .locals 4
    .param p1    # Ljava/io/File;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/jj2;->a(Ljava/io/File;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/vqn0$b;->a:Ll/w8e;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/io/File;

    .line 9
    .line 10
    iget-object v1, p0, Ll/vqn0$b;->d:Ll/vqn0;

    .line 11
    .line 12
    invoke-static {v1}, Ll/vqn0;->b(Ll/vqn0;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-object v3, p0, Ll/vqn0$b;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v3, "."

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/vqn0$b;->c:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {p1, v0}, Ll/w8e;->a(Ljava/io/File;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public onFailed(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/jj2;->onFailed(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/vqn0$b;->a:Ll/w8e;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/w8e;->onFailed(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
