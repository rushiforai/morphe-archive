.class public final synthetic Ll/ctg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/dtg;


# direct methods
.method public synthetic constructor <init>(Ll/dtg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ctg;->a:Ll/dtg;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ctg;->a:Ll/dtg;

    invoke-static {p0, p1}, Ll/dtg;->c(Ll/dtg;Landroid/view/View;)V

    return-void
.end method
