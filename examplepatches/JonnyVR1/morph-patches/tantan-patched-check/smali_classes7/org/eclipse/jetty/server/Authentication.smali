.class public interface abstract Lorg/eclipse/jetty/server/Authentication;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/server/Authentication$SendSuccess;,
        Lorg/eclipse/jetty/server/Authentication$Failure;,
        Lorg/eclipse/jetty/server/Authentication$Challenge;,
        Lorg/eclipse/jetty/server/Authentication$ResponseSent;,
        Lorg/eclipse/jetty/server/Authentication$Deferred;,
        Lorg/eclipse/jetty/server/Authentication$Wrapped;,
        Lorg/eclipse/jetty/server/Authentication$User;
    }
.end annotation


# static fields
.field public static final NOT_CHECKED:Lorg/eclipse/jetty/server/Authentication;

.field public static final SEND_CONTINUE:Lorg/eclipse/jetty/server/Authentication;

.field public static final SEND_FAILURE:Lorg/eclipse/jetty/server/Authentication;

.field public static final SEND_SUCCESS:Lorg/eclipse/jetty/server/Authentication;

.field public static final UNAUTHENTICATED:Lorg/eclipse/jetty/server/Authentication;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lorg/eclipse/jetty/server/Authentication$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/eclipse/jetty/server/Authentication$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lorg/eclipse/jetty/server/Authentication;->UNAUTHENTICATED:Lorg/eclipse/jetty/server/Authentication;

    .line 7
    .line 8
    new-instance v0, Lorg/eclipse/jetty/server/Authentication$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lorg/eclipse/jetty/server/Authentication$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lorg/eclipse/jetty/server/Authentication;->NOT_CHECKED:Lorg/eclipse/jetty/server/Authentication;

    .line 14
    .line 15
    new-instance v0, Lorg/eclipse/jetty/server/Authentication$3;

    .line 16
    .line 17
    invoke-direct {v0}, Lorg/eclipse/jetty/server/Authentication$3;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lorg/eclipse/jetty/server/Authentication;->SEND_CONTINUE:Lorg/eclipse/jetty/server/Authentication;

    .line 21
    .line 22
    new-instance v0, Lorg/eclipse/jetty/server/Authentication$4;

    .line 23
    .line 24
    invoke-direct {v0}, Lorg/eclipse/jetty/server/Authentication$4;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lorg/eclipse/jetty/server/Authentication;->SEND_FAILURE:Lorg/eclipse/jetty/server/Authentication;

    .line 28
    .line 29
    new-instance v0, Lorg/eclipse/jetty/server/Authentication$5;

    .line 30
    .line 31
    invoke-direct {v0}, Lorg/eclipse/jetty/server/Authentication$5;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lorg/eclipse/jetty/server/Authentication;->SEND_SUCCESS:Lorg/eclipse/jetty/server/Authentication;

    .line 35
    .line 36
    return-void
.end method
