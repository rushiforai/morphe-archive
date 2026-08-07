.class public final synthetic Ll/yn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lv/VEditText;

.field public final synthetic b:Lv/VEditText;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lv/VText;

.field public final synthetic e:Ll/pej0;

.field public final synthetic f:Ll/x20;

.field public final synthetic g:Ll/x20;

.field public final synthetic h:Lv/VButton;


# direct methods
.method public synthetic constructor <init>(Lv/VEditText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;Lv/VText;Ll/pej0;Ll/x20;Ll/x20;Lv/VButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yn;->a:Lv/VEditText;

    iput-object p2, p0, Ll/yn;->b:Lv/VEditText;

    iput-object p3, p0, Ll/yn;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/yn;->d:Lv/VText;

    iput-object p5, p0, Ll/yn;->e:Ll/pej0;

    iput-object p6, p0, Ll/yn;->f:Ll/x20;

    iput-object p7, p0, Ll/yn;->g:Ll/x20;

    iput-object p8, p0, Ll/yn;->h:Lv/VButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/yn;->a:Lv/VEditText;

    iget-object v1, p0, Ll/yn;->b:Lv/VEditText;

    iget-object v2, p0, Ll/yn;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/yn;->d:Lv/VText;

    iget-object v4, p0, Ll/yn;->e:Ll/pej0;

    iget-object v5, p0, Ll/yn;->f:Ll/x20;

    iget-object v6, p0, Ll/yn;->g:Ll/x20;

    iget-object v7, p0, Ll/yn;->h:Lv/VButton;

    move-object v8, p1

    invoke-static/range {v0 .. v8}, Ll/zn;->H(Lv/VEditText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;Lv/VText;Ll/pej0;Ll/x20;Ll/x20;Lv/VButton;Landroid/view/View;)V

    return-void
.end method
