.class public Ll/nei0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aiv$a$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nei0;->liveGiftDialogController(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/nei0;


# direct methods
.method public constructor <init>(Ll/nei0;Ll/xc00;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nei0$a;->c:Ll/nei0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/nei0$a;->a:Ll/xc00;

    .line 4
    .line 5
    iput-object p3, p0, Ll/nei0$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftOriginalId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p1, ""

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftOriginalId:Ljava/lang/String;

    .line 13
    .line 14
    :goto_0
    new-instance v0, Lcom/google/gson/JsonObject;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/google/gson/JsonObject;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v1, "sendGiftOriginalId"

    .line 20
    .line 21
    invoke-virtual {v0, v1, p1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/nei0$a;->a:Ll/xc00;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object v1, p0, Ll/nei0$a;->b:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p0, p0, Ll/nei0$a;->c:Ll/nei0;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p0, v0}, Ll/nei0;->o0(Ll/nei0;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string v0, "1"

    .line 43
    .line 44
    filled-new-array {v0, p0}, [Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-interface {p1, v1, p0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nei0$a;->a:Ll/xc00;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xc00;->d()Ll/hqq;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/nei0$a;->b:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "-1"

    .line 10
    .line 11
    filled-new-array {v1}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v0, p0, v1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nei0$a;->a:Ll/xc00;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xc00;->d()Ll/hqq;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/nei0$a;->b:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "0"

    .line 10
    .line 11
    filled-new-array {v1}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v0, p0, v1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
