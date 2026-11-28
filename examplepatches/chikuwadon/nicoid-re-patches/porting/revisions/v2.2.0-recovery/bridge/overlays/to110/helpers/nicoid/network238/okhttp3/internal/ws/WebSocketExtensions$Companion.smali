.class public final Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\n"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions$Companion;",
        "",
        "<init>",
        "()V",
        "HEADER_WEB_SOCKET_EXTENSION",
        "",
        "parse",
        "Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;",
        "responseHeaders",
        "Lnicoid/network238/okhttp3/Headers;",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final parse(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;
    .registers 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 101
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_0
    if-ge v4, v1, :cond_13

    .line 102
    invoke-virtual {v0, v4}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v5

    const-string v12, "Sec-WebSocket-Extensions"

    const/4 v13, 0x1

    invoke-static {v5, v12, v13}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_0

    goto/16 :goto_7

    .line 105
    :cond_0
    invoke-virtual {v0, v4}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v14

    const/4 v5, 0x0

    .line 109
    :goto_1
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v12

    if-ge v5, v12, :cond_12

    .line 110
    const/16 v15, 0x2c

    const/16 v17, 0x0

    const/16 v18, 0x4

    const/16 v19, 0x0

    move/from16 v16, v5

    invoke-static/range {v14 .. v19}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset$default(Ljava/lang/String;CIIILjava/lang/Object;)I

    move-result v5

    .line 111
    move/from16 v12, v16

    const/16 v15, 0x3b

    invoke-static {v14, v15, v12, v5}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;CII)I

    move-result v2

    .line 112
    invoke-static {v14, v12, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->trimSubstring(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v12

    add-int/2addr v2, v13

    .line 116
    const-string v3, "permessage-deflate"

    invoke-static {v12, v3, v13}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_11

    if-eqz v6, :cond_1

    move v11, v13

    :cond_1
    :goto_2
    if-ge v2, v5, :cond_10

    .line 122
    invoke-static {v14, v15, v2, v5}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;CII)I

    move-result v3

    .line 123
    const/16 v6, 0x3d

    invoke-static {v14, v6, v2, v3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;CII)I

    move-result v6

    .line 124
    invoke-static {v14, v2, v6}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->trimSubstring(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v2

    if-ge v6, v3, :cond_2

    add-int/lit8 v6, v6, 0x1

    .line 127
    invoke-static {v14, v6, v3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->trimSubstring(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v6

    const-string v12, "\""

    invoke-static {v6, v12}, Lnicoid/network238/kotlin/text/StringsKt;->removeSurrounding(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    goto :goto_3

    :cond_2
    const/4 v6, 0x0

    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 133
    const-string v12, "client_max_window_bits"

    invoke-static {v2, v12, v13}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_5

    if-eqz v7, :cond_3

    move v11, v13

    :cond_3
    if-eqz v6, :cond_4

    .line 135
    invoke-static {v6}, Lnicoid/network238/kotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_4

    :cond_4
    const/4 v2, 0x0

    :goto_4
    move-object v7, v2

    if-nez v2, :cond_b

    goto :goto_6

    .line 139
    :cond_5
    const-string v12, "client_no_context_takeover"

    invoke-static {v2, v12, v13}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_8

    if-eqz v8, :cond_6

    move v11, v13

    :cond_6
    if-eqz v6, :cond_7

    move v11, v13

    :cond_7
    move v2, v3

    move v8, v13

    goto :goto_2

    .line 145
    :cond_8
    const-string v12, "server_max_window_bits"

    invoke-static {v2, v12, v13}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_c

    if-eqz v9, :cond_9

    move v11, v13

    :cond_9
    if-eqz v6, :cond_a

    .line 147
    invoke-static {v6}, Lnicoid/network238/kotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_5

    :cond_a
    const/4 v2, 0x0

    :goto_5
    move-object v9, v2

    if-eqz v2, :cond_f

    :cond_b
    move v2, v3

    goto :goto_2

    .line 151
    :cond_c
    const-string v12, "server_no_context_takeover"

    invoke-static {v2, v12, v13}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_f

    if-eqz v10, :cond_d

    move v11, v13

    :cond_d
    if-eqz v6, :cond_e

    move v11, v13

    :cond_e
    move v2, v3

    move v10, v13

    goto :goto_2

    :cond_f
    :goto_6
    move v2, v3

    move v11, v13

    goto :goto_2

    .line 116
    :cond_10
    move v5, v2

    move v6, v13

    goto/16 :goto_1

    .line 151
    :cond_11
    move v5, v2

    move v11, v13

    goto/16 :goto_1

    :cond_12
    :goto_7
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 171
    :cond_13
    new-instance v5, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;

    invoke-direct/range {v5 .. v11}, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;-><init>(ZLjava/lang/Integer;ZLjava/lang/Integer;ZZ)V

    return-object v5
.end method
