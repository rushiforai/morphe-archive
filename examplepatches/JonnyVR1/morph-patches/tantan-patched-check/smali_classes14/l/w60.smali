.class public final synthetic Ll/w60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y60;

.field public final synthetic b:Landroid/widget/TextView;

.field public final synthetic c:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Ll/y60;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w60;->a:Ll/y60;

    iput-object p2, p0, Ll/w60;->b:Landroid/widget/TextView;

    iput-object p3, p0, Ll/w60;->c:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w60;->a:Ll/y60;

    iget-object v1, p0, Ll/w60;->b:Landroid/widget/TextView;

    iget-object p0, p0, Ll/w60;->c:Landroid/widget/TextView;

    invoke-static {v0, v1, p0}, Ll/y60;->n(Ll/y60;Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-void
.end method
