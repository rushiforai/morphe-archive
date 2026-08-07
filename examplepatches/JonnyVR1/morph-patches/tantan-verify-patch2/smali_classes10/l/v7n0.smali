.class public final synthetic Ll/v7n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/y7n0;


# direct methods
.method public synthetic constructor <init>(Ll/y7n0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v7n0;->a:Ll/y7n0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v7n0;->a:Ll/y7n0;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/y7n0;->c(Ll/y7n0;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
