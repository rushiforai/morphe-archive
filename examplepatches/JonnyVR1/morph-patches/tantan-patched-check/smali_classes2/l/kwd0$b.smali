.class public Ll/kwd0$b;
.super Ll/kwd0$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kwd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ll/kwd0$e<",
        "TK;TV;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/kwd0$c;Ll/kwd0$c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kwd0$c<",
            "TK;TV;>;",
            "Ll/kwd0$c<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/kwd0$e;-><init>(Ll/kwd0$c;Ll/kwd0$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Ll/kwd0$c;)Ll/kwd0$c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kwd0$c<",
            "TK;TV;>;)",
            "Ll/kwd0$c<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Ll/kwd0$c;->c:Ll/kwd0$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/kwd0$c;)Ll/kwd0$c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kwd0$c<",
            "TK;TV;>;)",
            "Ll/kwd0$c<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Ll/kwd0$c;->d:Ll/kwd0$c;

    .line 2
    .line 3
    return-object p0
.end method
