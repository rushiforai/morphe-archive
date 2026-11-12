.class public final Lcom/opera/android/notifications/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/notifications/NotificationBridge$ActionInfo;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Landroid/graphics/Bitmap;

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/opera/android/notifications/NotificationBridge$ActionInfoArrayBuilder;Ljava/lang/String;Landroid/graphics/Bitmap;ILjava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/opera/android/notifications/a;->a:Ljava/lang/String;

    iput-object p3, p0, Lcom/opera/android/notifications/a;->b:Landroid/graphics/Bitmap;

    iput p4, p0, Lcom/opera/android/notifications/a;->c:I

    iput-object p5, p0, Lcom/opera/android/notifications/a;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/notifications/a;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final getIcon()Landroid/graphics/Bitmap;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/notifications/a;->b:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/notifications/a;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final getType()I
    .registers 1

    iget p0, p0, Lcom/opera/android/notifications/a;->c:I

    return p0
.end method
