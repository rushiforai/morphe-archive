.class public Ll/jt40;
.super Ll/c4k0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c4k0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/data/OMSAction;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c4k0;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/rj50;->a0(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "dialog/no_more"

    .line 2
    .line 3
    return-object p0
.end method
