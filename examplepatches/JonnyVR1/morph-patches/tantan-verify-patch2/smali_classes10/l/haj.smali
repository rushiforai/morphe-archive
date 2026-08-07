.class public final synthetic Ll/haj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/iaj;


# direct methods
.method public synthetic constructor <init>(Ll/iaj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/haj;->a:Ll/iaj;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/haj;->a:Ll/iaj;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/iaj;->H(Ll/iaj;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
