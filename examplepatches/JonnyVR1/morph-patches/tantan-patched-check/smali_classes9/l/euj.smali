.class public final synthetic Ll/euj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/guj;

.field public final synthetic b:Ll/jjs;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/guj;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/euj;->a:Ll/guj;

    iput-object p2, p0, Ll/euj;->b:Ll/jjs;

    iput-object p3, p0, Ll/euj;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iput p4, p0, Ll/euj;->d:I

    iput-object p5, p0, Ll/euj;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/euj;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/euj;->g:Ll/y20;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/euj;->a:Ll/guj;

    iget-object v1, p0, Ll/euj;->b:Ll/jjs;

    iget-object v2, p0, Ll/euj;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iget v3, p0, Ll/euj;->d:I

    iget-object v4, p0, Ll/euj;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/euj;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/euj;->g:Ll/y20;

    move-object v7, p1

    check-cast v7, Ll/stj;

    invoke-static/range {v0 .. v7}, Ll/guj;->f(Ll/guj;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;Ll/stj;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
