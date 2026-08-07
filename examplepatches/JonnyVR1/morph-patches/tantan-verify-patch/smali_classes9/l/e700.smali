.class public final synthetic Ll/e700;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e700;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/e700;->b:Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e700;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/e700;->b:Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->x(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;)V

    return-void
.end method
