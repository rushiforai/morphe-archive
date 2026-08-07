.class public final synthetic Ll/j0o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/g1o0;


# direct methods
.method public synthetic constructor <init>(Ll/g1o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j0o0;->a:Ll/g1o0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j0o0;->a:Ll/g1o0;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/g1o0;->h4(Ll/g1o0;Ljava/util/List;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
