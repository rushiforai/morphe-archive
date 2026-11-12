.class public final Lhl;
.super Lll;
.source "SourceFile"


# instance fields
.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;IIIZLjava/util/TreeSet;Ljava/util/TreeSet;)V
    .registers 16

    sget-object v2, Lq50;->h:Lq50;

    sget-object v6, Liq;->b:Liq;

    move-object v0, p0

    move v1, p1

    move-object v3, p2

    move-object v4, p7

    move-object v5, p8

    invoke-direct/range {v0 .. v6}, Ldl;-><init>(ILq50;Ljava/lang/String;Ljava/util/TreeSet;Ljava/util/TreeSet;Liq;)V

    iput p3, v0, Lhl;->g:I

    iput p4, v0, Lhl;->h:I

    iput p5, v0, Lhl;->i:I

    iput-boolean p6, v0, Lhl;->j:Z

    return-void
.end method

.method public static c(Lorb;)Lhl;
    .registers 11

    const-string v0, "style"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lvep;->a(Ljava/lang/String;)I

    move-result v2

    new-instance v1, Lhl;

    const-string v0, "pid"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v0, p0, Lorb;->a:Lorg/json/JSONObject;

    const-string v4, "minIntervalInMinutes"

    const/16 v5, 0x3c

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    const-string v5, "maxCountPerDay"

    const/4 v6, 0x1

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    const-string v7, "clickCountBeforeShow"

    invoke-virtual {v0, v7, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    const-string v7, "onlyAfterNotificationClick"

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v7

    invoke-static {p0}, Ldl;->b(Lorb;)Ljava/util/TreeSet;

    move-result-object v8

    invoke-static {p0}, Ldl;->a(Lorb;)Ljava/util/TreeSet;

    move-result-object v9

    invoke-direct/range {v1 .. v9}, Lhl;-><init>(ILjava/lang/String;IIIZLjava/util/TreeSet;Ljava/util/TreeSet;)V

    return-object v1
.end method
