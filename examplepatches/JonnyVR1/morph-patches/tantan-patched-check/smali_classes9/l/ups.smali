.class public final synthetic Ll/ups;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bqs;


# direct methods
.method public synthetic constructor <init>(Ll/bqs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ups;->a:Ll/bqs;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ups;->a:Ll/bqs;

    invoke-static {p0, p1}, Ll/bqs;->I(Ll/bqs;Landroid/view/View;)V

    return-void
.end method
