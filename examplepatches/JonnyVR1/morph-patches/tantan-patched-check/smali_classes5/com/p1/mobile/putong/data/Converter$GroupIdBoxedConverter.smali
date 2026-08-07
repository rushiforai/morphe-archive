.class public Lcom/p1/mobile/putong/data/Converter$GroupIdBoxedConverter;
.super Lcom/p1/mobile/putong/data/Converter$IdBoxedConverter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Converter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GroupIdBoxedConverter"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/data/Converter$IdBoxedConverter;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic to(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/data/IdBoxed;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Converter$GroupIdBoxedConverter;->to(Lcom/p1/mobile/putong/data/IdBoxed;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public to(Lcom/p1/mobile/putong/data/IdBoxed;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "group"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/IdBoxed;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/data/Converter$IdBoxedConverter;->to(Lcom/p1/mobile/putong/data/IdBoxed;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
