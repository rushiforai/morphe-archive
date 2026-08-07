.class public final synthetic Ll/msl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/psl0;


# direct methods
.method public synthetic constructor <init>(Ll/psl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/msl0;->a:Ll/psl0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msl0;->a:Ll/psl0;

    invoke-static {p0, p1}, Ll/psl0;->c(Ll/psl0;Landroid/view/View;)V

    return-void
.end method
