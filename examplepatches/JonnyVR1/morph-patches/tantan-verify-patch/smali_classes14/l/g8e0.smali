.class public final synthetic Ll/g8e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g8e0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/g8e0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/g8e0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/g8e0;->d:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g8e0;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/g8e0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/g8e0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/g8e0;->d:Landroid/app/Activity;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/k8e0;->f(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/app/Activity;Ll/uxj0;)V

    return-void
.end method
