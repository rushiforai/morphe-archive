.class public final synthetic Ll/ljn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pjn;


# direct methods
.method public synthetic constructor <init>(Ll/pjn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ljn;->a:Ll/pjn;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljn;->a:Ll/pjn;

    invoke-static {p0, p1}, Ll/pjn;->D(Ll/pjn;Landroid/view/View;)V

    return-void
.end method
