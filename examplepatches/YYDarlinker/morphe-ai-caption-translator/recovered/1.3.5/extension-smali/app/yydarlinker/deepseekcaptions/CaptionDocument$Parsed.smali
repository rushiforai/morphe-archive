.class interface abstract Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;
.super Ljava/lang/Object;
.source "CaptionDocument.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionDocument;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "Parsed"
.end annotation


# virtual methods
.method public abstract contentType()Ljava/lang/String;
.end method

.method public abstract cues()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;",
            ">;"
        }
    .end annotation
.end method

.method public abstract render(Ljava/util/List;)[B
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
.end method

.method public abstract texts()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method
