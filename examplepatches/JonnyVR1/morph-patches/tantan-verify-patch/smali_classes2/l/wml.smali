.class public Ll/wml;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/re00;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wml$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/re00<",
        "Ll/e4k;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# static fields
.field public static final b:Ll/q560;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/q560<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Ll/me00;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/me00<",
            "Ll/e4k;",
            "Ll/e4k;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x9c4

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "com.bumptech.glide.load.model.stream.HttpGlideUrlLoader.Timeout"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/q560;->f(Ljava/lang/String;Ljava/lang/Object;)Ll/q560;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/wml;->b:Ll/q560;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, v0}, Ll/wml;-><init>(Ll/me00;)V

    return-void
.end method

.method public constructor <init>(Ll/me00;)V
    .locals 0
    .param p1    # Ll/me00;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/me00<",
            "Ll/e4k;",
            "Ll/e4k;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wml;->a:Ll/me00;

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
    check-cast p1, Ll/e4k;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/wml;->c(Ll/e4k;IILl/u560;)Ll/re00$a;

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
    check-cast p1, Ll/e4k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wml;->d(Ll/e4k;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Ll/e4k;IILl/u560;)Ll/re00$a;
    .locals 0
    .param p1    # Ll/e4k;
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
            "Ll/e4k;",
            "II",
            "Ll/u560;",
            ")",
            "Ll/re00$a<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Ll/wml;->a:Ll/me00;

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    invoke-virtual {p2, p1, p3, p3}, Ll/me00;->a(Ljava/lang/Object;II)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Ll/e4k;

    .line 11
    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/wml;->a:Ll/me00;

    .line 15
    .line 16
    invoke-virtual {p0, p1, p3, p3, p1}, Ll/me00;->b(Ljava/lang/Object;IILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move-object p1, p2

    .line 21
    :cond_1
    :goto_0
    sget-object p0, Ll/wml;->b:Ll/q560;

    .line 22
    .line 23
    invoke-virtual {p4, p0}, Ll/u560;->c(Ll/q560;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    new-instance p2, Ll/re00$a;

    .line 34
    .line 35
    new-instance p3, Ll/unl;

    .line 36
    .line 37
    invoke-direct {p3, p1, p0}, Ll/unl;-><init>(Ll/e4k;I)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p2, p1, p3}, Ll/re00$a;-><init>(Ll/kzq;Ll/t5c;)V

    .line 41
    .line 42
    .line 43
    return-object p2
.end method

.method public d(Ll/e4k;)Z
    .locals 0
    .param p1    # Ll/e4k;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
