.class public final synthetic Ll/j9y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:[I

.field public final synthetic c:Ljava/lang/StringBuilder;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;[ILjava/lang/StringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j9y;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/j9y;->b:[I

    iput-object p3, p0, Ll/j9y;->c:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j9y;->a:Lcom/p1/mobile/putong/data/User;

    iget-object v1, p0, Ll/j9y;->b:[I

    iget-object p0, p0, Ll/j9y;->c:Ljava/lang/StringBuilder;

    check-cast p1, Lcom/p1/mobile/putong/data/Tag;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->j0(Lcom/p1/mobile/putong/data/User;[ILjava/lang/StringBuilder;Lcom/p1/mobile/putong/data/Tag;)V

    return-void
.end method
