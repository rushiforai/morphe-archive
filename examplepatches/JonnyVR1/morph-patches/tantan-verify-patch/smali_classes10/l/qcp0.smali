.class public final synthetic Ll/qcp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/scp0;


# direct methods
.method public synthetic constructor <init>(Ll/scp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qcp0;->a:Ll/scp0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qcp0;->a:Ll/scp0;

    check-cast p1, Ll/nfn0;

    invoke-static {p0, p1}, Ll/scp0;->e4(Ll/scp0;Ll/nfn0;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method
