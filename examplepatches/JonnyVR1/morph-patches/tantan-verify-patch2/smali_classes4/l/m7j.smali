.class public final synthetic Ll/m7j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/r7j;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ll/r7j;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m7j;->a:Ll/r7j;

    iput-object p2, p0, Ll/m7j;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m7j;->a:Ll/r7j;

    iget-object p0, p0, Ll/m7j;->b:Landroid/content/Context;

    invoke-static {v0, p0, p1}, Ll/r7j;->t(Ll/r7j;Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method
