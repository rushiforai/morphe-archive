.class public final synthetic Ll/evp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fvp;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;


# direct methods
.method public synthetic constructor <init>(Ll/fvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/evp;->a:Ll/fvp;

    iput-object p2, p0, Ll/evp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/evp;->a:Ll/fvp;

    iget-object p0, p0, Ll/evp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;

    invoke-static {v0, p0, p1}, Ll/fvp;->J(Ll/fvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;Landroid/view/View;)V

    return-void
.end method
