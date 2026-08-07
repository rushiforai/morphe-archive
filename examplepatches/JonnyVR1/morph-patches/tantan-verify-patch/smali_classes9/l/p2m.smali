.class public final synthetic Ll/p2m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/q2m;


# direct methods
.method public synthetic constructor <init>(Ll/q2m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p2m;->a:Ll/q2m;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p2m;->a:Ll/q2m;

    invoke-static {p0, p1}, Ll/q2m;->a(Ll/q2m;Landroid/view/View;)V

    return-void
.end method
