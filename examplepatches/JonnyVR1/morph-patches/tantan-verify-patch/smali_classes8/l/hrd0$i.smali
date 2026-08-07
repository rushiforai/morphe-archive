.class public final Ll/hrd0$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hrd0;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/rcj<",
        "Lrx/c;",
        "Lrx/c$a;",
        "Lrx/c$a;",
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
.method public a(Lrx/c;Lrx/c$a;)Lrx/c$a;
    .locals 0

    .line 1
    invoke-static {}, Ll/mrd0;->c()Ll/mrd0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/mrd0;->d()Ll/ird0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1, p2}, Ll/ird0;->e(Lrx/c;Lrx/c$a;)Lrx/c$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lrx/c;

    .line 2
    .line 3
    check-cast p2, Lrx/c$a;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/hrd0$i;->a(Lrx/c;Lrx/c$a;)Lrx/c$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
