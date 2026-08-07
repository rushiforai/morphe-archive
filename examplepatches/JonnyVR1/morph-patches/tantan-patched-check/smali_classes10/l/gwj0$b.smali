.class public Ll/gwj0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/gwj0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;ILjava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gwj0;


# direct methods
.method public constructor <init>(Ll/gwj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gwj0$b;->a:Ll/gwj0;

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
    .locals 0

    .line 1
    iget-object p1, p0, Ll/gwj0$b;->a:Ll/gwj0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/puj0;->c:Ll/ouj0;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p1, Ll/fwj0;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ll/rwn0;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Ll/cin0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/gwj0$b;->a:Ll/gwj0;

    .line 23
    .line 24
    iget-object p0, p0, Ll/puj0;->c:Ll/ouj0;

    .line 25
    .line 26
    invoke-static {p0}, Ll/ydn0;->n(Ll/i6t;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
