.class public final synthetic Ll/sdd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/tdd0;


# direct methods
.method public synthetic constructor <init>(Ll/tdd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sdd0;->a:Ll/tdd0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sdd0;->a:Ll/tdd0;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/tdd0;->v(Ll/tdd0;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
