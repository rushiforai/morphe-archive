.class public final synthetic Ll/zon0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/tpn0;


# direct methods
.method public synthetic constructor <init>(Ll/tpn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zon0;->a:Ll/tpn0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zon0;->a:Ll/tpn0;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/tpn0;->a3(Ll/tpn0;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
