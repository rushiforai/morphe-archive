.class Lcom/immomo/momomediaext/MMLiveEngine$q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fb1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/MMLiveEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveEngine;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$q;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C(Ll/oxd0;)Ll/oxd0;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$q;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$q;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1}, Ll/enw;->c(Ll/oxd0;)Ll/oxd0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    return-object p1
.end method
