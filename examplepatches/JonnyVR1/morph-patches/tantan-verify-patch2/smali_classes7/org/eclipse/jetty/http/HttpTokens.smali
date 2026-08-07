.class public interface abstract Lorg/eclipse/jetty/http/HttpTokens;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CARRIAGE_RETURN:B = 0xdt

.field public static final CHUNKED_CONTENT:I = -0x2

.field public static final COLON:B = 0x3at

.field public static final CRLF:[B

.field public static final EOF_CONTENT:I = -0x1

.field public static final LINE_FEED:B = 0xat

.field public static final NO_CONTENT:I = 0x0

.field public static final SELF_DEFINING_CONTENT:I = -0x4

.field public static final SEMI_COLON:B = 0x3bt

.field public static final SPACE:B = 0x20t

.field public static final TAB:B = 0x9t

.field public static final UNKNOWN_CONTENT:I = -0x3


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Lorg/eclipse/jetty/http/HttpTokens;->CRLF:[B

    .line 8
    .line 9
    return-void

    .line 10
    nop

    .line 11
    :array_0
    .array-data 1
        0xdt
        0xat
    .end array-data
.end method
