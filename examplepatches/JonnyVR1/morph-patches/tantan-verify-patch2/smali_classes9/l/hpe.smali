.class public final synthetic Ll/hpe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ipe;


# direct methods
.method public synthetic constructor <init>(Ll/ipe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hpe;->a:Ll/ipe;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hpe;->a:Ll/ipe;

    invoke-static {p0, p1}, Ll/ipe;->Y(Ll/ipe;Landroid/view/View;)V

    return-void
.end method
