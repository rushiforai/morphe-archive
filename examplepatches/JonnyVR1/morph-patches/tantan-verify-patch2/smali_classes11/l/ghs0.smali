.class public abstract Ll/ghs0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/ghs0;

.field public static final b:Ll/ghs0;

.field public static final c:Ll/ghs0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/dhs0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/dhs0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ghs0;->a:Ll/ghs0;

    .line 7
    .line 8
    new-instance v0, Ll/ehs0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/ehs0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/ghs0;->b:Ll/ghs0;

    .line 14
    .line 15
    new-instance v0, Ll/fhs0;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/fhs0;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Ll/ghs0;->c:Ll/ghs0;

    .line 21
    .line 22
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


# virtual methods
.method public abstract a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method
