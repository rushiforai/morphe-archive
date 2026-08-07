.class public final Ll/r230$d;
.super Ll/r230$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r230;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# instance fields
.field public n:Ll/x20;

.field public o:Ll/x20;

.field public p:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r230$j;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x7fffffff

    .line 5
    .line 6
    .line 7
    iput p1, p0, Ll/r230$d;->p:I

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Ll/r230$d;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/r230$d;->p:I

    return p0
.end method

.method public static bridge synthetic t(Ll/r230$d;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r230$d;->o:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic u(Ll/r230$d;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r230$d;->n:Ll/x20;

    return-object p0
.end method


# virtual methods
.method public k()Ll/r230;
    .locals 1

    .line 1
    new-instance v0, Ll/r230;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r230;-><init>(Ll/r230$d;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public v(I)Ll/r230$d;
    .locals 0

    .line 1
    iput p1, p0, Ll/r230$d;->p:I

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Ll/x20;)Ll/r230$d;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r230$d;->o:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(Ll/x20;)Ll/r230$d;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r230$d;->n:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method
