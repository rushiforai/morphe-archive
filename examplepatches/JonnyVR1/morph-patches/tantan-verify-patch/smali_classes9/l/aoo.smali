.class public final synthetic Ll/aoo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/doo;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/doo;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aoo;->a:Ll/doo;

    iput-object p2, p0, Ll/aoo;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aoo;->a:Ll/doo;

    iget-object p0, p0, Ll/aoo;->b:Ll/y20;

    invoke-static {v0, p0, p1}, Ll/doo;->g(Ll/doo;Ll/y20;Landroid/view/View;)V

    return-void
.end method
