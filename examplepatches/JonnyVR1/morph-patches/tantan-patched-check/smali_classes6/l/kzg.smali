.class public final synthetic Ll/kzg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/mzg;

.field public final synthetic b:Lv/VText;

.field public final synthetic c:Ll/t2m;

.field public final synthetic d:Lv/VLinear;

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Ll/mzg;Lv/VText;Ll/t2m;Lv/VLinear;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kzg;->a:Ll/mzg;

    iput-object p2, p0, Ll/kzg;->b:Lv/VText;

    iput-object p3, p0, Ll/kzg;->c:Ll/t2m;

    iput-object p4, p0, Ll/kzg;->d:Lv/VLinear;

    iput p5, p0, Ll/kzg;->e:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/kzg;->a:Ll/mzg;

    iget-object v1, p0, Ll/kzg;->b:Lv/VText;

    iget-object v2, p0, Ll/kzg;->c:Ll/t2m;

    iget-object v3, p0, Ll/kzg;->d:Lv/VLinear;

    iget v4, p0, Ll/kzg;->e:I

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/mzg;->b(Ll/mzg;Lv/VText;Ll/t2m;Lv/VLinear;ILandroid/view/View;)V

    return-void
.end method
