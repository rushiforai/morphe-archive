.class public final synthetic Ll/cy90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/dy90;

.field public final synthetic b:Lv/VText;


# direct methods
.method public synthetic constructor <init>(Ll/dy90;Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cy90;->a:Ll/dy90;

    iput-object p2, p0, Ll/cy90;->b:Lv/VText;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cy90;->a:Ll/dy90;

    iget-object p0, p0, Ll/cy90;->b:Lv/VText;

    invoke-static {v0, p0, p1}, Ll/dy90;->R(Ll/dy90;Lv/VText;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
