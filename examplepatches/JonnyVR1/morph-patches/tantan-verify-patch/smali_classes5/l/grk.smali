.class public final synthetic Ll/grk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Landroid/widget/TextView;

.field public final synthetic c:[Z

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Landroid/widget/LinearLayout;

.field public final synthetic f:Ll/jl80;

.field public final synthetic g:Ll/x20;

.field public final synthetic h:Lv/VEditText;

.field public final synthetic i:Landroid/widget/LinearLayout;

.field public final synthetic j:Lv/VEditText;

.field public final synthetic k:Lv/VText;

.field public final synthetic l:Lv/VText;

.field public final synthetic m:Lv/VButton;


# direct methods
.method public synthetic constructor <init>(ZLandroid/widget/TextView;[ZLcom/p1/mobile/android/app/Act;Landroid/widget/LinearLayout;Ll/jl80;Ll/x20;Lv/VEditText;Landroid/widget/LinearLayout;Lv/VEditText;Lv/VText;Lv/VText;Lv/VButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/grk;->a:Z

    iput-object p2, p0, Ll/grk;->b:Landroid/widget/TextView;

    iput-object p3, p0, Ll/grk;->c:[Z

    iput-object p4, p0, Ll/grk;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/grk;->e:Landroid/widget/LinearLayout;

    iput-object p6, p0, Ll/grk;->f:Ll/jl80;

    iput-object p7, p0, Ll/grk;->g:Ll/x20;

    iput-object p8, p0, Ll/grk;->h:Lv/VEditText;

    iput-object p9, p0, Ll/grk;->i:Landroid/widget/LinearLayout;

    iput-object p10, p0, Ll/grk;->j:Lv/VEditText;

    iput-object p11, p0, Ll/grk;->k:Lv/VText;

    iput-object p12, p0, Ll/grk;->l:Lv/VText;

    iput-object p13, p0, Ll/grk;->m:Lv/VButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 14

    .line 1
    iget-boolean v0, p0, Ll/grk;->a:Z

    iget-object v1, p0, Ll/grk;->b:Landroid/widget/TextView;

    iget-object v2, p0, Ll/grk;->c:[Z

    iget-object v3, p0, Ll/grk;->d:Lcom/p1/mobile/android/app/Act;

    iget-object v4, p0, Ll/grk;->e:Landroid/widget/LinearLayout;

    iget-object v5, p0, Ll/grk;->f:Ll/jl80;

    iget-object v6, p0, Ll/grk;->g:Ll/x20;

    iget-object v7, p0, Ll/grk;->h:Lv/VEditText;

    iget-object v8, p0, Ll/grk;->i:Landroid/widget/LinearLayout;

    iget-object v9, p0, Ll/grk;->j:Lv/VEditText;

    iget-object v10, p0, Ll/grk;->k:Lv/VText;

    iget-object v11, p0, Ll/grk;->l:Lv/VText;

    iget-object v12, p0, Ll/grk;->m:Lv/VButton;

    move-object v13, p1

    invoke-static/range {v0 .. v13}, Ll/qtk;->f0(ZLandroid/widget/TextView;[ZLcom/p1/mobile/android/app/Act;Landroid/widget/LinearLayout;Ll/jl80;Ll/x20;Lv/VEditText;Landroid/widget/LinearLayout;Lv/VEditText;Lv/VText;Lv/VText;Lv/VButton;Landroid/view/View;)V

    return-void
.end method
