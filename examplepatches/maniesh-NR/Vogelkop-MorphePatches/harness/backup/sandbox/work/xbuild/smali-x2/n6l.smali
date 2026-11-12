.class public final synthetic Ln6l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu3l;


# instance fields
.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln6l;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lb2l;)Z
    .registers 2

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Ln6l;->d:Ljava/lang/String;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
