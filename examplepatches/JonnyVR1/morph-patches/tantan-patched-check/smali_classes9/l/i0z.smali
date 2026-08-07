.class public final synthetic Ll/i0z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/u1z;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Ll/u1z;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i0z;->a:Ll/u1z;

    iput-object p2, p0, Ll/i0z;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/i0z;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/i0z;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/i0z;->e:Lcom/p1/mobile/android/app/Dialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/i0z;->a:Ll/u1z;

    iget-object v1, p0, Ll/i0z;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/i0z;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/i0z;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/i0z;->e:Lcom/p1/mobile/android/app/Dialog;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/u1z;->d1(Ll/u1z;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V

    return-void
.end method
