.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;
.super Ll/wo0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->c0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/wo0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;->j(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/wo0;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isRankPk()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->u(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)Ll/t880;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 19
    .line 20
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->s(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)Ll/sx70;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 25
    .line 26
    new-instance v3, Ll/fc80;

    .line 27
    .line 28
    invoke-direct {v3, p0, v2}, Ll/fc80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1, v2, v3}, Ll/t880;->e(Ll/sx70;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Ll/x20;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->v(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
