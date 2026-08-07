.class public Ll/w6u;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/l4g0;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/l4g0;->e()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static b(Ll/l4g0;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l4g0;->c()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static c(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 7
    .line 8
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 9
    .line 10
    const-string v1, "p_audio_explore_recommend"

    .line 11
    .line 12
    iput-object v1, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "audio_tab_id"

    .line 15
    .line 16
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {p0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {v0, p0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
