.class public final synthetic Ll/qbh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/sbh;

.field public final synthetic b:Lv/VText;

.field public final synthetic c:Ll/t2m;

.field public final synthetic d:Lv/VLinear;

.field public final synthetic e:I

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/sbh;Lv/VText;Ll/t2m;Lv/VLinear;ILl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qbh;->a:Ll/sbh;

    iput-object p2, p0, Ll/qbh;->b:Lv/VText;

    iput-object p3, p0, Ll/qbh;->c:Ll/t2m;

    iput-object p4, p0, Ll/qbh;->d:Lv/VLinear;

    iput p5, p0, Ll/qbh;->e:I

    iput-object p6, p0, Ll/qbh;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/qbh;->a:Ll/sbh;

    iget-object v1, p0, Ll/qbh;->b:Lv/VText;

    iget-object v2, p0, Ll/qbh;->c:Ll/t2m;

    iget-object v3, p0, Ll/qbh;->d:Lv/VLinear;

    iget v4, p0, Ll/qbh;->e:I

    iget-object v5, p0, Ll/qbh;->f:Ll/x20;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Ll/sbh;->b(Ll/sbh;Lv/VText;Ll/t2m;Lv/VLinear;ILl/x20;Landroid/view/View;)V

    return-void
.end method
