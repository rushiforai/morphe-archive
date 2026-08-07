.class Lcom/immomo/momomediaext/MMLiveEngine$s$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine$s;->b(Ll/inw;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/inw;

.field final synthetic b:Lcom/immomo/momomediaext/MMLiveEngine$s;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine$s;Ll/inw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$s;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$a;->a:Ll/inw;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$s;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$s;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$s;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$s;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$s$a;->a:Ll/inw;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ll/enw;->h0(Ll/inw;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
