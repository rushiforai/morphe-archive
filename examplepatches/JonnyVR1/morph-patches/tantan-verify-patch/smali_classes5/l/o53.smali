.class public final synthetic Ll/o53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w53;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/w53;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o53;->a:Ll/w53;

    iput-object p2, p0, Ll/o53;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/o53;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/o53;->d:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o53;->a:Ll/w53;

    iget-object v1, p0, Ll/o53;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/o53;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ll/o53;->d:Z

    invoke-static {v0, v1, v2, p0, p1}, Ll/w53;->b(Ll/w53;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLandroid/view/View;)V

    return-void
.end method
