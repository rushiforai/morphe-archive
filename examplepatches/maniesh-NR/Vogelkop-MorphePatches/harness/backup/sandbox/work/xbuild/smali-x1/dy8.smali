.class public abstract Ldy8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Ldy8;->a:Ljava/lang/String;

    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Ldy8;->b:J

    return-void
.end method

.method public constructor <init>(Lorb;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ldy8;->a:Ljava/lang/String;

    const-string p2, "ts"

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide p1

    const-wide/16 v0, 0x3e8

    mul-long/2addr p1, v0

    iput-wide p1, p0, Ldy8;->b:J

    return-void
.end method


# virtual methods
.method public a(Lorb;)V
    .registers 6

    const-string v0, "event_type"

    iget-object v1, p0, Ldy8;->a:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-wide v0, p0, Ldy8;->b:J

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    const-string p0, "ts"

    invoke-virtual {p1, v0, v1, p0}, Lorb;->o(JLjava/lang/String;)V

    return-void
.end method
