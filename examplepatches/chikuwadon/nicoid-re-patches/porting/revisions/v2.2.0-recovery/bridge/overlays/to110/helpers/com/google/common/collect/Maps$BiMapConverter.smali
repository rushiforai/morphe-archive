.class final Lcom/google/common/collect/Maps$BiMapConverter;
.super Lcom/google/common/base/Converter;
.source "Maps.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Maps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "BiMapConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A:",
        "Ljava/lang/Object;",
        "B:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/base/Converter<",
        "TA;TB;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private final bimap:Lcom/google/common/collect/BiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/BiMap<",
            "TA;TB;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/BiMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bimap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/BiMap<",
            "TA;TB;>;)V"
        }
    .end annotation

    .line 1566
    invoke-direct {p0}, Lcom/google/common/base/Converter;-><init>()V

    .line 1567
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/collect/BiMap;

    iput-object p1, p0, Lcom/google/common/collect/Maps$BiMapConverter;->bimap:Lcom/google/common/collect/BiMap;

    return-void
.end method

.method private static convert(Lcom/google/common/collect/BiMap;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "bimap",
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            "Y:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/BiMap<",
            "TX;TY;>;TX;)TY;"
        }
    .end annotation

    .line 1581
    invoke-interface {p0, p1}, Lcom/google/common/collect/BiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1582
    :goto_0
    const-string v1, "No non-null mapping present for input: %s"

    invoke-static {v0, v1, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    return-object p0
.end method


# virtual methods
.method protected doBackward(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TB;)TA;"
        }
    .end annotation

    .line 1577
    iget-object p0, p0, Lcom/google/common/collect/Maps$BiMapConverter;->bimap:Lcom/google/common/collect/BiMap;

    invoke-interface {p0}, Lcom/google/common/collect/BiMap;->inverse()Lcom/google/common/collect/BiMap;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/google/common/collect/Maps$BiMapConverter;->convert(Lcom/google/common/collect/BiMap;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method protected doForward(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "a"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;)TB;"
        }
    .end annotation

    .line 1572
    iget-object p0, p0, Lcom/google/common/collect/Maps$BiMapConverter;->bimap:Lcom/google/common/collect/BiMap;

    invoke-static {p0, p1}, Lcom/google/common/collect/Maps$BiMapConverter;->convert(Lcom/google/common/collect/BiMap;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 1588
    instance-of v0, p1, Lcom/google/common/collect/Maps$BiMapConverter;

    if-eqz v0, :cond_0

    .line 1589
    check-cast p1, Lcom/google/common/collect/Maps$BiMapConverter;

    .line 1590
    iget-object p0, p0, Lcom/google/common/collect/Maps$BiMapConverter;->bimap:Lcom/google/common/collect/BiMap;

    iget-object p1, p1, Lcom/google/common/collect/Maps$BiMapConverter;->bimap:Lcom/google/common/collect/BiMap;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public hashCode()I
    .registers 1

    .line 1597
    iget-object p0, p0, Lcom/google/common/collect/Maps$BiMapConverter;->bimap:Lcom/google/common/collect/BiMap;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1603
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Maps.asConverter("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/common/collect/Maps$BiMapConverter;->bimap:Lcom/google/common/collect/BiMap;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
