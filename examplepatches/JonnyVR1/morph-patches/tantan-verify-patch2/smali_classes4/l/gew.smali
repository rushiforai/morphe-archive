.class public Ll/gew;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z6m;


# static fields
.field public static b:Ll/gew;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/gew;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gew;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/gew;->b:Ll/gew;

    .line 7
    .line 8
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

.method public static d()Ll/gew;
    .locals 1

    .line 1
    sget-object v0, Ll/gew;->b:Ll/gew;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public b(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    const-string p0, "#E4B155"

    .line 2
    .line 3
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 p1, 0x3

    .line 8
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string p2, "\u4e00\u5c01\u60c5\u4e66"

    .line 13
    .line 14
    invoke-static {p2, p0, p1}, Ll/c17;->t0(Ljava/lang/String;ILandroid/graphics/Typeface;)Ljava/lang/CharSequence;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
