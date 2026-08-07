.class public final synthetic Ll/ni5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/CommentView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ni5;->a:Lcom/p1/mobile/putong/feed/ui/moments/CommentView;

    iput-object p2, p0, Ll/ni5;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p3, p0, Ll/ni5;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/ni5;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ni5;->a:Lcom/p1/mobile/putong/feed/ui/moments/CommentView;

    iget-object v1, p0, Ll/ni5;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object v2, p0, Ll/ni5;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/ni5;->d:Ljava/lang/String;

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    move-object v7, p4

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->e(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
