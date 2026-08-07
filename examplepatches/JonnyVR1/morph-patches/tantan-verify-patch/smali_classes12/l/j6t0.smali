.class public final synthetic Ll/j6t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final synthetic a:Ll/j6t0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/j6t0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/j6t0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/j6t0;->a:Ll/j6t0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/a9r;

    .line 2
    .line 3
    check-cast p2, Ll/a9r;

    .line 4
    .line 5
    invoke-interface {p2}, Ll/a9r;->getPriority()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-interface {p1}, Ll/a9r;->getPriority()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    sub-int/2addr p0, p1

    .line 14
    return p0
.end method
