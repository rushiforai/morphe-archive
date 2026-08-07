.class Ll/flj$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mxl$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/flj;->m(Ljava/lang/String;Ljava/lang/String;Ll/elj;ZZLl/okj;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/okj;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ll/elj;

.field final synthetic d:Z

.field final synthetic e:Ll/flj;


# direct methods
.method public constructor <init>(Ll/flj;Ll/okj;Ljava/lang/String;Ll/elj;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/flj$a;->e:Ll/flj;

    .line 2
    .line 3
    iput-object p2, p0, Ll/flj$a;->a:Ll/okj;

    .line 4
    .line 5
    iput-object p3, p0, Ll/flj$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/flj$a;->c:Ll/elj;

    .line 8
    .line 9
    iput-boolean p5, p0, Ll/flj$a;->d:Z

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Ll/yjw;I)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/flj$a;->e:Ll/flj;

    .line 2
    .line 3
    iget-object p2, p0, Ll/flj$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 6
    .line 7
    const-string v1, "download failed"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/flj$a;->a:Ll/okj;

    .line 13
    .line 14
    invoke-static {p1, p2, v0, p0}, Ll/flj;->a(Ll/flj;Ljava/lang/String;Ljava/lang/Exception;Ll/okj;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public b(Ll/yjw;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/flj$a;->e:Ll/flj;

    .line 2
    .line 3
    iget-object v1, p0, Ll/flj$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v3, p0, Ll/flj$a;->c:Ll/elj;

    .line 6
    .line 7
    iget-boolean v4, p0, Ll/flj$a;->d:Z

    .line 8
    .line 9
    iget-object v5, p0, Ll/flj$a;->a:Ll/okj;

    .line 10
    .line 11
    move-object v2, p1

    .line 12
    invoke-static/range {v0 .. v5}, Ll/flj;->b(Ll/flj;Ljava/lang/String;Ll/yjw;Ll/elj;ZLl/okj;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public c(Ll/yjw;)V
    .locals 0

    .line 1
    return-void
.end method
