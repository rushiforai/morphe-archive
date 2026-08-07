.class public final synthetic Ll/xsp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/btp;


# direct methods
.method public synthetic constructor <init>(Ll/btp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xsp;->a:Ll/btp;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xsp;->a:Ll/btp;

    invoke-static {p0, p1}, Ll/btp;->x0(Ll/btp;Landroid/view/View;)V

    return-void
.end method
