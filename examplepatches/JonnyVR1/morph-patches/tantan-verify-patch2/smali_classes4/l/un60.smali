.class public final synthetic Ll/un60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/wn60;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/wn60;Ll/y20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/un60;->a:Ll/wn60;

    iput-object p2, p0, Ll/un60;->b:Ll/y20;

    iput-object p3, p0, Ll/un60;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/un60;->a:Ll/wn60;

    iget-object v1, p0, Ll/un60;->b:Ll/y20;

    iget-object p0, p0, Ll/un60;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/wn60;->b(Ll/wn60;Ll/y20;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
