.class public final synthetic Ll/zlt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/hmt;

.field public final synthetic b:Lv/VRecyclerView;

.field public final synthetic c:Lv/VText;


# direct methods
.method public synthetic constructor <init>(Ll/hmt;Lv/VRecyclerView;Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zlt;->a:Ll/hmt;

    iput-object p2, p0, Ll/zlt;->b:Lv/VRecyclerView;

    iput-object p3, p0, Ll/zlt;->c:Lv/VText;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zlt;->a:Ll/hmt;

    iget-object v1, p0, Ll/zlt;->b:Lv/VRecyclerView;

    iget-object p0, p0, Ll/zlt;->c:Lv/VText;

    invoke-static {v0, v1, p0, p1}, Ll/hmt;->e(Ll/hmt;Lv/VRecyclerView;Lv/VText;Landroid/view/View;)V

    return-void
.end method
