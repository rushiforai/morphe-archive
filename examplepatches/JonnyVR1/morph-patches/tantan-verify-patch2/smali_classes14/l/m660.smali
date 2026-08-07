.class public final synthetic Ll/m660;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/p660;


# direct methods
.method public synthetic constructor <init>(Ll/p660;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m660;->a:Ll/p660;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m660;->a:Ll/p660;

    invoke-static {p0, p1}, Ll/p660;->a(Ll/p660;Landroid/view/View;)V

    return-void
.end method
