.class public final synthetic Ll/xfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

.field public final synthetic c:Z

.field public final synthetic d:Z

.field public final synthetic e:Ll/y20;

.field public final synthetic f:Ll/y20;

.field public final synthetic g:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;ZZLl/y20;Ll/y20;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xfo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;

    iput-object p2, p0, Ll/xfo;->b:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

    iput-boolean p3, p0, Ll/xfo;->c:Z

    iput-boolean p4, p0, Ll/xfo;->d:Z

    iput-object p5, p0, Ll/xfo;->e:Ll/y20;

    iput-object p6, p0, Ll/xfo;->f:Ll/y20;

    iput-object p7, p0, Ll/xfo;->g:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/xfo;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;

    iget-object v1, p0, Ll/xfo;->b:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

    iget-boolean v2, p0, Ll/xfo;->c:Z

    iget-boolean v3, p0, Ll/xfo;->d:Z

    iget-object v4, p0, Ll/xfo;->e:Ll/y20;

    iget-object v5, p0, Ll/xfo;->f:Ll/y20;

    iget-object v6, p0, Ll/xfo;->g:Ll/y20;

    move-object v7, p1

    check-cast v7, Lcom/p1/mobile/putong/data/User;

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->u(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;ZZLl/y20;Ll/y20;Ll/y20;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
