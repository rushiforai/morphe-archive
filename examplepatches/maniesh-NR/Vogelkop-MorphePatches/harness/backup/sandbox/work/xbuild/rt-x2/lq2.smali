.class public final Llq2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:F

.field public final c:Lq02;

.field public final d:Lq02;

.field public final synthetic e:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;Lq02;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llq2;->e:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    new-instance p1, Lq02;

    const/16 v0, 0x17

    invoke-direct {p1, p0, v0}, Lq02;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Llq2;->c:Lq02;

    iput-object p2, p0, Llq2;->d:Lq02;

    return-void
.end method
