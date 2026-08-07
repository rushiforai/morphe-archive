.class public final synthetic Ll/y3r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/e4r;


# direct methods
.method public synthetic constructor <init>(Ll/e4r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y3r;->a:Ll/e4r;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y3r;->a:Ll/e4r;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/e4r;->Z3(Ll/e4r;Ljava/lang/Integer;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
