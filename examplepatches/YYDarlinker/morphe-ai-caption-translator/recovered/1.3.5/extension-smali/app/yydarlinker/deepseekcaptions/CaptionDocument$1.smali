.class Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;
.super Ljava/lang/Object;
.source "CaptionDocument.java"

# interfaces
.implements Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->parseJson3(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cueEvents:Ljava/util/List;

.field final synthetic val$cues:Ljava/util/List;

.field final synthetic val$root:Lorg/json/JSONObject;

.field final synthetic val$texts:Ljava/util/List;


# direct methods
.method constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Lorg/json/JSONObject;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 101
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;->val$texts:Ljava/util/List;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;->val$cues:Ljava/util/List;

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;->val$cueEvents:Ljava/util/List;

    iput-object p4, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;->val$root:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public contentType()Ljava/lang/String;
    .registers 1

    .line 104
    const-string p0, "application/json; charset=utf-8"

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

    .line 103
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;->val$cues:Ljava/util/List;

    return-object p0
.end method

.method public render(Ljava/util/List;)[B
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 108
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;->val$texts:Ljava/util/List;

    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->-$$Nest$smrequireSameSize(Ljava/util/List;Ljava/util/List;)V

    const/4 v0, 0x0

    move v1, v0

    .line 109
    :goto_7
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;->val$cueEvents:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_4c

    .line 110
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;->val$cueEvents:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    const-string v3, "segs"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 111
    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_2b

    .line 113
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 114
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    .line 116
    :cond_2b
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    const-string v5, "utf8"

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const/4 v3, 0x1

    .line 117
    :goto_35
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_49

    .line 118
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_46

    .line 119
    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_46
    add-int/lit8 v3, v3, 0x1

    goto :goto_35

    :cond_49
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 122
    :cond_4c
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;->val$root:Lorg/json/JSONObject;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

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

    .line 102
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;->val$texts:Ljava/util/List;

    return-object p0
.end method
