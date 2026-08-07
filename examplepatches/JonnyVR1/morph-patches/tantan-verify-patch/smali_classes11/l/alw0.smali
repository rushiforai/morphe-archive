.class public final Ll/alw0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/ykw0;

.field public static final b:Ll/alw0;

.field public static volatile c:Ll/alw0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/zkw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zkw0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/alw0;->a:Ll/ykw0;

    .line 7
    .line 8
    new-instance v0, Ll/alw0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/alw0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/alw0;->b:Ll/alw0;

    .line 14
    .line 15
    sput-object v0, Ll/alw0;->c:Ll/alw0;

    .line 16
    .line 17
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

.method public static a()Ll/alw0;
    .locals 1

    .line 1
    sget-object v0, Ll/alw0;->c:Ll/alw0;

    .line 2
    .line 3
    return-object v0
.end method
