.class public Ll/nsb0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/c2m;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nsb0;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


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


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ll/nsb0;->h:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    sget-object p0, Ll/nsb0;->i:Ll/wyd0;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b(Ll/ue60;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/nsb0;->g:Ll/wyd0;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/ue60;->c()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    sget-object p0, Ll/nsb0;->f:Ll/byd0;

    .line 17
    .line 18
    invoke-static {}, Ll/pzi0;->o()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public c(Ll/ue60;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/ve60;->g()Ll/ue60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Ll/nsb0;->g:Ll/wyd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ue60;->c()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
