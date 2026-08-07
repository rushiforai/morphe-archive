.class public final synthetic Ll/lrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lv/VEditText;

.field public final synthetic b:Lv/VText;

.field public final synthetic c:Lv/VText;

.field public final synthetic d:Lv/VEditText;

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;

.field public final synthetic f:Z

.field public final synthetic g:Lv/VText;

.field public final synthetic h:Lv/VButton;


# direct methods
.method public synthetic constructor <init>(Lv/VEditText;Lv/VText;Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;ZLv/VText;Lv/VButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lrk;->a:Lv/VEditText;

    iput-object p2, p0, Ll/lrk;->b:Lv/VText;

    iput-object p3, p0, Ll/lrk;->c:Lv/VText;

    iput-object p4, p0, Ll/lrk;->d:Lv/VEditText;

    iput-object p5, p0, Ll/lrk;->e:Lcom/p1/mobile/android/app/Act;

    iput-boolean p6, p0, Ll/lrk;->f:Z

    iput-object p7, p0, Ll/lrk;->g:Lv/VText;

    iput-object p8, p0, Ll/lrk;->h:Lv/VButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/lrk;->a:Lv/VEditText;

    iget-object v1, p0, Ll/lrk;->b:Lv/VText;

    iget-object v2, p0, Ll/lrk;->c:Lv/VText;

    iget-object v3, p0, Ll/lrk;->d:Lv/VEditText;

    iget-object v4, p0, Ll/lrk;->e:Lcom/p1/mobile/android/app/Act;

    iget-boolean v5, p0, Ll/lrk;->f:Z

    iget-object v6, p0, Ll/lrk;->g:Lv/VText;

    iget-object v7, p0, Ll/lrk;->h:Lv/VButton;

    move-object v8, p1

    invoke-static/range {v0 .. v8}, Ll/qtk;->b0(Lv/VEditText;Lv/VText;Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;ZLv/VText;Lv/VButton;Landroid/view/View;)V

    return-void
.end method
