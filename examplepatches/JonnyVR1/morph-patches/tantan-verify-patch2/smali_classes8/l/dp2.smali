.class public final synthetic Ll/dp2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/sp2;


# direct methods
.method public synthetic constructor <init>(Ll/sp2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dp2;->a:Ll/sp2;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dp2;->a:Ll/sp2;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Ll/sp2;->l0(Ll/sp2;Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
