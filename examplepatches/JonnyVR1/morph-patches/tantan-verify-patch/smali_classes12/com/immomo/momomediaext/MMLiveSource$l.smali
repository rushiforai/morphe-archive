.class Lcom/immomo/momomediaext/MMLiveSource$l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveSource;->j0(Lcom/momo/mcamera/mask/Sticker;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/mcamera/mask/Sticker;

.field final synthetic b:Lcom/immomo/momomediaext/MMLiveSource;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveSource;Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource$l;->b:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource$l;->a:Lcom/momo/mcamera/mask/Sticker;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$l;->b:Lcom/immomo/momomediaext/MMLiveSource;

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
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$l;->a:Lcom/momo/mcamera/mask/Sticker;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$l;->b:Lcom/immomo/momomediaext/MMLiveSource;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveSource;->c(Lcom/immomo/momomediaext/MMLiveSource;)Ll/kpl;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource$l;->a:Lcom/momo/mcamera/mask/Sticker;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v0, v1}, Ll/htl;->e(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$l;->b:Lcom/immomo/momomediaext/MMLiveSource;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveSource;->c(Lcom/immomo/momomediaext/MMLiveSource;)Ll/kpl;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource$l;->a:Lcom/momo/mcamera/mask/Sticker;

    .line 35
    .line 36
    invoke-interface {v0, p0}, Ll/htl;->o(Lcom/momo/mcamera/mask/Sticker;)V

    .line 37
    .line 38
    .line 39
    const-string p0, "MMLiveSource"

    .line 40
    .line 41
    const-string v0, "updateWatermark: Refresh"

    .line 42
    .line 43
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method
