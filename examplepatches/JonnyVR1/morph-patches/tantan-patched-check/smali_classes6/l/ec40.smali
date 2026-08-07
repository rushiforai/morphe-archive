.class public final synthetic Ll/ec40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Audio;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/util/ArrayList;

.field public final synthetic e:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Lcom/p1/mobile/putong/data/Audio;Ljava/lang/String;Ljava/util/ArrayList;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ec40;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    iput-object p2, p0, Ll/ec40;->b:Lcom/p1/mobile/putong/data/Audio;

    iput-object p3, p0, Ll/ec40;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/ec40;->d:Ljava/util/ArrayList;

    iput-object p5, p0, Ll/ec40;->e:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ec40;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    iget-object v1, p0, Ll/ec40;->b:Lcom/p1/mobile/putong/data/Audio;

    iget-object v2, p0, Ll/ec40;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/ec40;->d:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/ec40;->e:Ll/x20;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->x0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Lcom/p1/mobile/putong/data/Audio;Ljava/lang/String;Ljava/util/ArrayList;Ll/x20;)V

    return-void
.end method
