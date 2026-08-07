.class public final synthetic Ll/fwi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/iwi;

.field public final synthetic b:Ll/ewi;


# direct methods
.method public synthetic constructor <init>(Ll/iwi;Ll/ewi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fwi;->a:Ll/iwi;

    iput-object p2, p0, Ll/fwi;->b:Ll/ewi;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fwi;->a:Ll/iwi;

    iget-object p0, p0, Ll/fwi;->b:Ll/ewi;

    invoke-static {v0, p0, p1}, Ll/iwi;->E(Ll/iwi;Ll/ewi;Landroid/view/View;)V

    return-void
.end method
