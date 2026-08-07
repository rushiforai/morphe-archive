.class public final synthetic Ll/s8h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/y6b$a;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/supreme/SupremeListItemView;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/y6b$a;Lcom/p1/mobile/putong/core/newui/supreme/SupremeListItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s8h0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/s8h0;->b:Ll/y6b$a;

    iput-object p3, p0, Ll/s8h0;->c:Lcom/p1/mobile/putong/core/newui/supreme/SupremeListItemView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s8h0;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/s8h0;->b:Ll/y6b$a;

    iget-object p0, p0, Ll/s8h0;->c:Lcom/p1/mobile/putong/core/newui/supreme/SupremeListItemView;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListItemView;->a(Ljava/lang/String;Ll/y6b$a;Lcom/p1/mobile/putong/core/newui/supreme/SupremeListItemView;Landroid/view/View;)V

    return-void
.end method
