.class public final Lcom/momo/xeengine/svgaplayer/proto/Transform;
.super Lcom/squareup/wire/Message;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/svgaplayer/proto/Transform$ProtoAdapter_Transform;,
        Lcom/momo/xeengine/svgaplayer/proto/Transform$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message<",
        "Lcom/momo/xeengine/svgaplayer/proto/Transform;",
        "Lcom/momo/xeengine/svgaplayer/proto/Transform$Builder;",
        ">;"
    }
.end annotation


# static fields
.field public static final ADAPTER:Lcom/squareup/wire/ProtoAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/wire/ProtoAdapter<",
            "Lcom/momo/xeengine/svgaplayer/proto/Transform;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_A:Ljava/lang/Float;

.field public static final DEFAULT_B:Ljava/lang/Float;

.field public static final DEFAULT_C:Ljava/lang/Float;

.field public static final DEFAULT_D:Ljava/lang/Float;

.field public static final DEFAULT_TX:Ljava/lang/Float;

.field public static final DEFAULT_TY:Ljava/lang/Float;

.field private static final serialVersionUID:J


# instance fields
.field public final a:Ljava/lang/Float;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#FLOAT"
        tag = 0x1
    .end annotation
.end field

.field public final b:Ljava/lang/Float;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#FLOAT"
        tag = 0x2
    .end annotation
.end field

.field public final c:Ljava/lang/Float;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#FLOAT"
        tag = 0x3
    .end annotation
.end field

.field public final d:Ljava/lang/Float;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#FLOAT"
        tag = 0x4
    .end annotation
.end field

.field public final tx:Ljava/lang/Float;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#FLOAT"
        tag = 0x5
    .end annotation
.end field

.field public final ty:Ljava/lang/Float;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.squareup.wire.ProtoAdapter#FLOAT"
        tag = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/xeengine/svgaplayer/proto/Transform$ProtoAdapter_Transform;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/xeengine/svgaplayer/proto/Transform$ProtoAdapter_Transform;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->DEFAULT_A:Ljava/lang/Float;

    .line 14
    .line 15
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->DEFAULT_B:Ljava/lang/Float;

    .line 16
    .line 17
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->DEFAULT_C:Ljava/lang/Float;

    .line 18
    .line 19
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->DEFAULT_D:Ljava/lang/Float;

    .line 20
    .line 21
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->DEFAULT_TX:Ljava/lang/Float;

    .line 22
    .line 23
    sput-object v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->DEFAULT_TY:Ljava/lang/Float;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;)V
    .locals 8

    .line 19
    sget-object v7, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/momo/xeengine/svgaplayer/proto/Transform;-><init>(Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Lokio/ByteString;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Lokio/ByteString;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 2
    .line 3
    invoke-direct {p0, v0, p7}, Lcom/squareup/wire/Message;-><init>(Lcom/squareup/wire/ProtoAdapter;Lokio/ByteString;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->a:Ljava/lang/Float;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->b:Ljava/lang/Float;

    .line 9
    .line 10
    iput-object p3, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->c:Ljava/lang/Float;

    .line 11
    .line 12
    iput-object p4, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->d:Ljava/lang/Float;

    .line 13
    .line 14
    iput-object p5, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->tx:Ljava/lang/Float;

    .line 15
    .line 16
    iput-object p6, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->ty:Ljava/lang/Float;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/momo/xeengine/svgaplayer/proto/Transform;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/momo/xeengine/svgaplayer/proto/Transform;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v1, v3}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->a:Ljava/lang/Float;

    .line 28
    .line 29
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/Transform;->a:Ljava/lang/Float;

    .line 30
    .line 31
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->b:Ljava/lang/Float;

    .line 38
    .line 39
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/Transform;->b:Ljava/lang/Float;

    .line 40
    .line 41
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->c:Ljava/lang/Float;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/Transform;->c:Ljava/lang/Float;

    .line 50
    .line 51
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->d:Ljava/lang/Float;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/Transform;->d:Ljava/lang/Float;

    .line 60
    .line 61
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->tx:Ljava/lang/Float;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/momo/xeengine/svgaplayer/proto/Transform;->tx:Ljava/lang/Float;

    .line 70
    .line 71
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->ty:Ljava/lang/Float;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/momo/xeengine/svgaplayer/proto/Transform;->ty:Ljava/lang/Float;

    .line 80
    .line 81
    invoke-static {p0, p1}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_2

    .line 86
    .line 87
    return v0

    .line 88
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/squareup/wire/Message;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lokio/ByteString;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    mul-int/lit8 v0, v0, 0x25

    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->a:Ljava/lang/Float;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v1, v2

    .line 26
    :goto_0
    add-int/2addr v0, v1

    .line 27
    mul-int/lit8 v0, v0, 0x25

    .line 28
    .line 29
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->b:Ljava/lang/Float;

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move v1, v2

    .line 39
    :goto_1
    add-int/2addr v0, v1

    .line 40
    mul-int/lit8 v0, v0, 0x25

    .line 41
    .line 42
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->c:Ljava/lang/Float;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    goto :goto_2

    .line 51
    :cond_2
    move v1, v2

    .line 52
    :goto_2
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x25

    .line 54
    .line 55
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->d:Ljava/lang/Float;

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    goto :goto_3

    .line 64
    :cond_3
    move v1, v2

    .line 65
    :goto_3
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x25

    .line 67
    .line 68
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->tx:Ljava/lang/Float;

    .line 69
    .line 70
    if-eqz v1, :cond_4

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    goto :goto_4

    .line 77
    :cond_4
    move v1, v2

    .line 78
    :goto_4
    add-int/2addr v0, v1

    .line 79
    mul-int/lit8 v0, v0, 0x25

    .line 80
    .line 81
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->ty:Ljava/lang/Float;

    .line 82
    .line 83
    if-eqz v1, :cond_5

    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    :cond_5
    add-int/2addr v0, v2

    .line 90
    iput v0, p0, Lcom/squareup/wire/Message;->hashCode:I

    .line 91
    .line 92
    :cond_6
    return v0
.end method

.method public newBuilder()Lcom/momo/xeengine/svgaplayer/proto/Transform$Builder;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/xeengine/svgaplayer/proto/Transform$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/xeengine/svgaplayer/proto/Transform$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->a:Ljava/lang/Float;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/Transform$Builder;->a:Ljava/lang/Float;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->b:Ljava/lang/Float;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/Transform$Builder;->b:Ljava/lang/Float;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->c:Ljava/lang/Float;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/Transform$Builder;->c:Ljava/lang/Float;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->d:Ljava/lang/Float;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/Transform$Builder;->d:Ljava/lang/Float;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->tx:Ljava/lang/Float;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/Transform$Builder;->tx:Ljava/lang/Float;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->ty:Ljava/lang/Float;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/momo/xeengine/svgaplayer/proto/Transform$Builder;->ty:Ljava/lang/Float;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lcom/squareup/wire/Message$Builder;->addUnknownFields(Lokio/ByteString;)Lcom/squareup/wire/Message$Builder;

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public bridge synthetic newBuilder()Lcom/squareup/wire/Message$Builder;
    .locals 0

    .line 38
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/proto/Transform;->newBuilder()Lcom/momo/xeengine/svgaplayer/proto/Transform$Builder;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->a:Ljava/lang/Float;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const-string v1, ", a="

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->a:Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->b:Ljava/lang/Float;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const-string v1, ", b="

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->b:Ljava/lang/Float;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->c:Ljava/lang/Float;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    const-string v1, ", c="

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->c:Ljava/lang/Float;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->d:Ljava/lang/Float;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    const-string v1, ", d="

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->d:Ljava/lang/Float;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    :cond_3
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->tx:Ljava/lang/Float;

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    const-string v1, ", tx="

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->tx:Ljava/lang/Float;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    :cond_4
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->ty:Ljava/lang/Float;

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    const-string v1, ", ty="

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/proto/Transform;->ty:Ljava/lang/Float;

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    :cond_5
    const/4 p0, 0x2

    .line 91
    const-string v1, "Transform{"

    .line 92
    .line 93
    const/4 v2, 0x0

    .line 94
    invoke-virtual {v0, v2, p0, v1}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const/16 v0, 0x7d

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0
.end method
