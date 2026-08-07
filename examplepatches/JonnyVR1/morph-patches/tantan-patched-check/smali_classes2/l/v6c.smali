.class public final Ll/v6c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/re00;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/v6c$c;,
        Ll/v6c$b;,
        Ll/v6c$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Model:",
        "Ljava/lang/Object;",
        "Data:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/re00<",
        "TModel;TData;>;"
    }
.end annotation


# instance fields
.field private final a:Ll/v6c$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/v6c$a<",
            "TData;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/v6c$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v6c$a<",
            "TData;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/v6c;->a:Ll/v6c$a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;IILl/u560;)Ll/re00$a;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/u560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;II",
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
    new-instance p4, Ll/v6c$b;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p0, p0, Ll/v6c;->a:Ll/v6c$a;

    .line 15
    .line 16
    invoke-direct {p4, p1, p0}, Ll/v6c$b;-><init>(Ljava/lang/String;Ll/v6c$a;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p2, p3, p4}, Ll/re00$a;-><init>(Ll/kzq;Ll/t5c;)V

    .line 20
    .line 21
    .line 22
    return-object p2
.end method

.method public b(Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "data:image"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
