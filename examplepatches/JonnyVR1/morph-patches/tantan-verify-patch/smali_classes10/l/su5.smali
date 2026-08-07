.class public final synthetic Ll/su5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/uu5;


# direct methods
.method public synthetic constructor <init>(Ll/uu5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/su5;->a:Ll/uu5;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/su5;->a:Ll/uu5;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/uu5;->c(Ll/uu5;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
