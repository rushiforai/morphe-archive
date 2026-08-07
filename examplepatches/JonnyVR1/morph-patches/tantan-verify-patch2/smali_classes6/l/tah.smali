.class public final synthetic Ll/tah;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(ILl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/tah;->a:I

    iput-object p2, p0, Ll/tah;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    iget v0, p0, Ll/tah;->a:I

    iget-object p0, p0, Ll/tah;->b:Ll/y20;

    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->T(ILl/y20;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
