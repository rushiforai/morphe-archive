.class public final synthetic Ll/ua70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ua70;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p2, p0, Ll/ua70;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ua70;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object v1, p0, Ll/ua70;->b:Ll/y20;

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->B(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
