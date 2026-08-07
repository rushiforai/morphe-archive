.class Lcom/p1/mobile/putong/live/external/module/external/VoiceConversationEntryImplInternal$2;
.super Ljava/util/LinkedHashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Ll/san0;


# direct methods
.method public constructor <init>(Ll/san0;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/module/external/VoiceConversationEntryImplInternal$2;->this$0:Ll/san0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p1, "\u6240\u6709\u4eba"

    .line 7
    .line 8
    const-string v0, "all"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const-string p1, "\u4ec5\u559c\u6b22\u8fc7\u7684\u4eba"

    .line 14
    .line 15
    const-string v0, "like"

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const-string p1, "\u4ec5\u597d\u53cb"

    .line 21
    .line 22
    const-string v0, "friend"

    .line 23
    .line 24
    invoke-virtual {p0, p1, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    const-string p1, "\u4e0d\u63a5\u6536"

    .line 28
    .line 29
    const-string v0, "none"

    .line 30
    .line 31
    invoke-virtual {p0, p1, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    return-void
.end method
