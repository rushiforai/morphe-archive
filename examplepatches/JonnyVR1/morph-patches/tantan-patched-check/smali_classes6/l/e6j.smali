.class public final Ll/e6j;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000e\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u000b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0008\u0010\t\u001a\u0004\u0008\n\u0010\u000bR\"\u0010\u0013\u001a\u00020\u000c8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\r\u0010\u000e\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012R\"\u0010\u0018\u001a\u00020\u00028\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0014\u0010\t\u001a\u0004\u0008\u0015\u0010\u000b\"\u0004\u0008\u0016\u0010\u0017R\"\u0010\u001e\u001a\u00020\u00198\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000f\u0010\u001a\u001a\u0004\u0008\u0008\u0010\u001b\"\u0004\u0008\u001c\u0010\u001dR\"\u0010 \u001a\u00020\u00198\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0015\u0010\u001a\u001a\u0004\u0008\r\u0010\u001b\"\u0004\u0008\u001f\u0010\u001dR\"\u0010#\u001a\u00020\u00028\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008!\u0010\t\u001a\u0004\u0008\u0014\u0010\u000b\"\u0004\u0008\"\u0010\u0017\u00a8\u0006$"
    }
    d2 = {
        "Ll/e6j;",
        "",
        "",
        "index",
        "Lorg/json/JSONObject;",
        "json",
        "<init>",
        "(ILorg/json/JSONObject;)V",
        "a",
        "I",
        "getIndex",
        "()I",
        "",
        "b",
        "Ljava/lang/String;",
        "d",
        "()Ljava/lang/String;",
        "setSrcId",
        "(Ljava/lang/String;)V",
        "srcId",
        "c",
        "e",
        "setZ",
        "(I)V",
        "z",
        "Ll/mi80;",
        "Ll/mi80;",
        "()Ll/mi80;",
        "setFrame",
        "(Ll/mi80;)V",
        "frame",
        "setMFrame",
        "mFrame",
        "f",
        "setMt",
        "mt",
        "base_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:I

.field public b:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public c:I

.field public d:Ll/mi80;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public e:Ll/mi80;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public f:I


# direct methods
.method public constructor <init>(ILorg/json/JSONObject;)V
    .locals 8
    .param p2    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput p1, p0, Ll/e6j;->a:I

    .line 8
    .line 9
    const-string p1, ""

    .line 10
    .line 11
    iput-object p1, p0, Ll/e6j;->b:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "srcId"

    .line 14
    .line 15
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/e6j;->b:Ljava/lang/String;

    .line 23
    .line 24
    const-string p1, "z"

    .line 25
    .line 26
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Ll/e6j;->c:I

    .line 31
    .line 32
    const-string p1, "frame"

    .line 33
    .line 34
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v0, Ll/mi80;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getInt(I)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    const/4 v3, 0x1

    .line 46
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getInt(I)I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    const/4 v5, 0x2

    .line 51
    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->getInt(I)I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    const/4 v7, 0x3

    .line 56
    invoke-virtual {p1, v7}, Lorg/json/JSONArray;->getInt(I)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-direct {v0, v2, v4, v6, p1}, Ll/mi80;-><init>(IIII)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Ll/e6j;->d:Ll/mi80;

    .line 64
    .line 65
    const-string p1, "mFrame"

    .line 66
    .line 67
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    new-instance v0, Ll/mi80;

    .line 72
    .line 73
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getInt(I)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getInt(I)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->getInt(I)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    invoke-virtual {p1, v7}, Lorg/json/JSONArray;->getInt(I)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-direct {v0, v1, v2, v3, p1}, Ll/mi80;-><init>(IIII)V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Ll/e6j;->e:Ll/mi80;

    .line 93
    .line 94
    const-string p1, "mt"

    .line 95
    .line 96
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    iput p1, p0, Ll/e6j;->f:I

    .line 101
    .line 102
    return-void
.end method


# virtual methods
.method public final a()Ll/mi80;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/e6j;->d:Ll/mi80;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ll/mi80;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/e6j;->e:Ll/mi80;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/e6j;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public final d()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/e6j;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/e6j;->c:I

    .line 2
    .line 3
    return p0
.end method
