.class public final synthetic Ll/i53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w53;


# direct methods
.method public synthetic constructor <init>(Ll/w53;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i53;->a:Ll/w53;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i53;->a:Ll/w53;

    invoke-static {p0, p1}, Ll/w53;->c(Ll/w53;Landroid/view/View;)V

    return-void
.end method
