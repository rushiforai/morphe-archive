.class public final synthetic Ll/zu10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtendUser;

.field public final synthetic c:Ll/cv10;


# direct methods
.method public synthetic constructor <init>(ILcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtendUser;Ll/cv10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/zu10;->a:I

    iput-object p2, p0, Ll/zu10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtendUser;

    iput-object p3, p0, Ll/zu10;->c:Ll/cv10;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/zu10;->a:I

    iget-object v1, p0, Ll/zu10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtendUser;

    iget-object p0, p0, Ll/zu10;->c:Ll/cv10;

    invoke-static {v0, v1, p0, p1}, Ll/cv10;->a(ILcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtendUser;Ll/cv10;Landroid/view/View;)V

    return-void
.end method
