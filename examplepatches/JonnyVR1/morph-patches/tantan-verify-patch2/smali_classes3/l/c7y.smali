.class public Ll/c7y;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:I = 0x1

.field public static b:I = 0x3

.field public static c:Ljava/lang/String; = "e_play_video"

.field public static d:Ljava/lang/String; = "e_video_first_render"

.field public static e:Ljava/lang/String; = "e_video_play_block"

.field public static f:Ljava/lang/String; = "e_video_play_error"

.field public static g:Ljava/lang/String; = "video_player_type"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(IIZ)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    const-string v1, "Player Error what: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 9
    .line 10
    .line 11
    const-string p0, "; Player Error extra: "

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 17
    .line 18
    .line 19
    const-string p0, "; Network Avaliable: "

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 22
    .line 23
    .line 24
    xor-int/lit8 p0, p2, 0x1

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static b(JJLjava/lang/String;I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "video_block_start_time"

    .line 7
    .line 8
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    const-string p0, "video_block_end_time"

    .line 16
    .line 17
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    const-string p0, "video_play_url"

    .line 25
    .line 26
    invoke-virtual {v0, p0, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    sget-object p0, Ll/c7y;->g:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    new-instance p0, Ll/q4f;

    .line 39
    .line 40
    invoke-direct {p0}, Ll/q4f;-><init>()V

    .line 41
    .line 42
    .line 43
    sget-object p1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 44
    .line 45
    iput-object p1, p0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 46
    .line 47
    sget-object p1, Ll/c7y;->e:Ljava/lang/String;

    .line 48
    .line 49
    iput-object p1, p0, Ll/q4f;->s:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p0, v0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static c(JJLjava/lang/String;I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "video_play_time"

    .line 7
    .line 8
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    const-string p0, "first_render_time"

    .line 16
    .line 17
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    const-string p0, "video_play_url"

    .line 25
    .line 26
    invoke-virtual {v0, p0, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    sget-object p0, Ll/c7y;->g:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    new-instance p0, Ll/q4f;

    .line 39
    .line 40
    invoke-direct {p0}, Ll/q4f;-><init>()V

    .line 41
    .line 42
    .line 43
    sget-object p1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 44
    .line 45
    iput-object p1, p0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 46
    .line 47
    sget-object p1, Ll/c7y;->d:Ljava/lang/String;

    .line 48
    .line 49
    iput-object p1, p0, Ll/q4f;->s:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p0, v0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static d(JILjava/lang/String;I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "video_play_time"

    .line 7
    .line 8
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    const-string p0, "video_play_count"

    .line 16
    .line 17
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    const-string p0, "video_play_url"

    .line 25
    .line 26
    invoke-virtual {v0, p0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    sget-object p0, Ll/c7y;->g:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    new-instance p0, Ll/q4f;

    .line 39
    .line 40
    invoke-direct {p0}, Ll/q4f;-><init>()V

    .line 41
    .line 42
    .line 43
    sget-object p1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 44
    .line 45
    iput-object p1, p0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 46
    .line 47
    sget-object p1, Ll/c7y;->c:Ljava/lang/String;

    .line 48
    .line 49
    iput-object p1, p0, Ll/q4f;->s:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p0, v0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static e(IIZLjava/lang/String;I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "video_play_error"

    .line 7
    .line 8
    invoke-static {p0, p1, p2}, Ll/c7y;->a(IIZ)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    const-string p0, "video_play_url"

    .line 16
    .line 17
    invoke-virtual {v0, p0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    sget-object p0, Ll/c7y;->g:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/q4f;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/q4f;-><init>()V

    .line 32
    .line 33
    .line 34
    sget-object p1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 35
    .line 36
    iput-object p1, p0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 37
    .line 38
    sget-object p1, Ll/c7y;->f:Ljava/lang/String;

    .line 39
    .line 40
    iput-object p1, p0, Ll/q4f;->s:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {p0, v0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
