.class public final synthetic Ll/jaj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/kaj;


# direct methods
.method public synthetic constructor <init>(Ll/kaj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jaj;->a:Ll/kaj;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jaj;->a:Ll/kaj;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/kaj;->H(Ll/kaj;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
