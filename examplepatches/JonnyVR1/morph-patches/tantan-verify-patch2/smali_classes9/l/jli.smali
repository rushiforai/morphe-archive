.class public final synthetic Ll/jli;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/mli;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;


# direct methods
.method public synthetic constructor <init>(Ll/mli;ILcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jli;->a:Ll/mli;

    iput p2, p0, Ll/jli;->b:I

    iput-object p3, p0, Ll/jli;->c:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jli;->a:Ll/mli;

    iget v1, p0, Ll/jli;->b:I

    iget-object p0, p0, Ll/jli;->c:Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    invoke-static {v0, v1, p0, p1}, Ll/mli;->G(Ll/mli;ILcom/p1/mobile/putong/live/base/data/BLiveFilterItem;Landroid/view/View;)V

    return-void
.end method
