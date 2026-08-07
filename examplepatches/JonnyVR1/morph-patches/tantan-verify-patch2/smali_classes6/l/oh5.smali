.class public final synthetic Ll/oh5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oh5;->a:Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;

    iput-object p2, p0, Ll/oh5;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/oh5;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/oh5;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/oh5;->a:Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;

    iget-object v1, p0, Ll/oh5;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/oh5;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/oh5;->d:Ll/x20;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->a(Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V

    return-void
.end method
