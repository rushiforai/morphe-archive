.class public Ll/d9g$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aiv$a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d9g;->s4(Ll/vvl;Ll/a8g;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/vvl;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

.field public final synthetic c:Ll/d9g;


# direct methods
.method public constructor <init>(Ll/d9g;Ll/vvl;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/d9g$a;->c:Ll/d9g;

    .line 2
    .line 3
    iput-object p2, p0, Ll/d9g$a;->a:Ll/vvl;

    .line 4
    .line 5
    iput-object p3, p0, Ll/d9g$a;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

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
    iget-object p1, p0, Ll/d9g$a;->c:Ll/d9g;

    .line 2
    .line 3
    iget-object v0, p0, Ll/d9g$a;->a:Ll/vvl;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/vvl;->b()Ll/ppq;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/d9g$a;->a:Ll/vvl;

    .line 10
    .line 11
    invoke-interface {v1}, Ll/vvl;->b()Ll/ppq;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/ppq;->a()Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object p0, p0, Ll/d9g$a;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 20
    .line 21
    invoke-static {p1, v0, v1, p0}, Ll/d9g;->j4(Ll/d9g;Ll/ppq;Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/d9g$a;->a:Ll/vvl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/vvl;->b()Ll/ppq;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/ppq;->b()Ll/y20;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "0"

    .line 12
    .line 13
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d9g$a;->c:Ll/d9g;

    .line 2
    .line 3
    invoke-static {v0}, Ll/d9g;->k4(Ll/d9g;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/m8g;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/m8g;->P()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/d9g$a;->a:Ll/vvl;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/vvl;->b()Ll/ppq;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/ppq;->b()Ll/y20;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "0"

    .line 23
    .line 24
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
