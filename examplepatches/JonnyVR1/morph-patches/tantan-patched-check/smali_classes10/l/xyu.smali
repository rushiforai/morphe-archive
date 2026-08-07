.class public final synthetic Ll/xyu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/azu;


# direct methods
.method public synthetic constructor <init>(Ll/azu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xyu;->a:Ll/azu;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xyu;->a:Ll/azu;

    check-cast p1, Ll/gvn0;

    invoke-static {p0, p1}, Ll/azu;->N3(Ll/azu;Ll/gvn0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
