.class public final synthetic Ll/qdw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/few;


# direct methods
.method public synthetic constructor <init>(Ll/few;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qdw;->a:Ll/few;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qdw;->a:Ll/few;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterSearchLayout;->a(Ll/few;Landroid/view/View;)V

    return-void
.end method
