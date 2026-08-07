.class public final synthetic Ll/dw4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/mw4;


# direct methods
.method public synthetic constructor <init>(Ll/mw4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dw4;->a:Ll/mw4;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dw4;->a:Ll/mw4;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/mw4;->i4(Ll/mw4;Ljava/lang/Integer;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
