.class public final synthetic Ll/zhx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zhx;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zhx;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LabelData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->c(Lcom/p1/mobile/putong/core/data/LabelData;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
