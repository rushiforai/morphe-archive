.class public final synthetic Ll/tl3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yl3;


# direct methods
.method public synthetic constructor <init>(Ll/yl3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tl3;->a:Ll/yl3;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tl3;->a:Ll/yl3;

    invoke-static {p0, p1}, Ll/yl3;->c(Ll/yl3;Landroid/view/View;)V

    return-void
.end method
