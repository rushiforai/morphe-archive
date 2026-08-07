.class public final synthetic Ll/men;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pen;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;


# direct methods
.method public synthetic constructor <init>(Ll/pen;Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/men;->a:Ll/pen;

    iput-object p2, p0, Ll/men;->b:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/men;->a:Ll/pen;

    iget-object p0, p0, Ll/men;->b:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    invoke-static {v0, p0, p1}, Ll/pen;->F(Ll/pen;Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;Landroid/view/View;)V

    return-void
.end method
