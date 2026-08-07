.class public Ll/vii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/re00;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vii$b;,
        Ll/vii$e;,
        Ll/vii$a;,
        Ll/vii$c;,
        Ll/vii$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Data:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/re00<",
        "Ljava/io/File;",
        "TData;>;"
    }
.end annotation


# instance fields
.field private final a:Ll/vii$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vii$d<",
            "TData;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/vii$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vii$d<",
            "TData;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vii;->a:Ll/vii$d;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;IILl/u560;)Ll/re00$a;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/u560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/vii;->c(Ljava/io/File;IILl/u560;)Ll/re00$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vii;->d(Ljava/io/File;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Ljava/io/File;IILl/u560;)Ll/re00$a;
    .locals 0
    .param p1    # Ljava/io/File;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/u560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "II",
            "Ll/u560;",
            ")",
            "Ll/re00$a<",
            "TData;>;"
        }
    .end annotation

    .line 1
    new-instance p2, Ll/re00$a;

    .line 2
    .line 3
    new-instance p3, Ll/d950;

    .line 4
    .line 5
    invoke-direct {p3, p1}, Ll/d950;-><init>(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance p4, Ll/vii$c;

    .line 9
    .line 10
    iget-object p0, p0, Ll/vii;->a:Ll/vii$d;

    .line 11
    .line 12
    invoke-direct {p4, p1, p0}, Ll/vii$c;-><init>(Ljava/io/File;Ll/vii$d;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p2, p3, p4}, Ll/re00$a;-><init>(Ll/kzq;Ll/t5c;)V

    .line 16
    .line 17
    .line 18
    return-object p2
.end method

.method public d(Ljava/io/File;)Z
    .locals 0
    .param p1    # Ljava/io/File;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
