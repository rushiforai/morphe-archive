.class public Ll/efg$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/efg;->O(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/efg;


# direct methods
.method public constructor <init>(Ll/efg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/efg$c;->a:Ll/efg;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/efg$c;->a:Ll/efg;

    .line 2
    .line 3
    invoke-static {p1}, Ll/efg;->G(Ll/efg;)Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/efg$c;->a:Ll/efg;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Ll/efg;->F(Ll/efg;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object v1, p0, Ll/efg$c;->a:Ll/efg;

    .line 16
    .line 17
    invoke-static {v1}, Ll/efg;->G(Ll/efg;)Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, p1, v1}, Ll/efg;->N(ZLcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/efg$c;->a:Ll/efg;

    .line 25
    .line 26
    invoke-static {p0}, Ll/efg;->J(Ll/efg;)Ll/y8s;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ll/rfg;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/rfg;->f4()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 37
    .line 38
    .line 39
    return-void
.end method
