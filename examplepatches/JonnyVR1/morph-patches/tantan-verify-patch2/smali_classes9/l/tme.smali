.class public final synthetic Ll/tme;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tme;->a:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tme;->a:Lcom/p1/mobile/android/app/Act;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView;->p(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
