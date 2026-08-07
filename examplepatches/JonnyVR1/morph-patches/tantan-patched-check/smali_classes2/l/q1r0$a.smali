.class final Ll/q1r0$a;
.super Ll/q1r0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/q1r0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field c:Ll/hwq0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/q1r0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/q1r0$a;->c:Ll/hwq0;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public b(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q1r0$a;->c:Ll/hwq0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/hwq0;->g(Landroid/content/Context;)Ll/hwq0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/q1r0$a;->c:Ll/hwq0;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/q1r0$a;->c:Ll/hwq0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/hwq0;->s()Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
