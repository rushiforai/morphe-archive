.class public Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ga1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$a;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$a;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 0

    .line 1
    invoke-virtual {p5}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->isHighLevelBusiness()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    invoke-virtual {p5}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    invoke-virtual {p4, p1, p2, p3}, Ll/pb1;->g(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$a;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->o(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public success()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$a;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->o(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
