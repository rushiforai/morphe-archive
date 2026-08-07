.class public final synthetic Ll/z3p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/c4p0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/c4p0;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z3p0;->a:Ll/c4p0;

    iput-object p2, p0, Ll/z3p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    iput p3, p0, Ll/z3p0;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z3p0;->a:Ll/c4p0;

    iget-object v1, p0, Ll/z3p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    iget p0, p0, Ll/z3p0;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/c4p0;->e(Ll/c4p0;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;ILandroid/view/View;)V

    return-void
.end method
