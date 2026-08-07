.class Lcom/immomo/momomediaext/MMLiveSource$q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveSource;->p(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/momo/mcamera/mask/MaskModel;

.field final synthetic c:Lcom/immomo/momomediaext/MMLiveSource;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource$q;->c:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource$q;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/immomo/momomediaext/MMLiveSource$q;->b:Lcom/momo/mcamera/mask/MaskModel;

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
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$q;->c:Lcom/immomo/momomediaext/MMLiveSource;

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
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$q;->a:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$q;->b:Lcom/momo/mcamera/mask/MaskModel;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$q;->c:Lcom/immomo/momomediaext/MMLiveSource;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveSource;->c(Lcom/immomo/momomediaext/MMLiveSource;)Ll/kpl;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource$q;->a:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource$q;->b:Lcom/momo/mcamera/mask/MaskModel;

    .line 26
    .line 27
    invoke-interface {v0, v1, p0}, Ll/htl;->f(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
