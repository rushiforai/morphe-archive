.class public final synthetic Ll/wbl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wbl;->a:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wbl;->a:Ll/x20;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->f(Ll/x20;Landroid/view/View;)V

    return-void
.end method
