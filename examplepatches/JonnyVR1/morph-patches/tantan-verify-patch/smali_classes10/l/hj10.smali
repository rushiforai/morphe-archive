.class public final synthetic Ll/hj10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/s910;


# direct methods
.method public synthetic constructor <init>(Ll/s910;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hj10;->a:Ll/s910;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hj10;->a:Ll/s910;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->j0(Ll/s910;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
