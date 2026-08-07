.class public final synthetic Ll/vp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:Ll/wp;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;


# direct methods
.method public synthetic constructor <init>(Ll/wp;Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vp;->a:Ll/wp;

    iput-object p2, p0, Ll/vp;->b:Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vp;->a:Ll/wp;

    iget-object p0, p0, Ll/vp;->b:Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;

    invoke-static {v0, p0, p1, p2}, Ll/wp;->f(Ll/wp;Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
