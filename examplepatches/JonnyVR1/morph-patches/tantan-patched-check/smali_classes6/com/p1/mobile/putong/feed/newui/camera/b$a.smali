.class public Lcom/p1/mobile/putong/feed/newui/camera/b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/camera/b;->Q(Ll/y20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/camera/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/b;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b$a;->b:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/b$a;->a:Ll/y20;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Music;I)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b$a;->b:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/b;->H(Lcom/p1/mobile/putong/feed/newui/camera/b;)Ll/hz10;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/hz10;->u0()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b$a;->b:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/b;->I(Lcom/p1/mobile/putong/feed/newui/camera/b;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b$a;->b:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 17
    .line 18
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/b;->K(Lcom/p1/mobile/putong/feed/newui/camera/b;I)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b$a;->b:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 26
    .line 27
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/feed/newui/camera/b;->J(Lcom/p1/mobile/putong/feed/newui/camera/b;I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b$a;->b:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/b;->G(Lcom/p1/mobile/putong/feed/newui/camera/b;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne v0, p2, :cond_0

    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p2, 0x0

    .line 12
    :goto_0
    if-eqz p2, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b$a;->b:Lcom/p1/mobile/putong/feed/newui/camera/b;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/b;->I(Lcom/p1/mobile/putong/feed/newui/camera/b;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b$a;->a:Ll/y20;

    .line 22
    .line 23
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return p2
.end method
