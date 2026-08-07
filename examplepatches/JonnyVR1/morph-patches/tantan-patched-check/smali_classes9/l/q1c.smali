.class public final synthetic Ll/q1c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/r1c;


# direct methods
.method public synthetic constructor <init>(Ll/r1c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q1c;->a:Ll/r1c;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q1c;->a:Ll/r1c;

    invoke-static {p0, p1}, Ll/r1c;->R(Ll/r1c;Landroid/view/View;)V

    return-void
.end method
