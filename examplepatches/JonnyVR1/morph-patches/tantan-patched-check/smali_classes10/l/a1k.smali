.class public final synthetic Ll/a1k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/d1k;


# direct methods
.method public synthetic constructor <init>(Ll/d1k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a1k;->a:Ll/d1k;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a1k;->a:Ll/d1k;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Ll/d1k;->Y3(Ll/d1k;Ll/pf60;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
