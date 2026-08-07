.class public Ll/db$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rx3$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/db;->v()Ll/rx3$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rx3$a;

.field public final synthetic b:Ll/db;


# direct methods
.method public constructor <init>(Ll/db;Ll/rx3$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/db$c;->b:Ll/db;

    .line 2
    .line 3
    iput-object p2, p0, Ll/db$c;->a:Ll/rx3$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/db$c;->b:Ll/db;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/db;->Y()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/db$c;->b:Ll/db;

    .line 10
    .line 11
    iget-object v1, v0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/db;->T(Ll/db;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/db$c;->a:Ll/rx3$a;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/db$c;->a:Ll/rx3$a;

    .line 29
    .line 30
    invoke-interface {p0, p1}, Ll/rx3$a;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/db$c;->a:Ll/rx3$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/db$c;->a:Ll/rx3$a;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/rx3$a;->b(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/db$c;->a:Ll/rx3$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/db$c;->a:Ll/rx3$a;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2, p3}, Ll/rx3$a;->c(ILjava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
