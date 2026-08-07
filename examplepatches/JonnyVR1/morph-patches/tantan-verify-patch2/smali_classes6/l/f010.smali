.class public final synthetic Ll/f010;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/g010;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Ll/g010;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f010;->a:Ll/g010;

    iput-object p2, p0, Ll/f010;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f010;->a:Ll/g010;

    iget-object p0, p0, Ll/f010;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, p0, p1}, Ll/g010;->a(Ll/g010;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
