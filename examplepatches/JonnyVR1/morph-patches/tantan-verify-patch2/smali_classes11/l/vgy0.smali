.class public final Ll/vgy0;
.super Ll/ldy0;
.source "SourceFile"


# static fields
.field public static final b:Ll/mky0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/vgy0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vgy0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/vgy0;->b:Ll/mky0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "CharMatcher.none()"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/ldy0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(C)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method
