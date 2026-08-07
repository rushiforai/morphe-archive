.class public final synthetic Ll/p8i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/x8i;


# direct methods
.method public synthetic constructor <init>(Ll/x8i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p8i;->a:Ll/x8i;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p8i;->a:Ll/x8i;

    invoke-static {p0, p1}, Ll/x8i;->d(Ll/x8i;Landroid/view/View;)V

    return-void
.end method
