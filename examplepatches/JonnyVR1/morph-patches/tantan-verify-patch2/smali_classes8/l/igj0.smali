.class public final Ll/igj0;
.super Ll/f2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/igj0$b;,
        Ll/igj0$a;
    }
.end annotation


# static fields
.field public static final INSTANCE:Ll/igj0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/igj0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/igj0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/igj0;->INSTANCE:Ll/igj0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(II)I
    .locals 0

    .line 1
    if-ge p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    if-ne p0, p1, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_1
    const/4 p0, 0x1

    .line 10
    return p0
.end method


# virtual methods
.method public createWorker()Ll/f2e0$a;
    .locals 0

    .line 1
    new-instance p0, Ll/igj0$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/igj0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
