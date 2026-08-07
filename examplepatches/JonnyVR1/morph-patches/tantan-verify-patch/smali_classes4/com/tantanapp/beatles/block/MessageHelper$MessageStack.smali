.class public Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/block/MessageHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MessageStack"
.end annotation


# instance fields
.field private stacktrace:Ljava/lang/String;

.field private startTime:J


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

.method public static synthetic access$002(Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;->stacktrace:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$100(Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;->startTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$102(Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;->startTime:J

    .line 2
    .line 3
    return-wide p1
.end method


# virtual methods
.method public reset()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;->startTime:J

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;->stacktrace:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method
