.class public final synthetic Ll/i030;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/l030;


# direct methods
.method public synthetic constructor <init>(Ll/l030;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i030;->a:Ll/l030;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i030;->a:Ll/l030;

    invoke-static {p0, p1}, Ll/l030;->b(Ll/l030;Landroid/view/View;)V

    return-void
.end method
