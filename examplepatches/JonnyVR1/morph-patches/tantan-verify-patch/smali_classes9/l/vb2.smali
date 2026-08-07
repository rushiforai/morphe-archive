.class public final synthetic Ll/vb2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/zb2;


# direct methods
.method public synthetic constructor <init>(Ll/zb2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vb2;->a:Ll/zb2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vb2;->a:Ll/zb2;

    check-cast p1, Ll/pmj;

    invoke-static {p0, p1}, Ll/zb2;->K3(Ll/zb2;Ll/pmj;)Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    move-result-object p0

    return-object p0
.end method
