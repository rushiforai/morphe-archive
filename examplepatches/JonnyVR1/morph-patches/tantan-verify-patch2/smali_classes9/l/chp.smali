.class public final synthetic Ll/chp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fhp;


# direct methods
.method public synthetic constructor <init>(Ll/fhp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/chp;->a:Ll/fhp;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/chp;->a:Ll/fhp;

    invoke-static {p0, p1}, Ll/fhp;->J(Ll/fhp;Landroid/view/View;)V

    return-void
.end method
