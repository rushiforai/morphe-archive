.class public abstract Ll/hv80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private a:Lcom/immomo/medialog/thread/Priority;

.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/immomo/medialog/thread/Priority;->LOW:Lcom/immomo/medialog/thread/Priority;

    .line 5
    .line 6
    iput-object v0, p0, Ll/hv80;->a:Lcom/immomo/medialog/thread/Priority;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Lcom/immomo/medialog/thread/Priority;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hv80;->a:Lcom/immomo/medialog/thread/Priority;

    .line 2
    .line 3
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    instance-of v0, p1, Ll/av80;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Ll/av80;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/av80;->b()Ljava/lang/Runnable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    instance-of v1, v0, Ll/hv80;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/hv80;->b:Ljava/lang/String;

    .line 17
    .line 18
    check-cast v0, Ll/hv80;

    .line 19
    .line 20
    iget-object p1, v0, Ll/hv80;->b:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_0
    if-eq p0, p1, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x1

    .line 32
    return p0
.end method
