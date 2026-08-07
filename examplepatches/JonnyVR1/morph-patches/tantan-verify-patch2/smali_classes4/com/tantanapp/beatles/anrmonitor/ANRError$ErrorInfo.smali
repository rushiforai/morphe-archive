.class Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/anrmonitor/ANRError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ErrorInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final mName:Ljava/lang/String;

.field private final mStackTrace:[Ljava/lang/StackTraceElement;


# direct methods
.method private constructor <init>(Ljava/lang/String;[Ljava/lang/StackTraceElement;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;->mName:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;->mStackTrace:[Ljava/lang/StackTraceElement;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;[Ljava/lang/StackTraceElement;Lcom/tantanapp/beatles/anrmonitor/ANRError$a;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;-><init>(Ljava/lang/String;[Ljava/lang/StackTraceElement;)V

    return-void
.end method

.method public static synthetic access$000(Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;->mName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;)[Ljava/lang/StackTraceElement;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;->mStackTrace:[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    return-object p0
.end method
