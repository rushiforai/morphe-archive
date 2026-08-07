.class public final synthetic Ll/y8j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/z8j0;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/TopicMoment;


# direct methods
.method public synthetic constructor <init>(Ll/z8j0;ILcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y8j0;->a:Ll/z8j0;

    iput p2, p0, Ll/y8j0;->b:I

    iput-object p3, p0, Ll/y8j0;->c:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y8j0;->a:Ll/z8j0;

    iget v1, p0, Ll/y8j0;->b:I

    iget-object p0, p0, Ll/y8j0;->c:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    invoke-static {v0, v1, p0, p1}, Ll/z8j0;->B(Ll/z8j0;ILcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method
