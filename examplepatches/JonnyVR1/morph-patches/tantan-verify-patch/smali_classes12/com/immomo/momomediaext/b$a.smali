.class Lcom/immomo/momomediaext/b$a;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/b;->g(ILcom/immomo/momomediaext/b$c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/b;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/b$a;->a:Lcom/immomo/momomediaext/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/b$a;->a:Lcom/immomo/momomediaext/b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/momomediaext/b;->a(Lcom/immomo/momomediaext/b;)Lcom/momo/mcamera/mask/Sticker;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/momomediaext/b$a;->a:Lcom/immomo/momomediaext/b;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/immomo/momomediaext/b;->e()Z

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/b$a;->a:Lcom/immomo/momomediaext/b;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/immomo/momomediaext/b;->a(Lcom/immomo/momomediaext/b;)Lcom/momo/mcamera/mask/Sticker;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/immomo/momomediaext/b$a;->a:Lcom/immomo/momomediaext/b;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/immomo/momomediaext/b;->b(Lcom/immomo/momomediaext/b;)Lcom/immomo/momomediaext/b$c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object p0, p0, Lcom/immomo/momomediaext/b$a;->a:Lcom/immomo/momomediaext/b;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/immomo/momomediaext/b;->a(Lcom/immomo/momomediaext/b;)Lcom/momo/mcamera/mask/Sticker;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {v0, p0}, Lcom/immomo/momomediaext/b$c;->a(Lcom/momo/mcamera/mask/Sticker;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method
