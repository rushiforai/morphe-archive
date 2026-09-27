.class Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;
.super Ljava/lang/Object;
.source "CaptionDocument.java"

# interfaces
.implements Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->parseBlockFormat(Ljava/lang/String;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$blocks:Ljava/util/List;

.field final synthetic val$contentType:Ljava/lang/String;

.field final synthetic val$cueIndexes:Ljava/util/List;

.field final synthetic val$cues:Ljava/util/List;

.field final synthetic val$newline:Ljava/lang/String;

.field final synthetic val$texts:Ljava/util/List;


# direct methods
.method constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 236
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$texts:Ljava/util/List;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$cues:Ljava/util/List;

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$contentType:Ljava/lang/String;

    iput-object p4, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$cueIndexes:Ljava/util/List;

    iput-object p5, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$blocks:Ljava/util/List;

    iput-object p6, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$newline:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public contentType()Ljava/lang/String;
    .registers 1

    .line 239
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$contentType:Ljava/lang/String;

    return-object p0
.end method

.method public cues()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;",
            ">;"
        }
    .end annotation

    .line 238
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$cues:Ljava/util/List;

    return-object p0
.end method

.method public render(Ljava/util/List;)[B
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)[B"
        }
    .end annotation

    .line 243
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$texts:Ljava/util/List;

    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->-$$Nest$smrequireSameSize(Ljava/util/List;Ljava/util/List;)V

    const/4 v0, 0x0

    move v1, v0

    .line 244
    :goto_7
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$cueIndexes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_67

    .line 245
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$cueIndexes:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 246
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$blocks:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "\\r?\\n"

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    move v4, v0

    .line 248
    :goto_2b
    array-length v6, v3

    if-ge v4, v6, :cond_3d

    .line 249
    aget-object v6, v3, v4

    const-string v7, " --> "

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3a

    move v5, v4

    goto :goto_3d

    :cond_3a
    add-int/lit8 v4, v4, 0x1

    goto :goto_2b

    :cond_3d
    :goto_3d
    if-gez v5, :cond_40

    goto :goto_64

    .line 255
    :cond_40
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    add-int/lit8 v5, v5, 0x1

    .line 256
    invoke-static {v3, v0, v5}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    invoke-static {v4, v3}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 257
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 258
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$blocks:Ljava/util/List;

    iget-object v5, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$newline:Ljava/lang/String;

    invoke-static {v5, v4}, Lapp/yydarlinker/deepseekcaptions/RebuildClock$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :goto_64
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 260
    :cond_67
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$newline:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$newline:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$blocks:Ljava/util/List;

    invoke-static {p1, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildClock$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    sget-object p1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    return-object p0
.end method

.method public texts()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 237
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;->val$texts:Ljava/util/List;

    return-object p0
.end method
