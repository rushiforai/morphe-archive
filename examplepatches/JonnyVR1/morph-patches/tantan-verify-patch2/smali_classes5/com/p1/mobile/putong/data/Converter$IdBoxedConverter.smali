.class public Lcom/p1/mobile/putong/data/Converter$IdBoxedConverter;
.super Lcom/tantanapp/common/data/ConvertedJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Converter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IdBoxedConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ConvertedJsonAdapter<",
        "Lcom/p1/mobile/putong/data/IdBoxed;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private final type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/IdBoxed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/tantanapp/common/data/ConvertedJsonAdapter;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Converter$IdBoxedConverter;->type:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public from(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IdBoxed;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/data/IdBoxed;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Converter$IdBoxedConverter;->type:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {v0, p1, p0}, Lcom/p1/mobile/putong/data/IdBoxed;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public bridge synthetic from(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 13
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Converter$IdBoxedConverter;->from(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IdBoxed;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic to(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/data/IdBoxed;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Converter$IdBoxedConverter;->to(Lcom/p1/mobile/putong/data/IdBoxed;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public to(Lcom/p1/mobile/putong/data/IdBoxed;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Converter$IdBoxedConverter;->type:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/IdBoxed;->type:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method
