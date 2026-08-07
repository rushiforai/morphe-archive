.class public final synthetic Ll/sg2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/ah2;


# direct methods
.method public synthetic constructor <init>(Ll/ah2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sg2;->a:Ll/ah2;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg2;->a:Ll/ah2;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Ll/ah2;->g0(Ll/ah2;Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
