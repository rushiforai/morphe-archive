.class Lcom/immomo/momomediaext/MMLiveSource$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveSource;->h0(Ljava/lang/String;Ljava/lang/String;F)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:F

.field final synthetic d:Lcom/immomo/momomediaext/MMLiveSource;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;Ljava/lang/String;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource$g;->d:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource$g;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/immomo/momomediaext/MMLiveSource$g;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput p4, p0, Lcom/immomo/momomediaext/MMLiveSource$g;->c:F

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$g;->d:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveSource;->c(Lcom/immomo/momomediaext/MMLiveSource;)Ll/kpl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource$g;->a:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveSource$g;->b:Ljava/lang/String;

    .line 10
    .line 11
    iget p0, p0, Lcom/immomo/momomediaext/MMLiveSource$g;->c:F

    .line 12
    .line 13
    invoke-interface {v0, v1, v2, p0}, Ll/gtl;->g(Ljava/lang/String;Ljava/lang/String;F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
