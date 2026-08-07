.class public Ll/nfw$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nfw;->o0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/nfw;


# direct methods
.method public constructor <init>(Ll/nfw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nfw$b;->a:Ll/nfw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nfw$b;->a:Ll/nfw;

    .line 2
    .line 3
    invoke-static {p0}, Ll/nfw;->j0(Ll/nfw;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/qfw;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/qfw;->m()V

    .line 10
    .line 11
    .line 12
    const-string p0, "\u7f51\u7edc\u5f02\u5e38\uff01"

    .line 13
    .line 14
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Throwable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nfw$b;->a(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
