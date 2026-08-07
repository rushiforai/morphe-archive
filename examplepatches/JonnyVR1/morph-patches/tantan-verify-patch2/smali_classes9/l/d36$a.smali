.class public Ll/d36$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/d36;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a(Ll/d36$a;)Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d36$a;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/d36$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/d36$a;->a:Z

    return p0
.end method


# virtual methods
.method public c()Ll/d36;
    .locals 1

    .line 1
    new-instance v0, Ll/d36;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/d36;-><init>(Ll/d36$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/d36$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d36$a;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Z)Ll/d36$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/d36$a;->a:Z

    .line 2
    .line 3
    return-object p0
.end method
