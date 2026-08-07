.class public final synthetic Ll/pp10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/tp10;


# direct methods
.method public synthetic constructor <init>(Ll/tp10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pp10;->a:Ll/tp10;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pp10;->a:Ll/tp10;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/tp10;->L3(Ll/tp10;Ljava/lang/Integer;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
