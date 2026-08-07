.class final Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Singleton;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Singleton"
.end annotation


# static fields
.field public static final INSTANCE:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Singleton;->INSTANCE:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
