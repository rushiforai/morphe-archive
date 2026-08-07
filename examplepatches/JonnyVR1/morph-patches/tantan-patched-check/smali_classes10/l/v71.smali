.class public final synthetic Ll/v71;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/o81;


# direct methods
.method public synthetic constructor <init>(Ll/o81;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v71;->a:Ll/o81;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v71;->a:Ll/o81;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/o81;->W3(Ll/o81;Ljava/lang/Long;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
