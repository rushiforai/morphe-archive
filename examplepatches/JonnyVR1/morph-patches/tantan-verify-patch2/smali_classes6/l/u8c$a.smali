.class public Ll/u8c$a;
.super Ll/jv00;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/u8c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/u8c;


# direct methods
.method public constructor <init>(Ll/u8c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u8c$a;->a:Ll/u8c;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jv00;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/u8c$a;->a:Ll/u8c;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 12
    .line 13
    iput-object p1, p0, Ll/u8c;->e:Ljava/util/List;

    .line 14
    .line 15
    return-void
.end method
