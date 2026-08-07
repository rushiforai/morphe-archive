.class public final synthetic Ll/fcm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/hcm;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/hcm;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fcm;->a:Ll/hcm;

    iput-object p2, p0, Ll/fcm;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fcm;->a:Ll/hcm;

    iget-object p0, p0, Ll/fcm;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0, p1}, Ll/hcm;->c(Ll/hcm;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
