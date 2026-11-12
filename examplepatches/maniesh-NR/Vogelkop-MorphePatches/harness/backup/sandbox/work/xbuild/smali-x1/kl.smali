.class public final Lkl;
.super Lll;
.source "SourceFile"


# instance fields
.field public final g:J

.field public final h:Z

.field public final i:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;JZZLjava/util/TreeSet;Ljava/util/TreeSet;)V
    .registers 16

    sget-object v2, Lq50;->i:Lq50;

    sget-object v6, Liq;->c:Liq;

    move-object v0, p0

    move v1, p1

    move-object v3, p2

    move-object v4, p7

    move-object v5, p8

    invoke-direct/range {v0 .. v6}, Ldl;-><init>(ILq50;Ljava/lang/String;Ljava/util/TreeSet;Ljava/util/TreeSet;Liq;)V

    iput-wide p3, v0, Lkl;->g:J

    iput-boolean p5, v0, Lkl;->h:Z

    iput-boolean p6, v0, Lkl;->i:Z

    return-void
.end method

.method public static c(Lorb;)Lkl;
    .registers 11

    const-string v0, "style"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lvep;->a(Ljava/lang/String;)I

    move-result v2

    new-instance v1, Lkl;

    const-string v0, "pid"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v0, p0, Lorb;->a:Lorg/json/JSONObject;

    const-string v4, "refreshThresholdMs"

    const-wide/16 v5, 0x4e20

    invoke-virtual {v0, v4, v5, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    const-string v6, "replaceAfterClick"

    const/4 v7, 0x1

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v6

    const-string v8, "replaceOnRefresh"

    invoke-virtual {v0, v8, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v7

    invoke-static {p0}, Ldl;->b(Lorb;)Ljava/util/TreeSet;

    move-result-object v8

    invoke-static {p0}, Ldl;->a(Lorb;)Ljava/util/TreeSet;

    move-result-object v9

    invoke-direct/range {v1 .. v9}, Lkl;-><init>(ILjava/lang/String;JZZLjava/util/TreeSet;Ljava/util/TreeSet;)V

    return-object v1
.end method
