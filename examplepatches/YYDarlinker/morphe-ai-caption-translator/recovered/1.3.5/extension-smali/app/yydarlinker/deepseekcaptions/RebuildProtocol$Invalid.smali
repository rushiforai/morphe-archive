.class final Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;
.super Ljava/lang/Exception;
.source "RebuildProtocol.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Invalid"
.end annotation


# instance fields
.field final code:Ljava/lang/String;

.field final detail:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 3

    .line 95
    const-string v0, ""

    invoke-direct {p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 96
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;->code:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/16 v0, 0x12c

    if-le p1, v0, :cond_12

    const/4 p1, 0x0

    invoke-virtual {p2, p1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    :cond_12
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;->detail:Ljava/lang/String;

    return-void
.end method
