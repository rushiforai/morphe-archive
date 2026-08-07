.class public final synthetic Ll/ivw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/qvw;


# direct methods
.method public synthetic constructor <init>(Ll/qvw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ivw;->a:Ll/qvw;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ivw;->a:Ll/qvw;

    invoke-static {p0, p1}, Ll/qvw;->a(Ll/qvw;Landroid/view/View;)V

    return-void
.end method
