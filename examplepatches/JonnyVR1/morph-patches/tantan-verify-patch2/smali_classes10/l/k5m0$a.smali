.class public Ll/k5m0$a;
.super Ll/wo0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/k5m0;->J0(Ll/vak0;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/k5m0;


# direct methods
.method public constructor <init>(Ll/k5m0;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k5m0$a;->b:Ll/k5m0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/k5m0$a;->a:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/wo0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wo0;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/k5m0$a;->a:Ll/x20;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/x20;->call()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/k5m0$a;->b:Ll/k5m0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/k5m0;->z:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
