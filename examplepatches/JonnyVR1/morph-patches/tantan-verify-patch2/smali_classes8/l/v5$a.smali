.class public Ll/v5$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t4d0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/v5;->f(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreGiftPriority;Ll/y4m$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/y4m$a;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/v5;


# direct methods
.method public constructor <init>(Ll/v5;Ll/y4m$a;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/v5$a;->d:Ll/v5;

    .line 2
    .line 3
    iput-object p2, p0, Ll/v5$a;->a:Ll/y4m$a;

    .line 4
    .line 5
    iput-object p3, p0, Ll/v5$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/v5$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ljava/io/File;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v5$a;->d:Ll/v5;

    .line 2
    .line 3
    iget-object v1, p0, Ll/v5$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Ll/v5;->l(Ljava/lang/String;Ljava/io/File;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/v5$a;->a:Ll/y4m$a;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/v5$a;->d:Ll/v5;

    .line 13
    .line 14
    iget-object v1, p0, Ll/v5$a;->c:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v2, p0, Ll/v5$a;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Ll/v5;->k(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Ll/v5$a;->c:Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {p1, v0, p0}, Ll/y4m$a;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public c(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v5$a;->a:Ll/y4m$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y4m$a;->c(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onCancel()V
    .locals 0

    .line 1
    return-void
.end method

.method public onFailed(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v5$a;->a:Ll/y4m$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/v5$a;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, p1, p0}, Ll/y4m$a;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
