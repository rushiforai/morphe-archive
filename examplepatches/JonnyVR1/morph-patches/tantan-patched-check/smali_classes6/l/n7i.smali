.class public final synthetic Ll/n7i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/o7i;

.field public final synthetic b:Ll/dj70;


# direct methods
.method public synthetic constructor <init>(Ll/o7i;Ll/dj70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n7i;->a:Ll/o7i;

    iput-object p2, p0, Ll/n7i;->b:Ll/dj70;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n7i;->a:Ll/o7i;

    iget-object p0, p0, Ll/n7i;->b:Ll/dj70;

    invoke-static {v0, p0, p1}, Ll/o7i;->o(Ll/o7i;Ll/dj70;Landroid/view/View;)V

    return-void
.end method
