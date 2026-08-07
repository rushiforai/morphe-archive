.class public final synthetic Ll/hd20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/kd20;


# direct methods
.method public synthetic constructor <init>(Ll/kd20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hd20;->a:Ll/kd20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hd20;->a:Ll/kd20;

    invoke-static {p0, p1}, Ll/kd20;->d(Ll/kd20;Landroid/view/View;)V

    return-void
.end method
