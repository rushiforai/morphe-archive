.class public final synthetic Ll/rim0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/vim0;


# direct methods
.method public synthetic constructor <init>(Ll/vim0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rim0;->a:Ll/vim0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rim0;->a:Ll/vim0;

    invoke-static {p0, p1}, Ll/vim0;->d(Ll/vim0;Landroid/view/View;)V

    return-void
.end method
