.class public Ll/uq3$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/se00;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/uq3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/se00<",
        "[B",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# direct methods
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
.method public b(Ll/qs10;)Ll/re00;
    .locals 1
    .param p1    # Ll/qs10;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qs10;",
            ")",
            "Ll/re00<",
            "[B",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p1, Ll/uq3;

    .line 2
    .line 3
    new-instance v0, Ll/uq3$d$a;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/uq3$d$a;-><init>(Ll/uq3$d;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p1, v0}, Ll/uq3;-><init>(Ll/uq3$b;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
