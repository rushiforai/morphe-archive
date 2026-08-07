.class Lcom/immomo/momomediaext/MMLiveSource$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveSource;->E(Ljava/lang/String;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/immomo/momomediaext/MMLiveSource;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource$i;->c:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource$i;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/immomo/momomediaext/MMLiveSource$i;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$i;->c:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveSource;->c(Lcom/immomo/momomediaext/MMLiveSource;)Ll/kpl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$i;->c:Lcom/immomo/momomediaext/MMLiveSource;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveSource;->c(Lcom/immomo/momomediaext/MMLiveSource;)Ll/kpl;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource$i;->a:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource$i;->b:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {v0, v1, p0}, Ll/gtl;->removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
