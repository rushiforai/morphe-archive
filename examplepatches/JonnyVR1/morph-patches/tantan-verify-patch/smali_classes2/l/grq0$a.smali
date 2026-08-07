.class Ll/grq0$a;
.super Ljava/lang/Object;

# interfaces
.implements Ll/vuq0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/grq0;->h(II)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Ll/grq0;


# direct methods
.method public constructor <init>(Ll/grq0;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/grq0$a;->b:Ll/grq0;

    .line 2
    .line 3
    iput-wide p2, p0, Ll/grq0$a;->a:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lorg/json/JSONObject;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/yxq0;->a()Ll/yxq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-wide v1, p0, Ll/grq0$a;->a:J

    .line 6
    .line 7
    iget-object p0, p0, Ll/grq0$a;->b:Ll/grq0;

    .line 8
    .line 9
    invoke-static {p0}, Ll/grq0;->k(Ll/grq0;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {v0, p1, v1, v2, p0}, Ll/yxq0;->b(Lorg/json/JSONObject;JZ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
