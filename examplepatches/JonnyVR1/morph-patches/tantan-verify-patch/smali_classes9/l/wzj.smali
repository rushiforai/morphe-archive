.class public final synthetic Ll/wzj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wzj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;

    iput-object p2, p0, Ll/wzj;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wzj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;

    iget-object p0, p0, Ll/wzj;->b:Ljava/lang/String;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;->j0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;Ljava/lang/String;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
