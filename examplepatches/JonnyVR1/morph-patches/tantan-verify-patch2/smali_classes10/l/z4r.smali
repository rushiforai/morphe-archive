.class public final synthetic Ll/z4r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/a5r;


# direct methods
.method public synthetic constructor <init>(Ll/a5r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z4r;->a:Ll/a5r;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z4r;->a:Ll/a5r;

    check-cast p1, Ll/nfn0;

    invoke-static {p0, p1}, Ll/a5r;->J3(Ll/a5r;Ll/nfn0;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method
