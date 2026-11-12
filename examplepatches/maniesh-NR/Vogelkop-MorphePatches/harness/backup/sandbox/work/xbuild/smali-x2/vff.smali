.class public final Lvff;
.super Lhy;
.source "SourceFile"


# instance fields
.field public final h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lt9f;Ljava/lang/String;Ldg7;Ljava/lang/String;)V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lhy;-><init>(Lt9f;Ljava/lang/String;Ljava/lang/Object;B)V

    iput-object p4, p0, Lvff;->h:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final e(Lfvh;)V
    .registers 4

    const-string v0, "accept"

    const-string v1, "application/json"

    invoke-virtual {p1, v0, v1}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "application/json; charset=UTF-8"

    sget-object v1, Lesd;->e:Lkotlin/text/Regex;

    :try_start_b
    invoke-static {v0}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v0
    :try_end_f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_b .. :try_end_f} :catch_10

    goto :goto_11

    :catch_10
    const/4 v0, 0x0

    :goto_11
    iget-object p0, p0, Lvff;->h:Ljava/lang/String;

    invoke-static {p0, v0}, Lrvh;->create(Ljava/lang/String;Lesd;)Lrvh;

    move-result-object p0

    const-string v0, "POST"

    invoke-virtual {p1, v0, p0}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    return-void
.end method
