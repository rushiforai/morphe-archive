.class public Ll/re00$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/re00;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Data:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Ll/kzq;

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/kzq;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ll/t5c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/t5c<",
            "TData;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/kzq;Ljava/util/List;Ll/t5c;)V
    .locals 0
    .param p1    # Ll/kzq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/t5c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kzq;",
            "Ljava/util/List<",
            "Ll/kzq;",
            ">;",
            "Ll/t5c<",
            "TData;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/kzq;

    .line 9
    .line 10
    iput-object p1, p0, Ll/re00$a;->a:Ll/kzq;

    .line 11
    .line 12
    invoke-static {p2}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ljava/util/List;

    .line 17
    .line 18
    iput-object p1, p0, Ll/re00$a;->b:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {p3}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ll/t5c;

    .line 25
    .line 26
    iput-object p1, p0, Ll/re00$a;->c:Ll/t5c;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Ll/kzq;Ll/t5c;)V
    .locals 1
    .param p1    # Ll/kzq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/t5c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kzq;",
            "Ll/t5c<",
            "TData;>;)V"
        }
    .end annotation

    .line 29
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {p0, p1, v0, p2}, Ll/re00$a;-><init>(Ll/kzq;Ljava/util/List;Ll/t5c;)V

    return-void
.end method
