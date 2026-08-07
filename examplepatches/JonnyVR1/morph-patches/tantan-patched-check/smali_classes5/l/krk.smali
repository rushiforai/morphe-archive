.class public final synthetic Ll/krk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lv/VText;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/krk;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/krk;->b:Lv/VText;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/krk;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/krk;->b:Lv/VText;

    invoke-static {v0, p0, p1}, Ll/qtk;->M(Lcom/p1/mobile/android/app/Act;Lv/VText;Landroid/view/View;)V

    return-void
.end method
