.class public final synthetic Ll/a1o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/e1o;


# direct methods
.method public synthetic constructor <init>(Ll/e1o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a1o;->a:Ll/e1o;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a1o;->a:Ll/e1o;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/e1o;->a(Ll/e1o;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
