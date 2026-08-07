.class public final synthetic Ll/e5m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/k5m0;

.field public final synthetic b:Lv/VText;


# direct methods
.method public synthetic constructor <init>(Ll/k5m0;Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e5m0;->a:Ll/k5m0;

    iput-object p2, p0, Ll/e5m0;->b:Lv/VText;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e5m0;->a:Ll/k5m0;

    iget-object p0, p0, Ll/e5m0;->b:Lv/VText;

    invoke-static {v0, p0, p1}, Ll/k5m0;->Q(Ll/k5m0;Lv/VText;Landroid/view/View;)V

    return-void
.end method
