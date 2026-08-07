.class public final synthetic Ll/x1o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x1o0;->a:Ll/x20;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1o0;->a:Ll/x20;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/z1o0;->b(Ll/x20;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
