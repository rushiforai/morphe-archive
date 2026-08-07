.class public final synthetic Ll/g41;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/j41;


# direct methods
.method public synthetic constructor <init>(Ll/j41;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g41;->a:Ll/j41;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g41;->a:Ll/j41;

    invoke-static {p0, p1}, Ll/j41;->c(Ll/j41;Landroid/view/View;)V

    return-void
.end method
