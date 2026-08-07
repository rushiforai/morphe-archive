.class Lcom/immomo/momomediaext/MMLiveEngine$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gkl0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine;->H()V
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
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$c;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(JLl/gkl0$c;II)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(JI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$c;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(JLl/gkl0$b;II)V
    .locals 0

    .line 1
    iget-object p4, p0, Lcom/immomo/momomediaext/MMLiveEngine$c;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p4}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    iget-object p4, p0, Lcom/immomo/momomediaext/MMLiveEngine$c;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 10
    .line 11
    invoke-static {p4}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$c;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 22
    .line 23
    invoke-virtual {p4, p1, p2, p3, p0}, Ll/enw;->R(JLl/gkl0$b;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
