.class public final synthetic Ll/ut40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y8s;


# direct methods
.method public synthetic constructor <init>(Ll/y8s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ut40;->a:Ll/y8s;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ut40;->a:Ll/y8s;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/noble/NobleAttentionDialogView;->h0(Ll/y8s;Landroid/view/View;)V

    return-void
.end method
