.class public final Lxz6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lx5f;

.field public b:Z

.field public c:Z


# direct methods
.method public synthetic constructor <init>(Lx5f;)V
    .registers 2

    iput-object p1, p0, Lxz6;->a:Lx5f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Lsk4;)Ljava/lang/String;
    .registers 2

    if-eqz p0, :cond_17

    instance-of v0, p0, Lqk4;

    if-eqz v0, :cond_9

    const-string p0, "follow_national_team"

    return-object p0

    :cond_9
    instance-of v0, p0, Lpk4;

    if-eqz v0, :cond_10

    const-string p0, "follow_national_team_gb"

    return-object p0

    :cond_10
    instance-of p0, p0, Lrk4;

    if-eqz p0, :cond_17

    const-string p0, "pick_favorite_team"

    return-object p0

    :cond_17
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0
.end method
