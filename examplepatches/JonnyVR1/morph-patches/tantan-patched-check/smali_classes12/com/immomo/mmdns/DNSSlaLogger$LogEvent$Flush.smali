.class public final Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Flush;
.super Lcom/immomo/mmdns/DNSSlaLogger$LogEvent;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mmdns/DNSSlaLogger$LogEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Flush"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Flush;",
        "Lcom/immomo/mmdns/DNSSlaLogger$LogEvent;",
        "()V",
        "mmdns_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Flush;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Flush;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Flush;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Flush;->INSTANCE:Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Flush;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
