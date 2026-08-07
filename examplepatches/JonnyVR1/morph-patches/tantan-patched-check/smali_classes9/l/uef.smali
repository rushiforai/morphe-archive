.class public final synthetic Ll/uef;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uef;->a:Lcom/p1/mobile/android/app/Act;

    iput p2, p0, Ll/uef;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uef;->a:Lcom/p1/mobile/android/app/Act;

    iget p0, p0, Ll/uef;->b:I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;->z(Lcom/p1/mobile/android/app/Act;ILandroid/view/View;)V

    return-void
.end method
