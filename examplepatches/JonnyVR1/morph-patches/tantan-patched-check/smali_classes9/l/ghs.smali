.class public final synthetic Ll/ghs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/nhs;


# direct methods
.method public synthetic constructor <init>(Ll/nhs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ghs;->a:Ll/nhs;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ghs;->a:Ll/nhs;

    invoke-static {p0, p1}, Ll/nhs;->q(Ll/nhs;Landroid/view/View;)V

    return-void
.end method
