.class public Ll/y3j0;
.super Ll/s4j0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/s4j0<",
        "Ll/z3j0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/z3j0;


# direct methods
.method public constructor <init>(Ll/z3j0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/s4j0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y3j0;->a:Ll/z3j0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y3j0;->c()Ll/z3j0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    const/4 p0, 0x6

    .line 2
    return p0
.end method

.method public c()Ll/z3j0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y3j0;->a:Ll/z3j0;

    .line 2
    .line 3
    return-object p0
.end method
