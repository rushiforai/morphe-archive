.class public Ll/asx;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static INSTANCE:Ll/asx;


# instance fields
.field public a:I

.field public b:I

.field public c:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    iput v0, p0, Ll/asx;->a:I

    .line 6
    .line 7
    iput v0, p0, Ll/asx;->b:I

    .line 8
    .line 9
    const/16 v0, 0x3c

    .line 10
    .line 11
    iput v0, p0, Ll/asx;->c:I

    .line 12
    .line 13
    return-void
.end method

.method public static h()Ll/asx;
    .locals 2

    .line 1
    sget-object v0, Ll/asx;->INSTANCE:Ll/asx;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/asx;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/asx;->INSTANCE:Ll/asx;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/asx;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/asx;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/asx;->INSTANCE:Ll/asx;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/asx;->INSTANCE:Ll/asx;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/asx;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/asx;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/asx;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method

.method public final f(Ljava/lang/String;)V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "videoalength"

    .line 7
    .line 8
    const/16 v1, 0x3c

    .line 9
    .line 10
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/16 v0, 0xf

    .line 15
    .line 16
    if-lt p1, v0, :cond_0

    .line 17
    .line 18
    iput p1, p0, Ll/asx;->c:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    :catch_0
    :cond_0
    return-void
.end method

.method public final g(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "horizontal_ratio"

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const-string v2, "vertical_ratio"

    .line 14
    .line 15
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput p1, p0, Ll/asx;->a:I

    .line 20
    .line 21
    iput v0, p0, Ll/asx;->b:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    :catch_0
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    iput v0, p0, Ll/asx;->a:I

    .line 3
    .line 4
    iput v0, p0, Ll/asx;->b:I

    .line 5
    .line 6
    const/16 v0, 0x3c

    .line 7
    .line 8
    iput v0, p0, Ll/asx;->c:I

    .line 9
    .line 10
    return-void
.end method

.method public j(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/asx;->f(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/asx;->g(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
