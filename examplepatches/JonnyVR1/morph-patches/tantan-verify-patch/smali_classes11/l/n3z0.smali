.class public final synthetic Ll/n3z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final synthetic a:Ll/n3z0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/n3z0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/n3z0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/n3z0;->a:Ll/n3z0;

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
    check-cast p1, Ll/sqr0;

    .line 2
    .line 3
    check-cast p2, Ll/sqr0;

    .line 4
    .line 5
    iget p0, p2, Ll/sqr0;->h:I

    .line 6
    .line 7
    iget p1, p1, Ll/sqr0;->h:I

    .line 8
    .line 9
    sub-int/2addr p0, p1

    .line 10
    return p0
.end method
