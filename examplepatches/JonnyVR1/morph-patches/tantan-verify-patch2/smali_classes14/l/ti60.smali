.class public final synthetic Ll/ti60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/vi60;


# direct methods
.method public synthetic constructor <init>(Ll/vi60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ti60;->a:Ll/vi60;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ti60;->a:Ll/vi60;

    invoke-static {p0, p1}, Ll/vi60;->a(Ll/vi60;Landroid/view/View;)V

    return-void
.end method
