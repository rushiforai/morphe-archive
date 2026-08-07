.class public final synthetic Ll/iz80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/yna$a;

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListItemView;

.field public final synthetic e:Ll/b090;


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/String;Ll/yna$a;Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListItemView;Ll/b090;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/iz80;->a:Z

    iput-object p2, p0, Ll/iz80;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/iz80;->c:Ll/yna$a;

    iput-object p4, p0, Ll/iz80;->d:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListItemView;

    iput-object p5, p0, Ll/iz80;->e:Ll/b090;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/iz80;->a:Z

    iget-object v1, p0, Ll/iz80;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/iz80;->c:Ll/yna$a;

    iget-object v3, p0, Ll/iz80;->d:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListItemView;

    iget-object v4, p0, Ll/iz80;->e:Ll/b090;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListItemView;->b(ZLjava/lang/String;Ll/yna$a;Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListItemView;Ll/b090;Landroid/view/View;)V

    return-void
.end method
