.class public final synthetic Ll/icy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/icy;->a:Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;

    iput-boolean p2, p0, Ll/icy;->b:Z

    iput-object p3, p0, Ll/icy;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/icy;->a:Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;

    iget-boolean v1, p0, Ll/icy;->b:Z

    iget-object p0, p0, Ll/icy;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->P(Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
