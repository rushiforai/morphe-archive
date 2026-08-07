.class public Ll/tv;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z

.field public static b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    sput-object p0, Ll/tv;->b:Ljava/lang/String;

    .line 2
    .line 3
    sput-boolean p1, Ll/tv;->a:Z

    .line 4
    .line 5
    return-void
.end method

.method public static b(Ll/sy3;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/w24;->b()Ll/w24;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/w24;->f(Ll/sy3;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
