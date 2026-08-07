.class public final synthetic Ll/ayv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;

.field public final synthetic b:Lcom/p1/mobile/android/app/Frag;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;Lcom/p1/mobile/android/app/Frag;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ayv;->a:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;

    iput-object p2, p0, Ll/ayv;->b:Lcom/p1/mobile/android/app/Frag;

    iput p3, p0, Ll/ayv;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ayv;->a:Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;

    iget-object v1, p0, Ll/ayv;->b:Lcom/p1/mobile/android/app/Frag;

    iget p0, p0, Ll/ayv;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;->a(Lcom/p1/mobile/putong/core/ui/main/LocationPermissionView;Lcom/p1/mobile/android/app/Frag;ILandroid/view/View;)V

    return-void
.end method
