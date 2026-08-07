.class public final Ll/yot0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eyu0;


# instance fields
.field public final a:Ll/ont0;

.field public final b:Ll/ept0;

.field public c:Ljava/lang/Long;

.field public d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ont0;Ll/ept0;Ll/xot0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yot0;->a:Ll/ont0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yot0;->b:Ll/ept0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(J)Ll/eyu0;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/yot0;->c:Ljava/lang/Long;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic zza(Ljava/lang/String;)Ll/eyu0;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yot0;->d:Ljava/lang/String;

    .line 5
    .line 6
    return-object p0
.end method

.method public final zzc()Ll/fyu0;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/yot0;->c:Ljava/lang/Long;

    .line 2
    .line 3
    const-class v1, Ljava/lang/Long;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/yot0;->d:Ljava/lang/String;

    .line 9
    .line 10
    const-class v1, Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    new-instance v2, Ll/apt0;

    .line 16
    .line 17
    iget-object v3, p0, Ll/yot0;->a:Ll/ont0;

    .line 18
    .line 19
    iget-object v4, p0, Ll/yot0;->b:Ll/ept0;

    .line 20
    .line 21
    iget-object v5, p0, Ll/yot0;->c:Ljava/lang/Long;

    .line 22
    .line 23
    iget-object v6, p0, Ll/yot0;->d:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v7, 0x0

    .line 26
    invoke-direct/range {v2 .. v7}, Ll/apt0;-><init>(Ll/ont0;Ll/ept0;Ljava/lang/Long;Ljava/lang/String;Ll/zot0;)V

    .line 27
    .line 28
    .line 29
    return-object v2
.end method
