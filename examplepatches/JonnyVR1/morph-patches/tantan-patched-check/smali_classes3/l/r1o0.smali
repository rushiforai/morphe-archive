.class public final synthetic Ll/r1o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/u1o0;


# direct methods
.method public synthetic constructor <init>(Ll/u1o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r1o0;->a:Ll/u1o0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r1o0;->a:Ll/u1o0;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/u1o0;->j(Ll/u1o0;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
