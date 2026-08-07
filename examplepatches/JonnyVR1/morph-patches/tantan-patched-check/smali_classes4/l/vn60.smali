.class public final synthetic Ll/vn60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/wn60;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/wn60;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vn60;->a:Ll/wn60;

    iput-object p2, p0, Ll/vn60;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vn60;->a:Ll/wn60;

    iget-object p0, p0, Ll/vn60;->b:Ll/y20;

    invoke-static {v0, p0, p1}, Ll/wn60;->a(Ll/wn60;Ll/y20;Landroid/view/View;)V

    return-void
.end method
