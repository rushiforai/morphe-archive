.class public final synthetic Ll/zy90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/az90;

.field public final synthetic b:Lv/VText_Tags;


# direct methods
.method public synthetic constructor <init>(Ll/az90;Lv/VText_Tags;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zy90;->a:Ll/az90;

    iput-object p2, p0, Ll/zy90;->b:Lv/VText_Tags;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zy90;->a:Ll/az90;

    iget-object p0, p0, Ll/zy90;->b:Lv/VText_Tags;

    invoke-static {v0, p0, p1}, Ll/az90;->T(Ll/az90;Lv/VText_Tags;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
