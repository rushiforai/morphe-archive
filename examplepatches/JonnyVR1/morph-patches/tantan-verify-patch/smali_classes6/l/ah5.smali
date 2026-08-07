.class public final synthetic Ll/ah5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jh5;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ah5;->a:Ll/jh5;

    iput-object p2, p0, Ll/ah5;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/ah5;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/ah5;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/ah5;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/ah5;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/ah5;->g:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ah5;->a:Ll/jh5;

    iget-object v1, p0, Ll/ah5;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v2, p0, Ll/ah5;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/ah5;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/ah5;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/ah5;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/ah5;->g:Ll/x20;

    move-object v7, p1

    invoke-static/range {v0 .. v7}, Ll/jh5;->s(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V

    return-void
.end method
