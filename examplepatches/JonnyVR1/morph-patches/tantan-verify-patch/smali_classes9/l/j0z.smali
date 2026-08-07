.class public final synthetic Ll/j0z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j0z;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/j0z;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/j0z;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/j0z;->d:Lcom/p1/mobile/android/app/Dialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/j0z;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/j0z;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/j0z;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/j0z;->d:Lcom/p1/mobile/android/app/Dialog;

    invoke-static {v0, v1, v2, p0, p1}, Ll/u1z;->c1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V

    return-void
.end method
